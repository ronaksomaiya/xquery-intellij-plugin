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
package uk.co.reecedunn.intellij.plugin.xquery.parser;

import com.intellij.psi.tree.IElementType;
import com.intellij.psi.tree.IFileElementType;
import uk.co.reecedunn.intellij.plugin.xquery.lang.XQuery;

public interface XQueryElementType {
    IFileElementType FILE = new IFileElementType(XQuery.INSTANCE);

    IElementType CDATA_SECTION = new IElementType("XQUERY_CDATA_SECTION", XQuery.INSTANCE);
    IElementType COMMENT = new IElementType("XQUERY_COMMENT", XQuery.INSTANCE);
    IElementType NCNAME = new IElementType("XQUERY_NCNAME", XQuery.INSTANCE);
    IElementType QNAME = new IElementType("XQUERY_QNAME", XQuery.INSTANCE);
    IElementType URI_LITERAL = new IElementType("XQUERY_URI_LITERAL", XQuery.INSTANCE);
    IElementType VAR_NAME = new IElementType("XQUERY_VAR_NAME", XQuery.INSTANCE);

    IElementType LITERAL = new IElementType("XQUERY_LITERAL", XQuery.INSTANCE);
    IElementType STRING_LITERAL = new IElementType("XQUERY_STRING_LITERAL", XQuery.INSTANCE);
    IElementType VAR_REF = new IElementType("XQUERY_VAR_REF", XQuery.INSTANCE);
    IElementType PARENTHESIZED_EXPR = new IElementType("XQUERY_PARENTHESIZED_EXPR", XQuery.INSTANCE);
    IElementType CONTEXT_ITEM_EXPR = new IElementType("XQUERY_CONTEXT_ITEM_EXPR", XQuery.INSTANCE);
    IElementType ORDERED_EXPR = new IElementType("XQUERY_ORDERED_EXPR", XQuery.INSTANCE);
    IElementType UNORDERED_EXPR = new IElementType("XQUERY_UNORDERED_EXPR", XQuery.INSTANCE);
    IElementType FUNCTION_CALL = new IElementType("XQUERY_FUNCTION_CALL", XQuery.INSTANCE);

    IElementType AXIS_STEP = new IElementType("XQUERY_AXIS_STEP", XQuery.INSTANCE);
    IElementType ABBREV_FORWARD_STEP = new IElementType("XQUERY_ABBREV_FORWARD_STEP", XQuery.INSTANCE);
    IElementType REVERSE_STEP = new IElementType("XQUERY_REVERSE_STEP", XQuery.INSTANCE);
    IElementType ABBREV_REVERSE_STEP = new IElementType("XQUERY_ABBREV_REVERSE_STEP", XQuery.INSTANCE);
    IElementType FILTER_EXPR = new IElementType("XQUERY_FILTER_EXPR", XQuery.INSTANCE);
    IElementType PREDICATE_LIST = new IElementType("XQUERY_PREDICATE_LIST", XQuery.INSTANCE);
    IElementType PREDICATE = new IElementType("XQUERY_PREDICATE", XQuery.INSTANCE);

    IElementType RELATIVE_PATH_EXPR = new IElementType("XQUERY_RELATIVE_PATH_EXPR", XQuery.INSTANCE);
    IElementType PATH_EXPR = new IElementType("XQUERY_PATH_EXPR", XQuery.INSTANCE);
    IElementType UNARY_EXPR = new IElementType("XQUERY_UNARY_EXPR", XQuery.INSTANCE);
    IElementType CAST_EXPR = new IElementType("XQUERY_CAST_EXPR", XQuery.INSTANCE);
    IElementType CASTABLE_EXPR = new IElementType("XQUERY_CASTABLE_EXPR", XQuery.INSTANCE);
    IElementType TREAT_EXPR = new IElementType("XQUERY_TREAT_EXPR", XQuery.INSTANCE);
    IElementType INSTANCEOF_EXPR = new IElementType("XQUERY_INSTANCEOF_EXPR", XQuery.INSTANCE);
    IElementType INTERSECT_EXCEPT_EXPR = new IElementType("XQUERY_INTERSECT_EXCEPT_EXPR", XQuery.INSTANCE);
    IElementType UNION_EXPR = new IElementType("XQUERY_UNION_EXPR", XQuery.INSTANCE);
    IElementType MULTIPLICATIVE_EXPR = new IElementType("XQUERY_MULTIPLICATIVE_EXPR", XQuery.INSTANCE);
    IElementType ADDITIVE_EXPR = new IElementType("XQUERY_ADDITIVE_EXPR", XQuery.INSTANCE);
    IElementType RANGE_EXPR = new IElementType("XQUERY_RANGE_EXPR", XQuery.INSTANCE);
    IElementType COMPARISON_EXPR = new IElementType("XQUERY_COMPARISON_EXPR", XQuery.INSTANCE);
    IElementType AND_EXPR = new IElementType("XQUERY_AND_EXPR", XQuery.INSTANCE);
    IElementType OR_EXPR = new IElementType("XQUERY_OR_EXPR", XQuery.INSTANCE);

