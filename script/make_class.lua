local Docomentation = require"script.make_doc"
local FieldDescription = require"script.make_field"
---@class ClassDescription
---@field fields FieldDescription[]
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
	return setmetatable(classDoc, ClassDoc)
end

function ClassDoc:tostring()
	local description = ""
	description = description..self.documentation:tostring()
	description = description..string.format("---@class %s", self.name).."\n"
	for index, field in ipairs(self.fields) do
		description = description..field:tostring().."\n"
	end
	description = description..string.format("local %s = {}", self.name).."\n"
	return description
end

return ClassDoc
