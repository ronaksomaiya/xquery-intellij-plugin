/*
 * Copyright (C) 2016-2018 Reece H. Dunn
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
import com.intellij.openapi.util.TextRange
import com.intellij.psi.PsiReference
import uk.co.reecedunn.intellij.plugin.xpath.model.XsAnyAtomicType
import uk.co.reecedunn.intellij.plugin.xpath.model.XsAnyUri
import uk.co.reecedunn.intellij.plugin.xpath.psi.impl.xpath.XPathStringLiteralPsiImpl
import uk.co.reecedunn.intellij.plugin.xquery.ast.xquery.XQueryUriLiteral
import uk.co.reecedunn.intellij.plugin.xquery.psi.reference.XQueryUriLiteralReference

class XQueryUriLiteralPsiImpl(node: ASTNode): XPathStringLiteralPsiImpl(node), XQueryUriLiteral {
    override fun getReference(): PsiReference {
        val range = textRange
        return XQueryUriLiteralReference(this, TextRange(1, range.length - 1))
    }

    override val value: XsAnyAtomicType get() = XsAnyUri(cachedContent.get()!!, this)
}
