/*
 * Copyright (C) 2016, 2019 Reece H. Dunn
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
package uk.co.reecedunn.intellij.plugin.xpath.psi.impl.xpath

import com.intellij.extapi.psi.ASTWrapperPsiElement
import com.intellij.lang.ASTNode
import uk.co.reecedunn.intellij.plugin.core.data.CacheableProperty
import uk.co.reecedunn.intellij.plugin.core.sequences.children
import uk.co.reecedunn.intellij.plugin.xpath.ast.xpath.XPathAttributeTest
import uk.co.reecedunn.intellij.plugin.xdm.functions.op.op_qname_presentation
import uk.co.reecedunn.intellij.plugin.xdm.model.XdmAttribute
import uk.co.reecedunn.intellij.plugin.xdm.model.XdmItemType
import uk.co.reecedunn.intellij.plugin.xdm.model.XdmSequenceType
import uk.co.reecedunn.intellij.plugin.xdm.model.XsQNameValue

class XPathAttributeTestPsiImpl(node: ASTNode) : ASTWrapperPsiElement(node), XPathAttributeTest, XdmItemType {
    // region ASTDelegatePsiElement

    override fun subtreeChanged() {
        super.subtreeChanged()
        cachedTypeName.invalidate()
    }

    // endregion
    // region XPathAttributeTest

    override val nodeName get(): XsQNameValue? = children().filterIsInstance<XsQNameValue>().firstOrNull()

    override val nodeType get(): XdmSequenceType? = children().filterIsInstance<XdmSequenceType>().firstOrNull()

    // endregion
    // region XdmSequenceType

    private val cachedTypeName = CacheableProperty {
        val name = nodeName
        val type = nodeType
        when {
            name == null -> {
                type?.let { "attribute(*,${type.typeName})" } ?: "attribute()"
            }
            type == null -> "attribute(${op_qname_presentation(name)})"
            else -> "attribute(${op_qname_presentation(name)},${type.typeName})"
        }
    }
    override val typeName get(): String = cachedTypeName.get()!!

    override val itemType get(): XdmItemType = this

    override val lowerBound: Int? = 1

    override val upperBound: Int? = 1

    // endregion
    // region XdmItemType

    override val typeClass: Class<*> = XdmAttribute::class.java

    // endregion
}
