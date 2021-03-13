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
package uk.co.reecedunn.intellij.plugin.xproc.schema

import com.intellij.lang.Language
import uk.co.reecedunn.intellij.plugin.xdm.schema.ISchemaType
import uk.co.reecedunn.intellij.plugin.xslt.lang.ValueTemplate

object AvtDatatype : ISchemaType {
    override val type: String = "avt.datatype"
    override val language: Language
        get() = ValueTemplate
}
