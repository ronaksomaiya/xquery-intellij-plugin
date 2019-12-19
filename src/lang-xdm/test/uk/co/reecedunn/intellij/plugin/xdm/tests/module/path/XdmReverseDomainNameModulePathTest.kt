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
package uk.co.reecedunn.intellij.plugin.xdm.tests.module.path

import com.intellij.mock.MockProjectEx
import com.intellij.psi.PsiElement
import org.hamcrest.CoreMatchers.*
import org.junit.jupiter.api.*
import uk.co.reecedunn.compat.testFramework.PlatformLiteFixture
import uk.co.reecedunn.intellij.plugin.core.tests.assertion.assertThat
import uk.co.reecedunn.intellij.plugin.xdm.model.XdmUriContext
import uk.co.reecedunn.intellij.plugin.xdm.model.XsAnyUri
import uk.co.reecedunn.intellij.plugin.xdm.module.path.XdmReverseDomainNameModulePath

// NOTE: This class is private so the JUnit 4 test runner does not run the tests contained in it.
@DisplayName("Modules - BaseX Reverse Domain Name Paths")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
private class XdmReverseDomainNameModulePathTest : PlatformLiteFixture() {
    @BeforeAll
    override fun setUp() {
        super.setUp()
        initApplication()
        myProjectEx = MockProjectEx(testRootDisposable)
    }

    @AfterAll
    override fun tearDown() {
        super.tearDown()
    }

    @Test
    @DisplayName("empty")
    fun empty() {
        XdmUriContext.values().forEach { context ->
            val uri = XsAnyUri("", context, null as PsiElement?)
            val path = XdmReverseDomainNameModulePath.create(myProject, uri)
            assertThat(path, `is`(nullValue()))
        }
    }

    @Nested
    @DisplayName("HTTP scheme")
    internal inner class HttpScheme {
        @Test
        @DisplayName("scheme only")
        fun schemeOnly() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("http://", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                assertThat(path, `is`(nullValue()))
            }
        }

