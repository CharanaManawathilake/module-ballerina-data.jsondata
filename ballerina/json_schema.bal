// Copyright (c) 2025, WSO2 LLC. (https://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

# The configuration for JSON schema string type constraints.
public type StringConstraintsConfig record {|
    # The maximum number of characters allowed in the string.
    int:Unsigned32 maxLength?;
    # The minimum number of characters required in the string.
    int:Unsigned32 minLength?;
    # A regular expression that the string must match.
    string:RegExp pattern?;
    # The format that the string must adhere to (e.g., email, date-time).
    string format?;
|};

# The annotation is used to specify validation constraints for string type.
public annotation StringConstraintsConfig StringConstraints on type;

# The configuration for JSON schema number type constraints.
public type NumberConstraintsConfig record {|
    # The inclusive upper bound of the constrained type.
    int|float|decimal maximum?;
    # The inclusive lower bound of the constrained type.
    int|float|decimal minimum?;
    # The exclusive upper bound of the constrained type.
    int|float|decimal exclusiveMaximum?;
    # The exclusive lower bound of the constrained type.
    int|float|decimal exclusiveMinimum?;
    # The number must be a multiple of this value.
    int|float|decimal multipleOf?;
|};

# The annotation is used to specify validation constraints for number type.
public annotation NumberConstraintsConfig NumberConstraints on type;

# The configuration for JSON Schema array type constraints.
public type ArrayConstraintsConfig record {|
    # The minimum number of items required in the array.
    int:Unsigned32 minItems = 0;
    # The maximum number of items allowed in the array.
    int:Unsigned32 maxItems?;
    # Specifies whether all items in the array must be unique.
    boolean uniqueItems?;
    # Specifies a schema that a specific number of items in the array must match.
    record {|
        # The minimum number of items required in the array that satisfies the schema.
        int:Unsigned32 minContains = 0;
        # The maximum number of items allowed in the array that satisfies the schema.
        int:Unsigned32 maxContains?;
        # The schema that items in the array must match.
        typedesc<json> value;
    |} contains?;
    # Specifies a schema for items that are not evaluated by contains.
    typedesc<json> unevaluatedItems?;
|};

# The annotation is used to specify validation constraints for array type.
public annotation ArrayConstraintsConfig ArrayConstraints on type;

# The configuration for JSON Schema object type.
public type ObjectConstraintsConfig record {|
    # The maximum number of properties allowed in the object.
    int:Unsigned32 maxProperties?;
    # The minimum number of properties required in the object.
    int:Unsigned32 minProperties?;
    # The schema to validate the names of properties in the object.
    typedesc<json> propertyNames?;
|};

# The annotation is used to specify validation constraints for object type.
public annotation ObjectConstraintsConfig ObjectConstraints on type;

# The configuration for a dependent schema in a JSON object field.
public type DependentSchemaConfig record {|
    # The dependent sub Schema
    typedesc<json> value;
|};

# The annotation is used to specify a dependent schema.
public annotation DependentSchemaConfig DependentSchema on record field;

# The configuration for fields dependent required on other fields.
public type DependentRequiredConfig record {|
    # The dependent required field/fields
    string|string[] value;
|};

# The annotation is used to specify dependent required fields.
public annotation DependentRequiredConfig DependentRequired on record field;

# Represents a single pattern property rule in a JSON object schema.
public type PatternPropertiesElement record {|
    # A regular expression that the property name must match
    string:RegExp pattern;
    # The type that properties matching the pattern must conform to
    typedesc<json> value;
|};

# The configuration for multiple pattern property rules.
public type PatternPropertiesElements record {|
    # The list of pattern property rules (each with a pattern and a type)
    PatternPropertiesElement|PatternPropertiesElement[] value;
|};

# Annotation used to define pattern property constraints on JSON object types.
public annotation PatternPropertiesElements PatternProperties on type;

# The configuration for additional properties.
public type AdditionalPropertiesConfig record {|
    # Data type of the respective field
    typedesc<json> value;
|};

# The annotation is used to specify additional properties in a JSON object.
public annotation AdditionalPropertiesConfig AdditionalProperties on type;

# The annotation is used to specify read-only fields.
public annotation ReadOnly on type;

# The annotation is used to specify write-only fields.
public annotation WriteOnly on type;

# Complete this.
public type MetaDataConfig record {|
    # The title of the field.
    string title?;
    # Complete this.
    json[] examples?;
    # Complete this.
    string comment?;
|};

# Complete this.
public annotation MetaDataConfig MetaData on type;

# Complete this.
public type StringEncodedDataConfig record {|
    # Complete this.
	string contentMediaType?;
    # Complete this.
	string contentEncoding?;
    # Complete this.
	typedesc<json> contentSchema?;
|};

# Complete this.
public annotation StringEncodedDataConfig StrignEncodedData on type;
