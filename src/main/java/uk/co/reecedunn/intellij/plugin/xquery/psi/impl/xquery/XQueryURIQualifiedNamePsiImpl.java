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
import org.jetbrains.annotations.NotNull;
import uk.co.reecedunn.intellij.plugin.xquery.ast.xquery.XQueryURIQualifiedName;
import uk.co.reecedunn.intellij.plugin.xquery.lexer.INCNameType;
import uk.co.reecedunn.intellij.plugin.xquery.parser.XQueryElementType;

public class XQueryURIQualifiedNamePsiImpl extends ASTWrapperPsiElement implements XQueryURIQualifiedName {
    public XQueryURIQualifiedNamePsiImpl(@NotNull ASTNode node) {
        super(node);
    }

    @Override
    public PsiElement getPrefix() {
        return findChildByType(XQueryElementType.BRACED_URI_LITERAL);
    }

    @Override
    public PsiElement getLocalName() {
        PsiElement element = getFirstChild();
        while (element != null) {
            if (element.getNode().getElementType() instanceof INCNameType) {
                return element;
            }
            element = element.getNextSibling();
        }
        return null;
    }
}
