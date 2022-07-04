---@class Concept
---@field name string
---@field order number
---@field description string
---@field notes? string[]
---@field examples? string[]
---@field category string
---@field parameters? Parameter[]
---@field variavariant_parameter_groups? ParameterGroup[]
---@field variant_parameter_description? string
---@field options? Concept.spec[]|BasicMember[]
---@field attributes? Attribute[]

---@class Concept.spec
---@field type Type
---@field order number
---@field description string