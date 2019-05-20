/*
 * Copyright (C) 2016-2017, 2019 Reece H. Dunn
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
package uk.co.reecedunn.intellij.plugin.xquery.psi.impl.plugin

import com.intellij.extapi.psi.ASTWrapperPsiElement
import com.intellij.lang.ASTNode
import com.intellij.psi.PsiElement
import uk.co.reecedunn.intellij.plugin.intellij.lang.*
import uk.co.reecedunn.intellij.plugin.xpath.model.XdmBinary
import uk.co.reecedunn.intellij.plugin.xpath.model.XdmItemType
import uk.co.reecedunn.intellij.plugin.xquery.ast.plugin.PluginBinaryTest

class PluginBinaryTestPsiImpl(node: ASTNode) :
    ASTWrapperPsiElement(node), PluginBinaryTest, XdmItemType, VersionConformance {
    // region XdmSequenceType

    override val typeName: String = "binary()"

    override val itemType get(): XdmItemType = this

    override val lowerBound: Int? = 1

    override val upperBound: Int? = 1

    // endregion
    // region XdmItemType

    override val typeClass: Class<*> = XdmBinary::class.java

    // endregion
    // region VersionConformance

    override val requiresConformance get(): List<Version> = listOf(MarkLogic.VERSION_4_0, XQuerySpec.MARKLOGIC_0_9)

    override val conformanceElement get(): PsiElement = firstChild

    // endregion
}