    IElementType QUERY_BODY = new IElementType("XQUERY_QUERY_BODY", XQuery.INSTANCE);
    IElementType EXPR = new IElementType("XQUERY_EXPR", XQuery.INSTANCE);
    IElementType ENCLOSED_EXPR = new IElementType("XQUERY_ENCLOSED_EXPR", XQuery.INSTANCE);

    IElementType IMPORT = new IElementType("XQUERY_IMPORT", XQuery.INSTANCE);
    IElementType SCHEMA_PREFIX = new IElementType("XQUERY_SCHEMA_PREFIX", XQuery.INSTANCE);
    IElementType NAMESPACE_DECL = new IElementType("XQUERY_NAMESPACE_DECL", XQuery.INSTANCE);
    IElementType SCHEMA_IMPORT = new IElementType("XQUERY_SCHEMA_IMPORT", XQuery.INSTANCE);
    IElementType MODULE_IMPORT = new IElementType("XQUERY_MODULE_IMPORT", XQuery.INSTANCE);
    IElementType PROLOG = new IElementType("XQUERY_PROLOG", XQuery.INSTANCE);

    IElementType TYPE_NAME = new IElementType("XQUERY_TYPE_NAME", XQuery.INSTANCE);
    IElementType ELEMENT_NAME_OR_WILDCARD = new IElementType("XQUERY_ELEMENT_NAME_OR_WILDCARD", XQuery.INSTANCE);
    IElementType ELEMENT_NAME = new IElementType("XQUERY_ELEMENT_NAME", XQuery.INSTANCE);
    IElementType ELEMENT_DECLARATION = new IElementType("XQUERY_ELEMENT_DECLARATION", XQuery.INSTANCE);
    IElementType ATTRIB_NAME_OR_WILDCARD = new IElementType("XQUERY_ATTRIB_NAME_OR_WILDCARD", XQuery.INSTANCE);
    IElementType ATTRIBUTE_NAME = new IElementType("XQUERY_ATTRIBUTE_NAME", XQuery.INSTANCE);
    IElementType ATTRIBUTE_DECLARATION = new IElementType("XQUERY_ATTRIBUTE_DECLARATION", XQuery.INSTANCE);

    IElementType DOCUMENT_TEST = new IElementType("XQUERY_DOCUMENT_TEST", XQuery.INSTANCE);
    IElementType ELEMENT_TEST = new IElementType("XQUERY_ELEMENT_TEST", XQuery.INSTANCE);
    IElementType SCHEMA_ELEMENT_TEST = new IElementType("XQUERY_SCHEMA_ELEMENT_TEST", XQuery.INSTANCE);
    IElementType ATTRIBUTE_TEST = new IElementType("XQUERY_ATTRIBUTE_TEST", XQuery.INSTANCE);
    IElementType SCHEMA_ATTRIBUTE_TEST = new IElementType("XQUERY_SCHEMA_ATTRIBUTE_TEST", XQuery.INSTANCE);
    IElementType PI_TEST = new IElementType("XQUERY_PI_TEST", XQuery.INSTANCE);
    IElementType COMMENT_TEST = new IElementType("XQUERY_COMMENT_TEST", XQuery.INSTANCE);
    IElementType TEXT_TEST = new IElementType("XQUERY_TEXT_TEST", XQuery.INSTANCE);
    IElementType ANY_KIND_TEST = new IElementType("XQUERY_ANY_KIND_TEST", XQuery.INSTANCE);
    IElementType ATOMIC_TYPE = new IElementType("XQUERY_ATOMIC_TYPE", XQuery.INSTANCE);
    IElementType ITEM_TYPE = new IElementType("XQUERY_ITEM_TYPE", XQuery.INSTANCE);
    IElementType OCCURRENCE_INDICATOR = new IElementType("XQUERY_OCCURRENCE_INDICATOR", XQuery.INSTANCE);
    IElementType TYPE_DECLARATION = new IElementType("XQUERY_TYPE_DECLARATION", XQuery.INSTANCE);
    IElementType SEQUENCE_TYPE = new IElementType("XQUERY_SEQUENCE_TYPE", XQuery.INSTANCE);

    IElementType PARAM = new IElementType("XQUERY_PARAM", XQuery.INSTANCE);
    IElementType PARAM_LIST = new IElementType("XQUERY_PARAM_LIST", XQuery.INSTANCE);

