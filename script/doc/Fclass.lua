---@class DataClass
---@field name string
---@field order integer
---@field description string
---@field notes string[]
---@field examples? string[]
---@field methods Method[]
---@field attributes DataClass.attribute[]
---@field operator table
---@field base_classes string[]

---@class Method
---@field name string
---@field order integer
---@field description string
---@field notes? string[]
---@field examples? string[]
---@field raises table
---@field parameters Parameter[]
---@field takes_table boolean
---@field return_values  Parameter[]

---@class Parameter
---@field name string
---@field order integer
---@field description string
---@field type string
---@field optional boolean

---@class DataClass.attribute
---@field name string
---@field order number
---@field description string
---@field type string
---@field read boolean
---@field write boolean

---@class DataClass.operator
---@field
---@field
---@field
---@field

