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
package uk.co.reecedunn.intellij.plugin.xdm.documentation

import com.intellij.openapi.application.PathManager
import com.intellij.openapi.components.ServiceManager
import com.intellij.openapi.progress.ProgressIndicator
import com.intellij.openapi.progress.ProgressManager
import com.intellij.openapi.progress.Task
import com.intellij.openapi.project.Project
import com.intellij.openapi.project.ProjectManager
import com.intellij.util.io.HttpRequests
import uk.co.reecedunn.intellij.plugin.intellij.resources.XdmBundle
import java.io.File

enum class XdmDocumentationDownloadStatus(val label: String) {
    NotDownloaded(XdmBundle.message("download-status.not-downloaded")),
    Downloading(XdmBundle.message("download-status.downloading")),
    Downloaded(XdmBundle.message("download-status.downloaded"))
}

class XdmDocumentationDownloader {
    var basePath: String? = null
        get() = field ?: "${PathManager.getSystemPath()}/xdm-cache/documentation"

    fun download(source: XdmDocumentationSource) {
        val file = File("$basePath/${source.path}")
        val project = ProjectManager.getInstance().defaultProject
        val title = XdmBundle.message("documentation-source.download.title")
        ProgressManager.getInstance().run(object : Task.Backgroundable(project, title) {
            override fun run(indicator: ProgressIndicator) {
                HttpRequests.request(source.href).saveToFile(file, indicator)
            }
        })
    }

    fun status(source: XdmDocumentationSource): XdmDocumentationDownloadStatus {
        return XdmDocumentationDownloadStatus.NotDownloaded
    }

    companion object {
        fun getInstance(): XdmDocumentationDownloader {
            return ServiceManager.getService(XdmDocumentationDownloader::class.java)
        }
    }
}