        @Test
        @DisplayName("with path")
        fun withPath() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("http://www.example.com/lorem/ipsum", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                when (context) {
                    XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                        assertThat(path, `is`(notNullValue()))
                        assertThat(path!!.path, `is`("com/example/www/lorem/ipsum"))
                        assertThat(path.isResource, `is`(nullValue()))
                    }
                    else -> assertThat(path, `is`(nullValue()))
                }
            }
        }

        @Test
        @DisplayName("with dots in path")
        fun withDotsInPath() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("http://www.example.com/lorem.ipsum", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                when (context) {
                    XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                        assertThat(path, `is`(notNullValue()))
                        assertThat(path!!.path, `is`("com/example/www/lorem/ipsum"))
                        assertThat(path.isResource, `is`(nullValue()))
                    }
                    else -> assertThat(path, `is`(nullValue()))
                }
            }
        }

        @Test
        @DisplayName("with replacement characters in path")
        fun withReplacementCharactersInPath() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("http://www.example.com/lorem^ipsum\$dolor12sed*emit", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                when (context) {
                    XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                        assertThat(path, `is`(notNullValue()))
                        assertThat(path!!.path, `is`("com/example/www/lorem-ipsum-dolor12sed-emit"))
                        assertThat(path.isResource, `is`(nullValue()))
                    }
                    else -> assertThat(path, `is`(nullValue()))
                }
            }
        }

        @Test
        @DisplayName("with path, trailing slash")
        fun withPathTrailingSlash() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("http://www.example.com/lorem/ipsum/", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                when (context) {
                    XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                        assertThat(path, `is`(notNullValue()))
                        assertThat(path!!.path, `is`("com/example/www/lorem/ipsum/index"))
                        assertThat(path.isResource, `is`(nullValue()))
                    }
                    else -> assertThat(path, `is`(nullValue()))
                }
            }
        }

        @Test
        @DisplayName("without path")
        fun withoutPath() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("http://www.example.com", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                when (context) {
                    XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                        assertThat(path, `is`(notNullValue()))
                        assertThat(path!!.path, `is`("com/example/www/index"))
                        assertThat(path.isResource, `is`(nullValue()))
                    }
                    else -> assertThat(path, `is`(nullValue()))
                }
            }
        }
    }

    @Nested
    @DisplayName("HTTPS scheme")
    internal inner class HttpsScheme {
        @Test
        @DisplayName("scheme only")
        fun schemeOnly() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("https://", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                assertThat(path, `is`(nullValue()))
            }
        }

        @Test
        @DisplayName("with path")
        fun withPath() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("https://www.example.com/lorem/ipsum", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                when (context) {
                    XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                        assertThat(path, `is`(notNullValue()))
                        assertThat(path!!.path, `is`("com/example/www/lorem/ipsum"))
                        assertThat(path.isResource, `is`(nullValue()))
                    }
                    else -> assertThat(path, `is`(nullValue()))
                }
            }
        }

        @Test
        @DisplayName("with dots in path")
        fun withDotsInPath() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("https://www.example.com/lorem.ipsum", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                when (context) {
                    XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                        assertThat(path, `is`(notNullValue()))
                        assertThat(path!!.path, `is`("com/example/www/lorem/ipsum"))
                        assertThat(path.isResource, `is`(nullValue()))
                    }
                    else -> assertThat(path, `is`(nullValue()))
                }
            }
        }

        @Test
        @DisplayName("with replacement characters in path")
        fun withReplacementCharactersInPath() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("https://www.example.com/lorem^ipsum\$dolor12sed*emit", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                when (context) {
                    XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                        assertThat(path, `is`(notNullValue()))
                        assertThat(path!!.path, `is`("com/example/www/lorem-ipsum-dolor12sed-emit"))
                        assertThat(path.isResource, `is`(nullValue()))
                    }
                    else -> assertThat(path, `is`(nullValue()))
                }
            }
        }

        @Test
        @DisplayName("with path, trailing slash")
        fun withPathTrailingSlash() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("https://www.example.com/lorem/ipsum/", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                when (context) {
                    XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                        assertThat(path, `is`(notNullValue()))
                        assertThat(path!!.path, `is`("com/example/www/lorem/ipsum/index"))
                        assertThat(path.isResource, `is`(nullValue()))
                    }
                    else -> assertThat(path, `is`(nullValue()))
                }
            }
        }

        @Test
        @DisplayName("without path")
        fun withoutPath() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("https://www.example.com", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                when (context) {
                    XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                        assertThat(path, `is`(notNullValue()))
                        assertThat(path!!.path, `is`("com/example/www/index"))
                        assertThat(path.isResource, `is`(nullValue()))
                    }
                    else -> assertThat(path, `is`(nullValue()))
                }
            }
        }
    }

    @Test
    @DisplayName("file scheme URL")
    fun fileScheme() {
        XdmUriContext.values().forEach { context ->
            val uri = XsAnyUri("file:///C:/lorem/ipsum", context, null as PsiElement?)
            val path = XdmReverseDomainNameModulePath.create(myProject, uri)
            when (context) {
                XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                    assertThat(path, `is`(notNullValue()))
                    assertThat(path!!.path, `is`("file:///C:/lorem/ipsum"))
                    assertThat(path.isResource, `is`(nullValue()))
                }
                else -> assertThat(path, `is`(nullValue()))
            }
        }
    }

    @Nested
    @DisplayName("URN scheme")
    internal inner class UrnScheme {
        @Test
        @DisplayName("urn")
        fun urn() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("urn:lorem:ipsum", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                when (context) {
                    XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                        assertThat(path, `is`(notNullValue()))
                        assertThat(path!!.path, `is`("urn/lorem/ipsum"))
                        assertThat(path.isResource, `is`(nullValue()))
                    }
                    else -> assertThat(path, `is`(nullValue()))
                }
            }
        }

        @Test
        @DisplayName("with replacement characters in path")
        fun withReplacementCharactersInPath() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("urn:a:b:lorem^ipsum\$dolor12sed*emit", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                when (context) {
                    XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                        assertThat(path, `is`(notNullValue()))
                        assertThat(path!!.path, `is`("urn/a/b/lorem-ipsum-dolor12sed-emit"))
                        assertThat(path.isResource, `is`(nullValue()))
                    }
                    else -> assertThat(path, `is`(nullValue()))
                }
            }
        }
    }

    @Test
    @DisplayName("resource scheme")
    fun resourceScheme() {
        XdmUriContext.values().forEach { context ->
            val uri = XsAnyUri("resource:org/lorem/ipsum.xqm", context, null as PsiElement?)
            val path = XdmReverseDomainNameModulePath.create(myProject, uri)
            when (context) {
                XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                    assertThat(path, `is`(notNullValue()))
                    assertThat(path!!.path, `is`("resource/org/lorem/ipsum.xqm"))
                    assertThat(path.isResource, `is`(nullValue()))
                }
                else -> assertThat(path, `is`(nullValue()))
            }
        }
    }

    @Nested
    @DisplayName("Java scheme")
    internal inner class JavaScheme {
        @Test
        @DisplayName("classpath")
        fun classpath() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("java:java.lang.String", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                assertThat(path, `is`(nullValue()))
            }
        }

        @Test
        @DisplayName("classpath with void=this")
        fun voidThis() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("java:java.lang.String?void=this", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                assertThat(path, `is`(nullValue()))
            }
        }
    }

    @Nested
    @DisplayName("relative path")
    internal inner class RelativePath {
        @Test
        @DisplayName("relative path")
        fun relativePath() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("lorem/ipsum", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                when (context) {
                    XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                        assertThat(path, `is`(notNullValue()))
                        assertThat(path!!.path, `is`("lorem/ipsum"))
                        assertThat(path.isResource, `is`(nullValue()))
                    }
                    else -> assertThat(path, `is`(nullValue()))
                }
            }
        }

        @Test
        @DisplayName("trailing slash")
        fun trailingSlash() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("lorem/ipsum/", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                when (context) {
                    XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                        assertThat(path, `is`(notNullValue()))
                        assertThat(path!!.path, `is`("lorem/ipsum/index"))
                        assertThat(path.isResource, `is`(nullValue()))
                    }
                    else -> assertThat(path, `is`(nullValue()))
                }
            }
        }

        @Test
        @DisplayName("with replacement characters in path")
        fun withReplacementCharactersInPath() {
            XdmUriContext.values().forEach { context ->
                val uri = XsAnyUri("a/b/lorem^ipsum\$dolor12sed*emit", context, null as PsiElement?)
                val path = XdmReverseDomainNameModulePath.create(myProject, uri)
                when (context) {
                    XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                        assertThat(path, `is`(notNullValue()))
                        assertThat(path!!.path, `is`("a/b/lorem-ipsum-dolor12sed-emit"))
                        assertThat(path.isResource, `is`(nullValue()))
                    }
                    else -> assertThat(path, `is`(nullValue()))
                }
            }
        }
    }

    @Test
    @DisplayName("MarkLogic database path")
    fun markLogicDatabasePath() {
        XdmUriContext.values().forEach { context ->
            val uri = XsAnyUri("/lorem/ipsum.xqy", context, null as PsiElement?)
            val path = XdmReverseDomainNameModulePath.create(myProject, uri)
            when (context) {
                XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                    assertThat(path, `is`(notNullValue()))
                    assertThat(path!!.path, `is`("/lorem/ipsum.xqy"))
                    assertThat(path.isResource, `is`(nullValue()))
                }
                else -> assertThat(path, `is`(nullValue()))
            }
        }
    }

    @Test
    @DisplayName("eXist-db database path")
    fun eXistDBDatabasePath() {
        XdmUriContext.values().forEach { context ->
            val uri = XsAnyUri("xmldb:exist:///db/modules/lorem/ipsum.xqm", context, null as PsiElement?)
            val path = XdmReverseDomainNameModulePath.create(myProject, uri)
            assertThat(path, `is`(nullValue()))
        }
    }

    @Test
    @DisplayName("Java class path")
    fun javaClassPath() {
        XdmUriContext.values().forEach { context ->
            val uri = XsAnyUri("java.lang.String", context, null as PsiElement?)
            val path = XdmReverseDomainNameModulePath.create(myProject, uri)
            when (context) {
                XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                    assertThat(path, `is`(notNullValue()))
                    assertThat(path!!.path, `is`("java.lang.String"))
                    assertThat(path.isResource, `is`(nullValue()))
                }
                else -> assertThat(path, `is`(nullValue()))
            }
        }
    }

    @Test
    @DisplayName("Saxon java-type namespace")
    fun javaType() {
        XdmUriContext.values().forEach { context ->
            val uri = XsAnyUri("http://saxon.sf.net/java-type", context, null as PsiElement?)
            val path = XdmReverseDomainNameModulePath.create(myProject, uri)
            when (context) {
                XdmUriContext.Namespace, XdmUriContext.TargetNamespace, XdmUriContext.NamespaceDeclaration -> {
                    assertThat(path, `is`(notNullValue()))
                    assertThat(path!!.path, `is`("net/sf/saxon/java-type"))
                    assertThat(path.isResource, `is`(nullValue()))
                }
                else -> assertThat(path, `is`(nullValue()))
            }
        }
    }
}
