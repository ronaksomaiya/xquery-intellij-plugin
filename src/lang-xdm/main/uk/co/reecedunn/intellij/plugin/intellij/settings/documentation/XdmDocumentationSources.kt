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
package uk.co.reecedunn.intellij.plugin.intellij.settings.documentation

import com.intellij.openapi.fileChooser.FileChooserDescriptorFactory
import com.intellij.openapi.options.Configurable
import com.intellij.openapi.ui.TextFieldWithBrowseButton
import com.intellij.util.text.nullize
import com.intellij.util.ui.ListTableModel
import uk.co.reecedunn.intellij.plugin.core.progress.TaskProgressListener
import uk.co.reecedunn.intellij.plugin.core.ui.layout.*
import uk.co.reecedunn.intellij.plugin.intellij.resources.XdmBundle
import uk.co.reecedunn.intellij.plugin.xdm.documentation.XdmDocumentationDownloader
import uk.co.reecedunn.intellij.plugin.xdm.documentation.XdmDocumentationSource
import uk.co.reecedunn.intellij.plugin.xdm.documentation.XdmDocumentationSourceProvider
import javax.swing.JComponent

class XdmDocumentationSources : Configurable, TaskProgressListener<XdmDocumentationSource> {
    // region Configurable

    private lateinit var cachePath: TextFieldWithBrowseButton
    private lateinit var sources: TableView<XdmDocumentationSource>

    override fun getDisplayName(): String = XdmBundle.message("settings.document-sources.title")

    override fun createComponent(): JComponent? = panel {
        label(XdmBundle.message("documentation-source.cache-path.label"), grid(0, 0))
        cachePath = textFieldWithBrowseButton(grid(1, 0)) {
            val descriptor = FileChooserDescriptorFactory.createSingleFolderDescriptor()
            addBrowseFolderListener(null, null, null, descriptor)
        }

        scrollable(grid(0, 1)) {
            sources = tableView {
                setModelAndUpdateColumns(ListTableModel<XdmDocumentationSource>(*COLUMNS))

                XdmDocumentationSourceProvider.allSources.forEach { source -> add(source) }
                XdmDocumentationDownloader.getInstance().addListener(this@XdmDocumentationSources)
            }
        }
    }

    override fun disposeUIResources() {
        XdmDocumentationDownloader.getInstance().removeListener(this)
    }

    override fun isModified(): Boolean {
        return XdmDocumentationDownloader.getInstance().basePath != cachePath.text
    }

    override fun apply() {
        XdmDocumentationDownloader.getInstance().basePath = cachePath.text.nullize()
        sources.updateAll()
    }

    override fun reset() {
        cachePath.text = XdmDocumentationDownloader.getInstance().basePath!!
        sources.updateAll()
    }

    // endregion
    // region TaskProgressListener<XdmDocumentationSource>

    override fun started(context: XdmDocumentationSource) {
        sources.update(context)
    }

    override fun stopped(context: XdmDocumentationSource) {
        sources.update(context)
    }

    // endregion
}
