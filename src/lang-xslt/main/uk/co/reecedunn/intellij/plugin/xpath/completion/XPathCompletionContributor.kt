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

import com.intellij.patterns.PlatformPatterns
import uk.co.reecedunn.intellij.plugin.core.completion.CompletionContributorEx
import uk.co.reecedunn.intellij.plugin.xpath.ast.xpath.XPath
import uk.co.reecedunn.intellij.plugin.xpath.completion.filters.*
import uk.co.reecedunn.intellij.plugin.xpath.completion.property.XPathStaticallyKnownElementOrTypeNamespaces
import uk.co.reecedunn.intellij.plugin.xpath.completion.property.XPathVersion
import uk.co.reecedunn.intellij.plugin.xpath.completion.providers.*
import uk.co.reecedunn.intellij.plugin.xslt.psi.isIntellijXPathPluginEnabled

class XPathCompletionContributor : CompletionContributorEx() {
    private fun registerXPathKeywordCompletionProviders() {
        val XPath = PlatformPatterns.psiElement().inFile(PlatformPatterns.psiFile(XPath::class.java))

        // XPath 3.1 EBNF (41) ForwardAxis ; XPath 3.1 EBNF (44) ReverseAxis
        builder(XPath).withFilter(XPathForwardOrReverseAxisFilter).addCompletions(XPathForwardOrReverseAxisProvider)

        // XPath 3.1 EBNF (79) SequenceType
        builder(XPath).withFilter(XPathSequenceTypeFilter).withProperty(XPathVersion)
            .addCompletions(XPathSequenceTypeProvider)

        // XPath 3.1 EBNF (81) ItemType
        builder(XPath).withFilter(XPathItemTypeFilter).withProperty(XPathVersion).addCompletions(XPathItemTypeProvider)

        // XPath 3.1 EBNF (83) KindTest
        builder(XPath).withFilter(XPathKindTestFilter).withProperty(XPathVersion).addCompletions(XPathKindTestProvider)
    }

    private fun registerXPathStaticContextCompletionProviders() {
        val XPath = PlatformPatterns.psiElement().inFile(PlatformPatterns.psiFile(XPath::class.java))

        // XPath 3.1 EBNF (82) AtomicOrUnionType ; XPath 3.1 EBNF (100) SimpleTypeName
        builder(XPath).withFilter(XPathAtomicOrUnionTypeFilter)
            .withProperty(XPathStaticallyKnownElementOrTypeNamespaces)
            .addCompletions(XPathAtomicOrUnionTypeProvider)

        // XQuery 3.1 EBNF (234) QName
        builder(XPath).withFilter(XPathQNamePrefixFilter)
            .withProperty(XPathStaticallyKnownElementOrTypeNamespaces)
            .addCompletions(XPathQNamePrefixProvider)
    }

    init {
        if (!isIntellijXPathPluginEnabled()) {
            registerXPathKeywordCompletionProviders()
            registerXPathStaticContextCompletionProviders()
        }
    }
}
