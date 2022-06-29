local Docomentation = require"script.make_doc"

---@class FieldDescription
local FieldDoc = {}
FieldDoc.__index = FieldDoc

---@param attribute Attribute
function FieldDoc.new(attribute)
	---@class FieldDescription
	local field = {}
	field.raw = attribute
	field.name = attribute.name
	field.type = attribute.type
	local rw = ("`[%s]`"):format((attribute.read and "R" or "")..(attribute.write and "W" or ""))
	if attribute.notes or attribute.examples then
		field.documentation = Docomentation.new(attribute.description..rw, attribute.notes, attribute.examples)
	else
		field.documentation = attribute.description..rw
	end
	
	return setmetatable(field, FieldDoc)
end

function FieldDoc:tostring()
	local description = string.format("---@field %s %s", self.name, self.type)

	if type(self.documentation) == "string" then
		description = description.." @"..self.documentation
	else
		description = self.documentation:tostring()..description
	end
	return description.."\n"
end

return FieldDoc
