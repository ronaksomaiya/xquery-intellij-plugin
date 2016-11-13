/*
 * Copyright (C) 2016 Reece H. Dunn
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
package uk.co.reecedunn.intellij.plugin.xquery.psi.impl.xquery;

import com.intellij.extapi.psi.ASTWrapperPsiElement;
import com.intellij.lang.ASTNode;
import com.intellij.psi.PsiElement;
import com.intellij.psi.tree.TokenSet;
import org.jetbrains.annotations.NotNull;
import uk.co.reecedunn.intellij.plugin.xquery.ast.xquery.XQueryMapConstructorEntry;
import uk.co.reecedunn.intellij.plugin.xquery.lang.ImplementationItem;
import uk.co.reecedunn.intellij.plugin.xquery.lang.XQueryConformance;
import uk.co.reecedunn.intellij.plugin.xquery.lang.XQueryVersion;
import uk.co.reecedunn.intellij.plugin.xquery.lexer.XQueryTokenType;
import uk.co.reecedunn.intellij.plugin.xquery.psi.XQueryConformanceCheck;
import uk.co.reecedunn.intellij.plugin.xquery.resources.XQueryBundle;

public class XQueryMapConstructorEntryPsiImpl extends ASTWrapperPsiElement implements XQueryMapConstructorEntry, XQueryConformanceCheck {
    private TokenSet ASSIGNMENT = TokenSet.create(XQueryTokenType.QNAME_SEPARATOR, XQueryTokenType.ASSIGN_EQUAL);

    public XQueryMapConstructorEntryPsiImpl(@NotNull ASTNode node) {
        super(node);
    }

    @Override
    public boolean conformsTo(ImplementationItem implementation) {
        final XQueryVersion saxon = implementation.getVersion(XQueryConformance.SAXON);
        boolean isSaxonExtension = saxon != null && saxon.supportsVersion(XQueryVersion.VERSION_9_4) && !saxon.supportsVersion(XQueryVersion.VERSION_9_7);
        return (getConformanceElement().getNode().getElementType() == XQueryTokenType.ASSIGN_EQUAL) == isSaxonExtension;
    }

    @Override
    public PsiElement getConformanceElement() {
        return findChildByType(ASSIGNMENT);
    }

    @Override
    public String getConformanceErrorMessage() {
        return XQueryBundle.message("requires.feature.saxon-map-entry-assign.version");
    }
}
