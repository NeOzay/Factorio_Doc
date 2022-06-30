---@alias Type string|ComplexType
---@alias Operator Attribute|Method

---@class Class
---@field name string
---@field order integer
---@field description string
---@field notes string[]
---@field examples? string[]
---@field methods Method[]
---@field attributes Attribute[]
---@field operators Operator[]
---@field base_classes string[]

---@class Method
---@field name string
---@field order integer
---@field description string
---@field notes? string[]
---@field examples? string[]
---@field raises? EventRaised
---@field subclasses? string[]
---@field parameters Parameter[]
---@field variant_parameter_groups? ParameterGroup
---@field variant_parameter_description? string
---@field variadic_type? Type
---@field variadic_description string
---@field takes_table boolean
---@field table_is_optional? boolean
---@field return_values  Parameter[]

---@class Parameter
---@field name string
---@field order integer
---@field description string
---@field type string
---@field optional boolean

---@class Attribute
---@field name string
---@field order number
---@field description string
---@field notes? string[]
---@field examples? string[]
---@field raises? EventRaised
---@field subclasses? string[]
---@field type Type
---@field read boolean
---@field write boolean

---@class EventRaised
---@field name string
---@field order number
---@field description string
---@field timeframe string
---@field optional boolean

---@class ParameterGroup
---@field name string
---@field order number
---@field description string
---@field parameters Parameter[]
