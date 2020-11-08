/*
 * Copyright (C) 2020 Reece H. Dunn
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
package uk.co.reecedunn.intellij.plugin.xpath.psi.impl.plugin

import com.intellij.extapi.psi.ASTWrapperPsiElement
import com.intellij.lang.ASTNode
import com.intellij.psi.PsiElement
import uk.co.reecedunn.intellij.plugin.core.sequences.children
import uk.co.reecedunn.intellij.plugin.xdm.types.XdmItemType
import uk.co.reecedunn.intellij.plugin.xdm.types.XdmNodeItem
import uk.co.reecedunn.intellij.plugin.xdm.types.XsQNameValue
import uk.co.reecedunn.intellij.plugin.xpath.ast.plugin.PluginDynamicFunctionCall
import uk.co.reecedunn.intellij.plugin.xpath.ast.xpath.XPathArgumentList
import uk.co.reecedunn.intellij.plugin.xpm.optree.function.XpmFunctionReference
import uk.co.reecedunn.intellij.plugin.xpm.optree.XpmAxisType
import uk.co.reecedunn.intellij.plugin.xpm.optree.XpmPredicate

class PluginDynamicFunctionCallPsiImpl(node: ASTNode) : ASTWrapperPsiElement(node), PluginDynamicFunctionCall {
    // region XpmPathStep

    override val axisType: XpmAxisType = XpmAxisType.Self

    override val nodeName: XsQNameValue? = null

    override val nodeType: XdmItemType = XdmNodeItem

    override val predicate: XpmPredicate? = null

    // endregion
    // region XpmExpression

    override val expressionElement: PsiElement?
        get() = children().filterIsInstance<XPathArgumentList>().first()

    // endregion
    // region XpmDynamicFunctionReference

    override val functionReference: XpmFunctionReference?
        get() = children().filterIsInstance<XpmFunctionReference>().firstOrNull()

    // endregion
}
