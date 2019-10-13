/*
 * Copyright (C) 2019 Reece H. Dunn
 * Copyright 2000-2019 JetBrains s.r.o.
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
package uk.co.reecedunn.compat.testFramework

import com.intellij.mock.MockApplication
import com.intellij.mock.MockProjectEx
import com.intellij.openapi.application.ApplicationManager
import com.intellij.openapi.components.ComponentManager
import com.intellij.openapi.extensions.ExtensionPoint
import com.intellij.openapi.extensions.ExtensionPointName
import com.intellij.openapi.extensions.Extensions
import com.intellij.openapi.extensions.ExtensionsArea
import com.intellij.openapi.extensions.impl.ExtensionsAreaImpl
import com.intellij.openapi.fileTypes.FileTypeManager
import com.intellij.openapi.util.Getter
import com.intellij.openapi.vfs.encoding.EncodingManager
import com.intellij.openapi.vfs.encoding.EncodingManagerImpl
import com.intellij.testFramework.UsefulTestCase
import org.picocontainer.MutablePicoContainer
import java.lang.reflect.Modifier

abstract class PlatformLiteFixture : com.intellij.testFramework.UsefulTestCase() {
    protected var myProjectEx: MockProjectEx? = null
    protected val myProject: MockProjectEx get() = myProjectEx!!

    fun getApplication(): MockApplication {
        return ApplicationManager.getApplication() as MockApplication
    }

    fun initApplication(): MockApplication {
        val app = MockApplication(testRootDisposable)
        ApplicationManager.setApplication(app, Getter { FileTypeManager.getInstance() }, testRootDisposable)
        app.registerService(EncodingManager::class.java, EncodingManagerImpl::class.java)
        return app
    }

    @Throws(Exception::class)
    override fun tearDown() {
        myProjectEx = null
        try {
            super.tearDown()
        } finally {
            UsefulTestCase.clearFields(this)
        }
    }

    protected fun <T: Any> registerExtension(extensionPointName: ExtensionPointName<T>, extension: T) {
        registerExtension(Extensions.getRootArea(), extensionPointName, extension)
    }

    fun <T: Any> registerExtension(area: ExtensionsArea, name: ExtensionPointName<T>, extension: T) {
        registerExtensionPoint(area, name, extension.javaClass)
        area.getExtensionPoint<T>(name.name).registerExtension(extension, testRootDisposable)
    }

    protected open fun <T> registerExtensionPoint(extensionPointName: ExtensionPointName<T>, aClass: Class<T>) {
        registerExtensionPoint(Extensions.getRootArea(), extensionPointName, aClass)
    }

    protected open fun <T> registerExtensionPoint(
        area: ExtensionsArea,
        extensionPointName: ExtensionPointName<T>,
        aClass: Class<out T>
    ) {
        if (!area.hasExtensionPoint(extensionPointName)) {
            val kind =
                if (aClass.isInterface || aClass.modifiers and Modifier.ABSTRACT != 0) ExtensionPoint.Kind.INTERFACE else ExtensionPoint.Kind.BEAN_CLASS
            (area as ExtensionsAreaImpl).registerExtensionPoint(
                extensionPointName,
                aClass.name,
                kind,
                testRootDisposable
            )
        }
    }

    protected fun registerComponentImplementation(
        container: MutablePicoContainer,
        key: Class<*>,
        implementation: Class<*>
    ) {
        container.unregisterComponent(key)
        container.registerComponentImplementation(key, implementation)
    }

    @Suppress("UNCHECKED_CAST")
    fun <T> registerComponentInstance(container: MutablePicoContainer, key: Class<T>, implementation: T): T {
        val old = container.getComponentInstance(key)
        container.unregisterComponent(key)
        container.registerComponentInstance(key, implementation)

        return old as T
    }

    fun <T> registerComponentInstance(container: ComponentManager, key: Class<T>, implementation: T): T {
        return registerComponentInstance(container.picoContainer as MutablePicoContainer, key, implementation)
    }

    protected fun <T> registerApplicationService(aClass: Class<T>, `object`: T) {
        getApplication().registerService(aClass, `object`, testRootDisposable)
    }
}
