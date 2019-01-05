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
package uk.co.reecedunn.intellij.plugin.intellij.execution.ui

import com.intellij.ui.table.TableView
import com.intellij.util.ui.ColumnInfo
import com.intellij.util.ui.ListTableModel
import uk.co.reecedunn.intellij.plugin.intellij.resources.PluginApiBundle
import uk.co.reecedunn.intellij.plugin.processor.profile.ProfileEntry
import uk.co.reecedunn.intellij.plugin.processor.query.QueryResult

@Suppress("ClassName")
private object ITEM_TYPE_COLUMN : ColumnInfo<QueryResult, String>(
    PluginApiBundle.message("query.result.table.item-type.column.label")
), Comparator<QueryResult> {
    override fun valueOf(item: QueryResult?): String? = item?.type

    override fun getComparator(): Comparator<QueryResult>? = this

    override fun compare(o1: QueryResult?, o2: QueryResult?): Int {
        return (o1?.type ?: "").compareTo(o2?.type ?: "")
    }
}

@Suppress("ClassName")
private object MIME_TYPE_COLUMN : ColumnInfo<QueryResult, String>(
    PluginApiBundle.message("query.result.table.mime-type.column.label")
), Comparator<QueryResult> {
    override fun valueOf(item: QueryResult?): String? = item?.mimetype

    override fun getComparator(): Comparator<QueryResult>? = this

    override fun compare(o1: QueryResult?, o2: QueryResult?): Int {
        return (o1?.mimetype ?: "").compareTo(o2?.mimetype ?: "")
    }
}

@Suppress("ClassName")
private object VALUE_COLUMN : ColumnInfo<QueryResult, String>(
    PluginApiBundle.message("query.result.table.value.column.label")
), Comparator<QueryResult> {
    override fun valueOf(item: QueryResult?): String? = item?.type

    override fun getComparator(): Comparator<QueryResult>? = this

    override fun compare(o1: QueryResult?, o2: QueryResult?): Int {
        return (o1?.value ?: "").compareTo(o2?.value ?: "")
    }
}

private val COLUMNS: Array<ColumnInfo<*, *>> = arrayOf(
    ITEM_TYPE_COLUMN,
    MIME_TYPE_COLUMN,
    VALUE_COLUMN
)

class QueryResultTable : TableView<QueryResult>() {
    init {
        setModelAndUpdateColumns(ListTableModel<QueryResult>(*COLUMNS))
        setEnableAntialiasing(true)

        emptyText.text = PluginApiBundle.message("query.result.table.no-results")
    }

    fun addRow(entry: QueryResult) = listTableModel.addRow(entry)
}
