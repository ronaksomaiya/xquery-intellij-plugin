/*
 * Copyright (C) 2017 Reece H. Dunn
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
/*
 * XPath and XQuery Type System Part 1: Items
 *
 * Reference: https://www.w3.org/TR/xpath-datamodel-31
 * Reference: https://www.w3.org/TR/2012/REC-xmlschema11-1-20120405
 */
package uk.co.reecedunn.intellij.plugin.xdm.model

interface XdmItem: XdmSequenceType

interface XdmFunction: XdmItem

interface XdmMap: XdmFunction

interface XdmArray: XdmFunction

interface XdmNode: XdmItem

interface XdmAttribute: XdmNode

interface XdmComment: XdmNode

interface XdmDocument: XdmNode

interface XdmElement: XdmNode

interface XdmNamespace: XdmNode

interface XdmProcessingInstruction: XdmNode

interface XdmText: XdmNode
