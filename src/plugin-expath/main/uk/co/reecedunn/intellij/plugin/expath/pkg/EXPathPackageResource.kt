/*
 * Copyright (C) 2019 Reece H. Dunn
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
package uk.co.reecedunn.intellij.plugin.expath.pkg

import com.intellij.psi.PsiElement
import uk.co.reecedunn.intellij.plugin.core.xml.XmlElement
import uk.co.reecedunn.intellij.plugin.xdm.model.XdmUriContext
import uk.co.reecedunn.intellij.plugin.xdm.model.XsAnyUri
import uk.co.reecedunn.intellij.plugin.xdm.model.XsAnyUriValue
import uk.co.reecedunn.intellij.plugin.xdm.module.path.XdmModuleType

data class EXPathPackageResource(private val xml: XmlElement) : EXPathPackageComponent {
    val publicUri: XsAnyUriValue? by lazy {
        xml.children("public-uri").firstOrNull()?.text()?.let {
            XsAnyUri(it, XdmUriContext.Resource, XdmModuleType.RESOURCE, null as? PsiElement?)
        }
    }

    override val moduleType: XdmModuleType = XdmModuleType.Resource

    override val file: String? by lazy { xml.children("file").firstOrNull()?.text() }
}
