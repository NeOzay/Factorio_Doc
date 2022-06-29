local Docomentation = require"script.make_doc"
local FieldDescription = require"script.make_field"
local MethodDescription = require"script.make_method"
---@class ClassDescription
---@field fields FieldDescription[]
---@field methods MethodDescription[]
local ClassDoc = {}
ClassDoc.__index = ClassDoc

---@param class Class
---@return ClassDescription
function ClassDoc.new(class)
	---@class ClassDescription
	local classDoc = {}
	classDoc.raw = class
	classDoc.name = class.name
	classDoc.documentation = Docomentation.new(class.description, class.notes, class.examples)
	classDoc.fields = {}
	local fields = classDoc.fields
	for index, attribute in ipairs(class.attributes) do
		fields[index] = FieldDescription.new(attribute)
	end

	classDoc.methods = {}
	local methods = classDoc.methods
	for index, m in ipairs(class.methods) do
		methods[index] = MethodDescription.new(m, class.name)
	end

	return setmetatable(classDoc, ClassDoc)
end

function ClassDoc:tostring()
	local description = ""
	description = description..self.documentation:tostring()
	description = description..string.format("---@class %s", self.name).."\n"
	for index, field in ipairs(self.fields) do
		description = description..field:tostring()
	end
	description = description..string.format("local %s = {}", self.name).."\n"
	description = description.."\n"

	for index, method in ipairs(self.methods) do
		description = description..method:tostring().."\n"
	end

	return description
end

return ClassDoc
