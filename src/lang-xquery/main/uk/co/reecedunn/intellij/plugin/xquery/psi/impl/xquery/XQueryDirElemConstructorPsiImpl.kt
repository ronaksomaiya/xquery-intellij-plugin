/*
 * Copyright (C) 2016-2021 Reece H. Dunn
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
package uk.co.reecedunn.intellij.plugin.xquery.psi.impl.xquery

import com.intellij.lang.ASTNode
import com.intellij.openapi.util.Key
import com.intellij.psi.PsiElement
import com.intellij.psi.TokenType
import com.intellij.psi.util.elementType
import uk.co.reecedunn.intellij.plugin.core.psi.ASTWrapperPsiElement
import uk.co.reecedunn.intellij.plugin.core.psi.nextSiblingIfSelf
import uk.co.reecedunn.intellij.plugin.core.sequences.children
import uk.co.reecedunn.intellij.plugin.xdm.types.*
import uk.co.reecedunn.intellij.plugin.xpath.ast.filterExpressions
import uk.co.reecedunn.intellij.plugin.xpath.ast.xpath.XPathExpr
import uk.co.reecedunn.intellij.plugin.xpath.psi.impl.enclosedExpressionBlocks
import uk.co.reecedunn.intellij.plugin.xpm.lang.validation.XpmSyntaxValidationElement
import uk.co.reecedunn.intellij.plugin.xpm.optree.expression.XpmExpression
import uk.co.reecedunn.intellij.plugin.xquery.ast.xquery.XQueryDirElemConstructor
import uk.co.reecedunn.intellij.plugin.xquery.lexer.XQueryTokenType
import uk.co.reecedunn.intellij.plugin.xquery.parser.XQueryElementType
import java.util.*

class XQueryDirElemConstructorPsiImpl(node: ASTNode) :
    ASTWrapperPsiElement(node),
    XQueryDirElemConstructor,
    XpmSyntaxValidationElement {
    companion object {
        private val STRING_VALUE = Key.create<Optional<String>>("STRING_VALUE")
    }
    // region XpmExpression

    override val expressionElement: PsiElement
        get() = this

    // endregion
    // region XdmElementNode

    override val attributes: Sequence<XdmAttributeNode>
        get() = filterExpressions()

    override val nodeName: XsQNameValue?
        get() = children().filterIsInstance<XsQNameValue>().firstOrNull()

    override val parentNode: XdmNode?
        get() = when (val parent = parent) {
            is XdmNode -> parent
            is XPathExpr -> parent.parent as? XdmNode
            else -> null
        }

    override val stringValue: String?
        get() = computeUserDataIfAbsent(STRING_VALUE) {
            val value = StringBuilder()
            children().forEach { child ->
                when (child) {
                    is XdmTextNode -> value.append(child.stringValue ?: "")
                    is XdmElementNode -> {
                        val stringValue = child.stringValue ?: return@computeUserDataIfAbsent Optional.empty()
                        value.append(stringValue)
                    }
                    is XpmExpression -> return@computeUserDataIfAbsent Optional.empty()
                    else -> {
                    }
                }
            }
            Optional.of(value.toString())
        }.orElse(null)

    // endregion
    // region XQueryDirElemConstructor

    override val closingTag: XsQNameValue?
        get() = children().filterIsInstance<XsQNameValue>().lastOrNull()

    override val dirAttributeListStartElement: PsiElement
        get() {
            var start: PsiElement = firstChild
            start = start.nextSiblingIfSelf { it.elementType === XQueryTokenType.OPEN_XML_TAG }
            start = start.nextSiblingIfSelf { it.elementType === TokenType.ERROR_ELEMENT } // whitespace
            start = start.nextSiblingIfSelf { it.elementType in XQueryElementType.XML_NAME }
            start = start.nextSiblingIfSelf { it.elementType === XQueryTokenType.XML_WHITE_SPACE }
            return start
        }

    // endregion
    // region XpmSyntaxValidationElement

    override val conformanceElement: PsiElement
        get() = when (val expr = enclosedExpressionBlocks.find { it.isEmpty }) {
            null -> firstChild
            else -> expr.open
        }

    // endregion
}
