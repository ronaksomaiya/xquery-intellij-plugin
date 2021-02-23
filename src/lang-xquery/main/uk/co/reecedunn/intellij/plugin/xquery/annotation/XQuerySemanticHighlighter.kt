/*
 * Copyright (C) 2021 Reece H. Dunn
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
package uk.co.reecedunn.intellij.plugin.xquery.annotation

import com.intellij.openapi.editor.colors.TextAttributesKey
import com.intellij.psi.PsiElement
import uk.co.reecedunn.intellij.plugin.xpm.context.XpmUsageType
import uk.co.reecedunn.intellij.plugin.xpath.model.getUsageType
import uk.co.reecedunn.intellij.plugin.xpm.intellij.annotation.XpmSemanticHighlighter
import uk.co.reecedunn.intellij.plugin.xquery.intellij.lexer.XQuerySyntaxHighlighterColors

object XQuerySemanticHighlighter : XpmSemanticHighlighter {
    private fun getVariableHighlighting(element: PsiElement?): TextAttributesKey = when (element?.getUsageType()) {
        XpmUsageType.Parameter -> XQuerySyntaxHighlighterColors.PARAMETER
        else -> XQuerySyntaxHighlighterColors.VARIABLE
    }

    override fun getHighlighting(element: PsiElement): TextAttributesKey = when (element.getUsageType()) {
        XpmUsageType.Annotation -> XQuerySyntaxHighlighterColors.ANNOTATION
        XpmUsageType.Attribute -> XQuerySyntaxHighlighterColors.ATTRIBUTE
        XpmUsageType.DecimalFormat -> XQuerySyntaxHighlighterColors.DECIMAL_FORMAT
        XpmUsageType.Element -> XQuerySyntaxHighlighterColors.ELEMENT
        XpmUsageType.FunctionDecl -> XQuerySyntaxHighlighterColors.FUNCTION_DECL
        XpmUsageType.FunctionRef -> XQuerySyntaxHighlighterColors.FUNCTION_CALL
        XpmUsageType.MapKey -> XQuerySyntaxHighlighterColors.MAP_KEY
        XpmUsageType.Namespace -> XQuerySyntaxHighlighterColors.NS_PREFIX
        XpmUsageType.Option -> XQuerySyntaxHighlighterColors.OPTION
        XpmUsageType.Parameter -> XQuerySyntaxHighlighterColors.PARAMETER
        XpmUsageType.Pragma -> XQuerySyntaxHighlighterColors.PRAGMA
        XpmUsageType.ProcessingInstruction -> XQuerySyntaxHighlighterColors.PROCESSING_INSTRUCTION
        XpmUsageType.Type -> XQuerySyntaxHighlighterColors.TYPE
        XpmUsageType.Variable -> getVariableHighlighting(element.reference?.resolve())
        XpmUsageType.Unknown -> XQuerySyntaxHighlighterColors.IDENTIFIER
    }
}
