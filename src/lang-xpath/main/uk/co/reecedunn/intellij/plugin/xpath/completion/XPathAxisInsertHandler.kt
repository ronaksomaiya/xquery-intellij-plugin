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
package uk.co.reecedunn.intellij.plugin.xpath.completion

import com.intellij.codeInsight.completion.InsertHandler
import com.intellij.codeInsight.completion.InsertionContext
import com.intellij.codeInsight.lookup.LookupElement

object XPathAxisInsertHandler : InsertHandler<LookupElement> {
    override fun handleInsert(context: InsertionContext, item: LookupElement) {
        val chars = context.document.charsSequence
        if (chars.length == context.tailOffset || chars[context.tailOffset] != ':') { // No ':'
            context.document.insertString(context.tailOffset, "::")
        } else if (chars.length == context.tailOffset + 1 || chars[context.tailOffset + 1] != ':') { // Single ':'
            context.document.insertString(context.tailOffset, ":")
        }

        // Place the cursor after the axis marker.
        context.editor.caretModel.let { it.moveToOffset(it.offset + 2) }
    }
}
