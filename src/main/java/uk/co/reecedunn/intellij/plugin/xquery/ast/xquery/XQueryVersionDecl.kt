/*
 * Copyright (C) 2016-2017 Reece H. Dunn
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
package uk.co.reecedunn.intellij.plugin.xquery.ast.xquery

import com.intellij.psi.PsiElement
import uk.co.reecedunn.intellij.plugin.xpath.ast.xpath.XPathStringLiteral

/**
 * An XQuery 1.0 and 3.0 `VersionDecl` node in the XQuery AST.
 *
 * The XQuery 3.0 `VersionDecl` node supports omitting the
 * `version` part in order to only specify the encoding. This
 * does not change the `VersionDecl` representation, so this
 * interface is used for both XQuery 1.0 and XQuery 3.0
 * `VersionDecl` nodes. Validation is handled by the
 * [uk.co.reecedunn.intellij.plugin.xquery.parser.XQueryParserImpl].
 */
interface XQueryVersionDecl : PsiElement {
    /**
     * Gets the XQuery version specified in this declaration.
     *
     * The XQuery version may be invalid.
     *
     * @return The XQuery version if provided, or `null` otherwise.
     */
    val version: XPathStringLiteral?

    /**
     * Gets the character encoding specified in this declaration.
     *
     * The character encoding may be invalid.
     *
     * @return The character encoding if provided, or `null` otherwise.
     */
    val encoding: XPathStringLiteral?
}
