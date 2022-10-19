/*
 * Copyright (C) 2016-2022 Reece H. Dunn
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package uk.co.reecedunn.intellij.plugin.xquery.lexer

import uk.co.reecedunn.intellij.plugin.core.lexer.*
import uk.co.reecedunn.intellij.plugin.core.lexer.CharacterClass
import xqt.platform.xml.lexer.*

@Suppress("DuplicatedCode")
class XQDocLexer : LexerImpl(STATE_CONTENTS) {
    // region States

    private fun matchEntityReference() {
        mType = when (mTokenRange.matchEntityReference()) {
            EntityReferenceType.EmptyEntityReference -> XQDocTokenType.EMPTY_ENTITY_REFERENCE
            EntityReferenceType.PartialEntityReference -> XQDocTokenType.PARTIAL_ENTITY_REFERENCE
            EntityReferenceType.CharacterReference -> XQDocTokenType.CHARACTER_REFERENCE
            else -> XQDocTokenType.PREDEFINED_ENTITY_REFERENCE
        }
    }

    private fun stateDefault() {
        when (mTokenRange.codePoint.codepoint) {
            CodePointRange.END_OF_BUFFER.codepoint -> mType = null
            '~'.code -> {
                mTokenRange.match()
                mType = XQDocTokenType.XQDOC_COMMENT_MARKER
                pushState(STATE_CONTENTS)
                pushState(STATE_TRIM)
            }
            else -> {
                pushState(STATE_XQUERY_CONTENTS)
                pushState(STATE_XQUERY_CONTENTS_TRIM)
                advance()
            }
        }
    }

    private fun stateContents() {
        var c = mTokenRange.codePoint.codepoint
        when (c) {
            CodePointRange.END_OF_BUFFER.codepoint -> mType = null
            '<'.code -> {
                mTokenRange.match()
                mType = XQDocTokenType.OPEN_XML_TAG
                pushState(STATE_ELEM_CONSTRUCTOR)
            }
            '\n'.code, '\r'.code -> { // U+000A, U+000D
                pushState(STATE_TRIM)
                stateTrim(STATE_TRIM)
            }
            '&'.code -> matchEntityReference() // XML PredefinedEntityRef and CharRef
            else -> while (true)
                when (c) {
                    '\n'.code, '\r'.code -> { // U+000A, U+000D
                        pushState(STATE_TRIM)
                        mType = XQDocTokenType.CONTENTS
                        return
                    }
                    CodePointRange.END_OF_BUFFER.codepoint, '<'.code, '&'.code -> {
                        mType = XQDocTokenType.CONTENTS
                        return
                    }
                    else -> {
                        mTokenRange.match()
                        c = mTokenRange.codePoint.codepoint
                    }
                }
        }
    }

    private fun stateXQueryContents() {
        var c = mTokenRange.codePoint.codepoint
        when (c) {
            CodePointRange.END_OF_BUFFER.codepoint -> mType = null
            '\n'.code, '\r'.code -> { // U+000A, U+000D
                pushState(STATE_XQUERY_CONTENTS_TRIM)
                stateTrim(STATE_XQUERY_CONTENTS_TRIM)
            }
            else -> while (true)
                when (c) {
                    '\n'.code, '\r'.code -> { // U+000A, U+000D
                        pushState(STATE_XQUERY_CONTENTS_TRIM)
                        mType = XQDocTokenType.CONTENTS
                        return
                    }
                    CodePointRange.END_OF_BUFFER.codepoint -> {
                        mType = XQDocTokenType.CONTENTS
                        return
                    }
                    else -> {
                        mTokenRange.match()
                        c = mTokenRange.codePoint.codepoint
                    }
                }
        }
    }

    private fun stateTaggedContents() {
        var c = mTokenRange.codePoint.codepoint
        if (c in AlphaNumeric) {
            while (c in AlphaNumeric) {
                mTokenRange.match()
                c = mTokenRange.codePoint.codepoint
            }
            mType = TAG_NAMES[tokenText] ?: XQDocTokenType.TAG
            if (mType === XQDocTokenType.T_PARAM) {
                popState()
                pushState(STATE_PARAM_TAG_CONTENTS_START)
            }
        } else if (c == ' '.code || c == '\t'.code) {
            while (c == ' '.code || c == '\t'.code) {
                mTokenRange.match()
                c = mTokenRange.codePoint.codepoint
            }
            mType = XQDocTokenType.WHITE_SPACE
            popState()
        } else {
            popState()
            stateContents()
        }
    }

    private fun stateParamTagContentsStart() {
        var c = mTokenRange.codePoint.codepoint
        if (c == ' '.code || c == '\t'.code) {
            while (c == ' '.code || c == '\t'.code) {
                mTokenRange.match()
                c = mTokenRange.codePoint.codepoint
            }
            mType = XQDocTokenType.WHITE_SPACE
        } else if (c == '$'.code) {
            mTokenRange.match()
            mType = XQDocTokenType.VARIABLE_INDICATOR
            popState()
            pushState(STATE_PARAM_TAG_VARNAME)
        } else {
            popState()
            stateContents()
        }
    }

    private fun stateParamTagVarName() {
        var cc = CharacterClass.getCharClass(mTokenRange.codePoint.codepoint)
        when (cc) {
            CharacterClass.WHITESPACE -> {
                mTokenRange.match()
                while (CharacterClass.getCharClass(mTokenRange.codePoint.codepoint) == CharacterClass.WHITESPACE)
                    mTokenRange.match()
                mType = XQDocTokenType.WHITE_SPACE
                popState()
            }
            CharacterClass.NAME_START_CHAR // XQuery/XML NCName token rules.
            -> {
                mTokenRange.match()
                cc = CharacterClass.getCharClass(mTokenRange.codePoint.codepoint)
                while (
                    cc == CharacterClass.NAME_START_CHAR ||
                    cc == CharacterClass.DIGIT ||
                    cc == CharacterClass.DOT ||
                    cc == CharacterClass.HYPHEN_MINUS ||
                    cc == CharacterClass.NAME_CHAR
                ) {
                    mTokenRange.match()
                    cc = CharacterClass.getCharClass(mTokenRange.codePoint.codepoint)
                }
                mType = XQDocTokenType.NCNAME
            }
            else -> {
                popState()
                stateContents()
            }
        }
    }

    private fun stateElemConstructor(state: Int) {
        var c = mTokenRange.codePoint.codepoint
        when (c) {
            CodePointRange.END_OF_BUFFER.codepoint -> mType = null
            in AlphaNumeric -> {
                while (c in AlphaNumeric) {
                    mTokenRange.match()
                    c = mTokenRange.codePoint.codepoint
                }
                mType = XQDocTokenType.XML_TAG
            }
            ' '.code, '\t'.code, '\r'.code, '\n'.code -> {
                while (c == ' '.code || c == '\t'.code || c == '\r'.code || c == '\n'.code) {
                    mTokenRange.match()
                    c = mTokenRange.codePoint.codepoint
                }
                mType = XQDocTokenType.WHITE_SPACE
            }
            '='.code -> {
                mTokenRange.match()
                mType = XQDocTokenType.XML_EQUAL
            }
            '"'.code -> {
                mTokenRange.match()
                mType = XQDocTokenType.XML_ATTRIBUTE_VALUE_START
                pushState(STATE_ATTRIBUTE_VALUE_QUOTE)
            }
            '\''.code -> {
                mTokenRange.match()
                mType = XQDocTokenType.XML_ATTRIBUTE_VALUE_START
                pushState(STATE_ATTRIBUTE_VALUE_APOS)
            }
            '/'.code -> {
                mTokenRange.match()
                if (mTokenRange.codePoint.codepoint == '>'.code) {
                    mTokenRange.match()
                    mType = XQDocTokenType.SELF_CLOSING_XML_TAG
                    popState()
                } else {
                    mType = XQDocTokenType.INVALID
                }
            }
            '>'.code -> {
                mTokenRange.match()
                mType = XQDocTokenType.END_XML_TAG
                popState()
                if (state == STATE_ELEM_CONSTRUCTOR) {
                    pushState(STATE_ELEM_CONTENTS)
                }
            }
            else -> {
                mTokenRange.match()
                mType = XQDocTokenType.INVALID
            }
        }
    }

    private fun stateElemContents() {
        var c = mTokenRange.codePoint.codepoint
        when (c) {
            CodePointRange.END_OF_BUFFER.codepoint -> mType = null
            '<'.code -> {
                mTokenRange.match()
                if (mTokenRange.codePoint.codepoint == '/'.code) {
                    mTokenRange.match()
                    mType = XQDocTokenType.CLOSE_XML_TAG
                    popState()
                    pushState(STATE_ELEM_CONSTRUCTOR_CLOSING)
                } else {
                    mType = XQDocTokenType.OPEN_XML_TAG
                    pushState(STATE_ELEM_CONSTRUCTOR)
                }
            }
            '&'.code -> matchEntityReference() // XML PredefinedEntityRef and CharRef
            else -> {
                mTokenRange.match()
                c = mTokenRange.codePoint.codepoint
                while (true)
                    when (c) {
                        CodePointRange.END_OF_BUFFER.codepoint, '<'.code, '&'.code -> {
                            mType = XQDocTokenType.XML_ELEMENT_CONTENTS
                            return
                        }
                        else -> {
                            mTokenRange.match()
                            c = mTokenRange.codePoint.codepoint
                        }
                    }
            }
        }
    }

    private fun stateAttributeValue(endChar: Int) {
        var c = mTokenRange.codePoint.codepoint
        when (c) {
            CodePointRange.END_OF_BUFFER.codepoint -> mType = null
            endChar -> {
                mTokenRange.match()
                mType = XQDocTokenType.XML_ATTRIBUTE_VALUE_END
                popState()
            }
            else -> {
                while (c != CodePointRange.END_OF_BUFFER.codepoint && c != endChar) {
                    mTokenRange.match()
                    c = mTokenRange.codePoint.codepoint
                }
                mType = XQDocTokenType.XML_ATTRIBUTE_VALUE_CONTENTS
            }
        }
    }

    private fun stateTrim(state: Int) {
        var c = mTokenRange.codePoint.codepoint
        when (c) {
            CodePointRange.END_OF_BUFFER.codepoint -> mType = null
            ' '.code, '\t'.code -> {
                while (c == ' '.code || c == '\t'.code) {
                    mTokenRange.match()
                    c = mTokenRange.codePoint.codepoint
                }
                mType = XQDocTokenType.WHITE_SPACE
            }
            '\r'.code, '\n'.code -> { // U+000D, U+000A
                mTokenRange.match()
                if (c == '\r'.code && mTokenRange.codePoint.codepoint == '\n'.code) {
                    mTokenRange.match()
                }

                c = mTokenRange.codePoint.codepoint
                while (c == ' '.code || c == '\t'.code) { // U+0020 || U+0009
                    mTokenRange.match()
                    c = mTokenRange.codePoint.codepoint
                }

                if (c == ':'.code) {
                    mTokenRange.match()
                }

                mType = XQDocTokenType.TRIM
            }
            '@'.code -> {
                if (state == STATE_TRIM) {
                    mTokenRange.match()
                    mType = XQDocTokenType.TAG_MARKER
                    popState()
                    pushState(STATE_TAGGED_CONTENTS)
                } else {
                    popState()
                    advance()
                }
            }
            else -> {
                popState()
                advance()
            }
        }
    }

    // endregion
    // region Lexer

    override fun advance(state: Int): Unit = when (state) {
        STATE_DEFAULT -> stateDefault()
        STATE_CONTENTS -> stateContents()
        STATE_TAGGED_CONTENTS -> stateTaggedContents()
        STATE_ELEM_CONSTRUCTOR, STATE_ELEM_CONSTRUCTOR_CLOSING -> stateElemConstructor(state)
        STATE_ELEM_CONTENTS -> stateElemContents()
        STATE_ATTRIBUTE_VALUE_QUOTE -> stateAttributeValue('"'.code)
        STATE_ATTRIBUTE_VALUE_APOS -> stateAttributeValue('\''.code)
        STATE_TRIM, STATE_XQUERY_CONTENTS_TRIM -> stateTrim(state)
        STATE_PARAM_TAG_CONTENTS_START -> stateParamTagContentsStart()
        STATE_PARAM_TAG_VARNAME -> stateParamTagVarName()
        STATE_XQUERY_CONTENTS -> stateXQueryContents()
        else -> throw AssertionError("Invalid state: $state")
    }

    // endregion

    companion object {
        // region State Constants

        private const val STATE_CONTENTS = 1
        private const val STATE_TAGGED_CONTENTS = 2
        private const val STATE_ELEM_CONSTRUCTOR = 3
        private const val STATE_ELEM_CONTENTS = 4
        private const val STATE_ELEM_CONSTRUCTOR_CLOSING = 5
        private const val STATE_ATTRIBUTE_VALUE_QUOTE = 6
        private const val STATE_ATTRIBUTE_VALUE_APOS = 7
        private const val STATE_TRIM = 8
        private const val STATE_PARAM_TAG_CONTENTS_START = 9
        private const val STATE_PARAM_TAG_VARNAME = 10
        private const val STATE_XQUERY_CONTENTS = 11
        private const val STATE_XQUERY_CONTENTS_TRIM = 12

        // endregion

        private val TAG_NAMES = mapOf(
            "author" to XQDocTokenType.T_AUTHOR,
            "deprecated" to XQDocTokenType.T_DEPRECATED,
            "error" to XQDocTokenType.T_ERROR,
            "param" to XQDocTokenType.T_PARAM,
            "return" to XQDocTokenType.T_RETURN,
            "see" to XQDocTokenType.T_SEE,
            "since" to XQDocTokenType.T_SINCE,
            "version" to XQDocTokenType.T_VERSION
        )
    }
}
