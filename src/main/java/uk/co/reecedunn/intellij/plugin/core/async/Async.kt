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
package uk.co.reecedunn.intellij.plugin.core.async

import java.util.concurrent.Future
import java.util.concurrent.TimeUnit

interface ExecutableOnPooledThread<T> {
    fun execute(): Future<T>
}

private class LocalFuture<T>(val f: () -> T) : Future<T> {
    override fun isDone(): Boolean = true

    override fun get(): T = f()

    override fun get(timeout: Long, unit: TimeUnit?): T = get()

    override fun cancel(mayInterruptIfRunning: Boolean): Boolean = false

    override fun isCancelled(): Boolean = false
}

class ExecuteOnLocalThread<T>(val f: () -> T) : ExecutableOnPooledThread<T> {
    override fun execute(): Future<T> = LocalFuture(f)
}
