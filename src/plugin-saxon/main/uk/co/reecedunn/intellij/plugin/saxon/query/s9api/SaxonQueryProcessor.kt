/*
 * Copyright (C) 2018 Reece H. Dunn
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
package uk.co.reecedunn.intellij.plugin.saxon.query.s9api

import com.intellij.lang.Language
import uk.co.reecedunn.intellij.plugin.core.async.ExecutableOnPooledThread
import uk.co.reecedunn.intellij.plugin.core.async.local_thread
import uk.co.reecedunn.intellij.plugin.core.reflection.getMethodOrNull
import uk.co.reecedunn.intellij.plugin.intellij.lang.XQuery
import uk.co.reecedunn.intellij.plugin.processor.query.Query
import uk.co.reecedunn.intellij.plugin.processor.query.QueryProcessor
import uk.co.reecedunn.intellij.plugin.processor.query.UnsupportedQueryType
import javax.xml.transform.Source

internal class SaxonQueryProcessor(val classes: SaxonClasses, val source: Source?) :
    QueryProcessor {

    private val processor by lazy {
        if (source == null)
            classes.processorClass.getConstructor(Boolean::class.java).newInstance(true)
        else
            classes.processorClass.getConstructor(Source::class.java).newInstance(source)
    }

    override val version: ExecutableOnPooledThread<String> = local_thread {
        val edition = classes.processorClass.getMethodOrNull("getSaxonEdition")?.invoke(processor) as? String
        val version = classes.processorClass.getMethod("getSaxonProductVersion").invoke(processor) as String
        edition?.let { "$it $version" } ?: version
    }

    override fun eval(query: String, language: Language): Query {
        return when (language) {
            XQuery -> SaxonXQueryRunner(
                processor,
                query,
                classes
            )
            else -> throw UnsupportedQueryType(language)
        }
    }

    override fun invoke(path: String, language: Language): Query {
        throw UnsupportedOperationException()
    }

    override fun close() {
    }
}
