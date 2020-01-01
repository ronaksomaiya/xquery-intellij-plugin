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
package uk.co.reecedunn.intellij.plugin.intellij.tests.documentation

import uk.co.reecedunn.intellij.plugin.xdm.documentation.XdmDocumentationIndex
import uk.co.reecedunn.intellij.plugin.xdm.documentation.XdmDocumentationReference
import uk.co.reecedunn.intellij.plugin.xdm.documentation.XdmDocumentationSource
import uk.co.reecedunn.intellij.plugin.xdm.documentation.XdmDocumentationSourceProvider
import uk.co.reecedunn.intellij.plugin.xdm.functions.XdmFunctionReference

object DocumentationSourceProvider : XdmDocumentationSourceProvider, XdmDocumentationIndex {
    // region XdmDocumentationSourceProvider

    override val sources: List<XdmDocumentationSource> = listOf()

    // endregion
    // region XdmDocumentationIndex

    override fun invalidate() {}

    override fun lookup(ref: XdmFunctionReference): XdmDocumentationReference? {
        return object : XdmDocumentationReference {
            val name: String = ref.functionName?.let {
                "[prefix=${it.prefix?.data ?: "(null)"} namespace=${it.namespace?.data ?: "(null)"} localname=${it.localName?.data ?: "(null)"}]"
            } ?: "(null)"

            override val href: String = "function href=${name}#${ref.arity}"

            override val documentation: String = "function documentation=${name}#${ref.arity}"

            override val summary: String = "function summary=${name}#${ref.arity}"
        }
    }

    // endregion
}
