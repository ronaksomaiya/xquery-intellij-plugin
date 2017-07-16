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
package uk.co.reecedunn.intellij.plugin.xquery.settings;

import com.intellij.openapi.project.Project;
import uk.co.reecedunn.intellij.plugin.core.ui.SettingsUI;
import uk.co.reecedunn.intellij.plugin.xquery.lang.ImplementationItem;
import uk.co.reecedunn.intellij.plugin.xquery.lang.Implementations;
import uk.co.reecedunn.intellij.plugin.xquery.lang.XQueryConformance;
import uk.co.reecedunn.intellij.plugin.xquery.lang.XQueryVersion;

import javax.swing.*;

@SuppressWarnings({"RedundantIfStatement", "SameParameterValue"})
public class XQueryPropertiesUI implements SettingsUI<XQueryProjectSettings> {
    private JComboBox<XQueryVersion> mVersion;
    private JComboBox<ImplementationItem> mImplementations;
    private JComboBox<ImplementationItem> mImplementationVersions;
    private JComboBox<ImplementationItem> mDialectForXQuery1_0;
    private JComboBox<ImplementationItem> mDialectForXQuery3_0;
    private JComboBox<ImplementationItem> mDialectForXQuery3_1;

    private JPanel mPanel;
    private final XQueryProjectSettings mSettings;

    public XQueryPropertiesUI(XQueryProjectSettings settings) {
        mSettings = settings;
    }

    @Override
    public JPanel getPanel() {
        return mPanel;
    }

    private void populateVersionComboBox(JComboBox<XQueryVersion> control, ImplementationItem source, XQueryConformance filter) {
        if (source == null) {
            return;
        }

        final XQueryVersion selected = (XQueryVersion) control.getSelectedItem();
        boolean found = false;

        control.removeAllItems();
        for (XQueryVersion version : source.getVersions(ImplementationItem.IMPLEMENTATION_DIALECT, filter)) {
            control.addItem(version);
            if (version == selected) {
                control.setSelectedItem(version);
                found = true;
            }
        }
        if (!found) {
            control.setSelectedItem(source.getDefaultVersion(ImplementationItem.IMPLEMENTATION_DIALECT, filter));
        }
    }

    private void populateComboBox(JComboBox<ImplementationItem> control, ImplementationItem source, String filter) {
        control.removeAllItems();
        for (ImplementationItem item : source.getItems(filter)) {
            control.addItem(item);
        }
        control.setSelectedItem(source.getDefaultItem(filter));
    }

    private void populateComboBox(JComboBox<ImplementationItem> control, ImplementationItem source, String filter, XQueryVersion version) {
        if (source == null) {
            return;
        }

        final ImplementationItem selected = (ImplementationItem)control.getSelectedItem();
        boolean found = false;

        control.removeAllItems();
        for (ImplementationItem item : source.getItemsByVersion(filter, XQueryConformance.MINIMAL_CONFORMANCE, version)) {
            control.addItem(item);
            if (selected != null && item.toString().equals(selected.toString())) {
                control.setSelectedItem(item);
                found = true;
            }
        }
        if (!found) {
            control.setSelectedItem(source.getDefaultItemByVersion(filter, XQueryConformance.MINIMAL_CONFORMANCE, version));
        }
    }

    private void createUIComponents() {
        mImplementations = new JComboBox<>();
        mImplementationVersions = new JComboBox<>();
        mVersion = new JComboBox<>();
        mDialectForXQuery1_0 = new JComboBox<>();
        mDialectForXQuery3_0 = new JComboBox<>();
        mDialectForXQuery3_1 = new JComboBox<>();

        mImplementations.setName("Implementation");
        mImplementationVersions.setName("ImplementationVersion");
        mVersion.setName("XQueryVersion");
        mDialectForXQuery1_0.setName("DialectForXQuery1.0");
        mDialectForXQuery3_0.setName("DialectForXQuery3.0");
        mDialectForXQuery3_1.setName("DialectForXQuery3.1");

        mImplementationVersions.addActionListener(e -> {
            final ImplementationItem version = (ImplementationItem)mImplementationVersions.getSelectedItem();
            populateVersionComboBox(mVersion, version, XQueryConformance.MINIMAL_CONFORMANCE);
            populateComboBox(mDialectForXQuery1_0, version, ImplementationItem.IMPLEMENTATION_DIALECT, XQueryVersion.VERSION_1_0);
            populateComboBox(mDialectForXQuery3_0, version, ImplementationItem.IMPLEMENTATION_DIALECT, XQueryVersion.VERSION_3_0);
            populateComboBox(mDialectForXQuery3_1, version, ImplementationItem.IMPLEMENTATION_DIALECT, XQueryVersion.VERSION_3_1);
        });

        mImplementations.addActionListener(e -> {
            final ImplementationItem implementation = (ImplementationItem)mImplementations.getSelectedItem();
            populateComboBox(mImplementationVersions, implementation, ImplementationItem.IMPLEMENTATION_VERSION);
        });

        for (ImplementationItem implementation : Implementations.getImplementations()) {
            mImplementations.addItem(implementation);
        }
    }

    @Override
    public boolean isModified(XQueryProjectSettings settings) {
        if (!mImplementations.getSelectedItem().equals(mSettings.getImplementationItem())) return true;
        if (!mImplementationVersions.getSelectedItem().equals(mSettings.getImplementationVersionItem())) return true;
        if (!mVersion.getSelectedItem().equals(mSettings.getXQueryVersion())) return true;
        if (!mDialectForXQuery1_0.getSelectedItem().equals(mSettings.getDialectForXQueryVersion(XQueryVersion.VERSION_1_0))) return true;
        if (!mDialectForXQuery3_0.getSelectedItem().equals(mSettings.getDialectForXQueryVersion(XQueryVersion.VERSION_3_0))) return true;
        if (!mDialectForXQuery3_1.getSelectedItem().equals(mSettings.getDialectForXQueryVersion(XQueryVersion.VERSION_3_1))) return true;
        return false;
    }

    @Override
    public void apply(XQueryProjectSettings settings) {
        mSettings.setImplementationItem((ImplementationItem)mImplementations.getSelectedItem());
        mSettings.setImplementationVersionItem((ImplementationItem)mImplementationVersions.getSelectedItem());
        mSettings.setXQueryVersion((XQueryVersion)mVersion.getSelectedItem());
        mSettings.setDialectForXQueryVersion(XQueryVersion.VERSION_1_0, (ImplementationItem)mDialectForXQuery1_0.getSelectedItem());
        mSettings.setDialectForXQueryVersion(XQueryVersion.VERSION_3_0, (ImplementationItem)mDialectForXQuery3_0.getSelectedItem());
        mSettings.setDialectForXQueryVersion(XQueryVersion.VERSION_3_1, (ImplementationItem)mDialectForXQuery3_1.getSelectedItem());
    }

    @Override
    public void reset(XQueryProjectSettings settings) {
        mImplementations.setSelectedItem(mSettings.getImplementationItem());
        mImplementationVersions.setSelectedItem(mSettings.getImplementationVersionItem());
        mVersion.setSelectedItem(mSettings.getXQueryVersion());
        mDialectForXQuery1_0.setSelectedItem(mSettings.getDialectForXQueryVersion(XQueryVersion.VERSION_1_0));
        mDialectForXQuery3_0.setSelectedItem(mSettings.getDialectForXQueryVersion(XQueryVersion.VERSION_3_0));
        mDialectForXQuery3_1.setSelectedItem(mSettings.getDialectForXQueryVersion(XQueryVersion.VERSION_3_1));
    }
}