    IElementType FUNCTION_DECL = new IElementType("XQUERY_FUNCTION_DECL", XQuery.INSTANCE);
    IElementType CONSTRUCTION_DECL = new IElementType("XQUERY_CONSTRUCTION_DECL", XQuery.INSTANCE);
    IElementType VAR_DECL = new IElementType("XQUERY_VAR_DECL", XQuery.INSTANCE);
    IElementType BASE_URI_DECL = new IElementType("XQUERY_BASE_URI_DECL", XQuery.INSTANCE);
    IElementType DEFAULT_COLLATION_DECL = new IElementType("XQUERY_DEFAULT_COLLATION_DECL", XQuery.INSTANCE);
    IElementType COPY_NAMESPACES_DECL = new IElementType("XQUERY_COPY_NAMESPACES_DECL", XQuery.INSTANCE);
    IElementType EMPTY_ORDER_DECL = new IElementType("XQUERY_EMPTY_ORDER_DECL", XQuery.INSTANCE);
    IElementType ORDERING_MODE_DECL = new IElementType("XQUERY_ORDERING_MODE_DECL", XQuery.INSTANCE);
    IElementType OPTION_DECL = new IElementType("XQUERY_OPTION_DECL", XQuery.INSTANCE);
    IElementType DEFAULT_NAMESPACE_DECL = new IElementType("XQUERY_DEFAULT_NAMESPACE_DECL", XQuery.INSTANCE);
    IElementType BOUNDARY_SPACE_DECL = new IElementType("XQUERY_BOUNDARY_SPACE_DECL", XQuery.INSTANCE);
    IElementType UNKNOWN_DECL = new IElementType("XQUERY_UNKNOWN_DECL", XQuery.INSTANCE);
    IElementType MODULE_DECL = new IElementType("XQUERY_MODULE_DECL", XQuery.INSTANCE);
    IElementType VERSION_DECL = new IElementType("XQUERY_VERSION_DECL", XQuery.INSTANCE);
    IElementType MAIN_MODULE = new IElementType("XQUERY_MAIN_MODULE", XQuery.INSTANCE);
    IElementType LIBRARY_MODULE = new IElementType("XQUERY_LIBRARY_MODULE", XQuery.INSTANCE);
    IElementType MODULE = new IElementType("XQUERY_MODULE", XQuery.INSTANCE);

    IElementType CONSTRUCTOR = new IElementType("XQUERY_CONSTRUCTOR", XQuery.INSTANCE);
    IElementType DIR_ELEM_CONSTRUCTOR = new IElementType("XQUERY_DIR_ELEM_CONSTRUCTOR", XQuery.INSTANCE);
    IElementType DIR_ATTRIBUTE_LIST = new IElementType("XQUERY_DIR_ATTRIBUTE_LIST", XQuery.INSTANCE);
    IElementType DIR_ATTRIBUTE_VALUE = new IElementType("XQUERY_DIR_ATTRIBUTE_VALUE", XQuery.INSTANCE);
    IElementType DIR_COMMENT_CONSTRUCTOR = new IElementType("XQUERY_DIR_COMMENT_CONSTRUCTOR", XQuery.INSTANCE);
    IElementType DIR_PI_CONSTRUCTOR = new IElementType("XQUERY_DIR_PI_CONSTRUCTOR", XQuery.INSTANCE);
    IElementType DIR_ELEM_CONTENT = new IElementType("XQUERY_DIR_ELEM_CONTENT", XQuery.INSTANCE);
    IElementType COMP_DOC_CONSTRUCTOR = new IElementType("XQUERY_COMP_DOC_CONSTRUCTOR", XQuery.INSTANCE);
    IElementType COMP_ELEM_CONSTRUCTOR = new IElementType("XQUERY_COMP_ELEM_CONSTRUCTOR", XQuery.INSTANCE);
    IElementType CONTENT_EXPR = new IElementType("XQUERY_CONTENT_EXPR", XQuery.INSTANCE);
    IElementType COMP_ATTR_CONSTRUCTOR = new IElementType("XQUERY_COMP_ATTR_CONSTRUCTOR", XQuery.INSTANCE);
    IElementType COMP_TEXT_CONSTRUCTOR = new IElementType("XQUERY_COMP_TEXT_CONSTRUCTOR", XQuery.INSTANCE);
    IElementType COMP_COMMENT_CONSTRUCTOR = new IElementType("XQUERY_COMP_COMMENT_CONSTRUCTOR", XQuery.INSTANCE);
    IElementType COMP_PI_CONSTRUCTOR = new IElementType("XQUERY_COMP_PI_CONSTRUCTOR", XQuery.INSTANCE);
}
