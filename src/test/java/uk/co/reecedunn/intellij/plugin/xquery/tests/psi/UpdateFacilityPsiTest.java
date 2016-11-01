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
package uk.co.reecedunn.intellij.plugin.xquery.tests.psi;

import uk.co.reecedunn.intellij.plugin.xquery.ast.update.facility.*;
import uk.co.reecedunn.intellij.plugin.xquery.ast.xquery.XQueryAnnotatedDecl;
import uk.co.reecedunn.intellij.plugin.xquery.ast.xquery.XQueryFile;
import uk.co.reecedunn.intellij.plugin.xquery.lang.Implementations;
import uk.co.reecedunn.intellij.plugin.xquery.lexer.XQueryTokenType;
import uk.co.reecedunn.intellij.plugin.xquery.psi.PsiNavigation;
import uk.co.reecedunn.intellij.plugin.xquery.psi.XQueryConformanceCheck;
import uk.co.reecedunn.intellij.plugin.xquery.tests.parser.ParserTestCase;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.MatcherAssert.assertThat;

@SuppressWarnings("ConstantConditions")
public class UpdateFacilityPsiTest extends ParserTestCase {
    // region XQueryConformanceCheck
    // region CompatibilityAnnotation

    public void testCompatibilityAnnotation_FunctionDecl() {
        final XQueryFile file = parseResource("tests/parser/xquery-update-1.0/FunctionDecl_Updating.xq");

        XQueryAnnotatedDecl annotatedDeclPsi = PsiNavigation.findDirectDescendantByClass(file, XQueryAnnotatedDecl.class);
        UpdateFacilityCompatibilityAnnotation compatibilityAnnotationPsi = PsiNavigation.findChildByClass(annotatedDeclPsi, UpdateFacilityCompatibilityAnnotation.class);
        XQueryConformanceCheck versioned = (XQueryConformanceCheck)compatibilityAnnotationPsi;

        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0")), is(false));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0-update")), is(true));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/3.0")), is(false));

        assertThat(versioned.getConformanceErrorMessage(),
                is("XPST0003: This expression requires Update Facility 1.0 or later."));

        assertThat(versioned.getConformanceElement(), is(notNullValue()));
        assertThat(versioned.getConformanceElement().getNode().getElementType(),
                is(XQueryTokenType.K_UPDATING));
    }

    public void testCompatibilityAnnotation_VarDecl() {
        final XQueryFile file = parseResource("tests/parser/xquery-update-3.0/CompatibilityAnnotation_VarDecl.xq");

        XQueryAnnotatedDecl annotatedDeclPsi = PsiNavigation.findDirectDescendantByClass(file, XQueryAnnotatedDecl.class);
        UpdateFacilityCompatibilityAnnotation compatibilityAnnotationPsi = PsiNavigation.findChildByClass(annotatedDeclPsi, UpdateFacilityCompatibilityAnnotation.class);
        XQueryConformanceCheck versioned = (XQueryConformanceCheck)compatibilityAnnotationPsi;

        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0")), is(false));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0-update")), is(false));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/3.0")), is(false));

        assertThat(versioned.getConformanceErrorMessage(),
                is("XPST0003: This expression requires Update Facility 3.0 or later."));

        assertThat(versioned.getConformanceElement(), is(notNullValue()));
        assertThat(versioned.getConformanceElement().getNode().getElementType(),
                is(XQueryTokenType.K_UPDATING));
    }

    // endregion
    // region DeleteExpr

    public void testDeleteExpr() {
        final XQueryFile file = parseResource("tests/parser/xquery-update-1.0/DeleteExpr_Node.xq");

        UpdateFacilityDeleteExpr deleteExprPsi = PsiNavigation.findDirectDescendantByClass(file, UpdateFacilityDeleteExpr.class);
        XQueryConformanceCheck versioned = (XQueryConformanceCheck)deleteExprPsi;

        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0")), is(false));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0-update")), is(true));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/3.0")), is(false));

        assertThat(versioned.getConformanceErrorMessage(),
                is("XPST0003: This expression requires Update Facility 1.0 or later."));

        assertThat(versioned.getConformanceElement(), is(notNullValue()));
        assertThat(versioned.getConformanceElement().getNode().getElementType(),
                is(XQueryTokenType.K_DELETE));
    }

    // endregion
    // region FunctionDecl

    public void testFunctionDecl_Updating() {
        final XQueryFile file = parseResource("tests/parser/xquery-update-1.0/FunctionDecl_Updating.xq");

        XQueryAnnotatedDecl annotatedDeclPsi = PsiNavigation.findDirectDescendantByClass(file, XQueryAnnotatedDecl.class);
        UpdateFacilityCompatibilityAnnotation compatibilityAnnotationPsi = PsiNavigation.findChildByClass(annotatedDeclPsi, UpdateFacilityCompatibilityAnnotation.class);
        XQueryConformanceCheck versioned = (XQueryConformanceCheck)compatibilityAnnotationPsi;

        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0")), is(false));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0-update")), is(true));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/3.0")), is(false));

        assertThat(versioned.getConformanceErrorMessage(),
                is("XPST0003: This expression requires Update Facility 1.0 or later."));

        assertThat(versioned.getConformanceElement(), is(notNullValue()));
        assertThat(versioned.getConformanceElement().getNode().getElementType(),
                is(XQueryTokenType.K_UPDATING));
    }

    // endregion
    // region InsertExpr

    public void testInsertExpr() {
        final XQueryFile file = parseResource("tests/parser/xquery-update-1.0/InsertExpr_Node.xq");

        UpdateFacilityInsertExpr insertExprPsi = PsiNavigation.findDirectDescendantByClass(file, UpdateFacilityInsertExpr.class);
        XQueryConformanceCheck versioned = (XQueryConformanceCheck)insertExprPsi;

        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0")), is(false));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0-update")), is(true));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/3.0")), is(false));

        assertThat(versioned.getConformanceErrorMessage(),
                is("XPST0003: This expression requires Update Facility 1.0 or later."));

        assertThat(versioned.getConformanceElement(), is(notNullValue()));
        assertThat(versioned.getConformanceElement().getNode().getElementType(),
                is(XQueryTokenType.K_INSERT));
    }

    // endregion
    // region RenameExpr

    public void testRenameExpr() {
        final XQueryFile file = parseResource("tests/parser/xquery-update-1.0/RenameExpr.xq");

        UpdateFacilityRenameExpr renameExprPsi = PsiNavigation.findDirectDescendantByClass(file, UpdateFacilityRenameExpr.class);
        XQueryConformanceCheck versioned = (XQueryConformanceCheck)renameExprPsi;

        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0")), is(false));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0-update")), is(true));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/3.0")), is(false));

        assertThat(versioned.getConformanceErrorMessage(),
                is("XPST0003: This expression requires Update Facility 1.0 or later."));

        assertThat(versioned.getConformanceElement(), is(notNullValue()));
        assertThat(versioned.getConformanceElement().getNode().getElementType(),
                is(XQueryTokenType.K_RENAME));
    }

    // endregion
    // region ReplaceExpr

    public void testReplaceExpr() {
        final XQueryFile file = parseResource("tests/parser/xquery-update-1.0/ReplaceExpr.xq");

        UpdateFacilityReplaceExpr replaceExprPsi = PsiNavigation.findDirectDescendantByClass(file, UpdateFacilityReplaceExpr.class);
        XQueryConformanceCheck versioned = (XQueryConformanceCheck)replaceExprPsi;

        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0")), is(false));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0-update")), is(true));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/3.0")), is(false));

        assertThat(versioned.getConformanceErrorMessage(),
                is("XPST0003: This expression requires Update Facility 1.0 or later."));

        assertThat(versioned.getConformanceElement(), is(notNullValue()));
        assertThat(versioned.getConformanceElement().getNode().getElementType(),
                is(XQueryTokenType.K_REPLACE));
    }

    // endregion
    // region RevalidationDecl

    public void testRevalidationDecl() {
        final XQueryFile file = parseResource("tests/parser/xquery-update-1.0/RevalidationDecl.xq");

        UpdateFacilityRevalidationDecl revalidationDeclPsi = PsiNavigation.findDirectDescendantByClass(file, UpdateFacilityRevalidationDecl.class);
        XQueryConformanceCheck versioned = (XQueryConformanceCheck)revalidationDeclPsi;

        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0")), is(false));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0-update")), is(true));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/3.0")), is(false));

        assertThat(versioned.getConformanceErrorMessage(),
                is("XPST0003: This expression requires Update Facility 1.0 or later."));

        assertThat(versioned.getConformanceElement(), is(notNullValue()));
        assertThat(versioned.getConformanceElement().getNode().getElementType(),
                is(XQueryTokenType.K_REVALIDATION));
    }

    // endregion
    // region TransformExpr

    public void testTransformExpr() {
        final XQueryFile file = parseResource("tests/parser/xquery-update-1.0/TransformExpr.xq");

        UpdateFacilityTransformExpr transformExprPsi = PsiNavigation.findDirectDescendantByClass(file, UpdateFacilityTransformExpr.class);
        XQueryConformanceCheck versioned = (XQueryConformanceCheck)transformExprPsi;

        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0")), is(false));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/1.0-update")), is(true));
        assertThat(versioned.conformsTo(Implementations.getItemById("w3c/3.0")), is(false));

        assertThat(versioned.getConformanceErrorMessage(),
                is("XPST0003: This expression requires Update Facility 1.0 or later."));

        assertThat(versioned.getConformanceElement(), is(notNullValue()));
        assertThat(versioned.getConformanceElement().getNode().getElementType(),
                is(XQueryTokenType.K_COPY));
    }

    // endregion
    // endregion
}
