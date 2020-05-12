/*
 * Copyright (C) 2018-2020 Reece H. Dunn
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
package uk.co.reecedunn.intellij.plugin.existdb.query.rest

import com.intellij.lang.Language
import com.intellij.openapi.vfs.VirtualFile
import org.apache.http.client.methods.HttpUriRequest
import org.apache.http.client.methods.RequestBuilder
import org.apache.http.entity.StringEntity
import org.apache.http.util.EntityUtils
import uk.co.reecedunn.intellij.plugin.core.vfs.decode
import uk.co.reecedunn.intellij.plugin.core.xml.XmlDocument
import uk.co.reecedunn.intellij.plugin.existdb.resources.EXistDBQueries
import uk.co.reecedunn.intellij.plugin.intellij.lang.XPathSubset
import uk.co.reecedunn.intellij.plugin.processor.query.http.HttpConnection
import uk.co.reecedunn.intellij.plugin.processor.query.QueryResult
import uk.co.reecedunn.intellij.plugin.processor.query.QueryResults
import uk.co.reecedunn.intellij.plugin.processor.query.RunnableQuery
import uk.co.reecedunn.intellij.plugin.processor.query.http.BuildableQuery
import uk.co.reecedunn.intellij.plugin.xdm.types.impl.values.XsDuration

internal class EXistDBQuery(
    private val builder: RequestBuilder,
    private val queryFile: VirtualFile,
    private val connection: HttpConnection
) : RunnableQuery, BuildableQuery {
    companion object {
        private val EXIST_NAMESPACES = mapOf(
            "exist" to "http://exist.sourceforge.net/NS/exist"
        )
    }

    override var rdfOutputFormat: Language? = null

    override var updating: Boolean = false

    override var xpathSubset: XPathSubset = XPathSubset.XPath

    override var server: String = ""

    override var database: String = ""

    override var modulePath: String = ""

    override fun bindVariable(name: String, value: Any?, type: String?) {
        throw UnsupportedOperationException()
    }

    override fun bindContextItem(value: Any?, type: String?) {
        throw UnsupportedOperationException()
    }

    override fun request(): HttpUriRequest {
        val xml = XmlDocument.parse(EXistDBQueries.PostQueryTemplate, mapOf())
        xml.root.children("text").first().appendChild(xml.doc.createCDATASection(queryFile.decode()!!))

        builder.entity = StringEntity(xml.toXmlString())
        return builder.build()
    }

    override fun run(): QueryResults {
        val start = System.nanoTime()
        val response = connection.execute(request())
        val end = System.nanoTime()

        val body = EntityUtils.toString(response.entity)
        response.close()

        if (response.statusLine.statusCode == 400) {
            throw body.toEXistDBQueryError(queryFile)
        }

        var position: Long = -1
        val result = XmlDocument.parse(body, EXIST_NAMESPACES)
        val results = result.root.children("exist:value").map { value ->
            val type = value.attribute("exist:type")!!
            QueryResult.fromItemType(++position, value.text() ?: "", type)
        }
        return QueryResults(response.statusLine, results.toList(), XsDuration.ns(end - start))
    }

    override fun close() {
    }
}
