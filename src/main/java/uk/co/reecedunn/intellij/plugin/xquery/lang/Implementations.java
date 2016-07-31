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
package uk.co.reecedunn.intellij.plugin.xquery.lang;

import uk.co.reecedunn.intellij.plugin.xquery.resources.Resources;

import java.util.List;

public class Implementations {
    // The Implementations constructor is not used, but make sure code coverage reports it as covered.
    @SuppressWarnings("unused")
    private static Implementations INSTANCE = new Implementations();

    private static final ImplementationItem sImplementations = new ImplementationItem(Resources.loadXml("data/implementations.xml"));

    public static List<ImplementationItem> getImplementations() {
        return sImplementations.getItems("implementation");
    }

    public static ImplementationItem getDefaultImplementation() {
        return sImplementations.getDefaultItem("implementation");
    }
}
