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
	if attribute.notes or attribute.examples or attribute.description:find("\n") then
		field.documentation = Docomentation.new(attribute.description..rw, attribute.notes, attribute.examples)
	else
		field.documentation = attribute.description..rw
	end

	return setmetatable(field, FieldDoc)
end

---@param parameter Parameter
function FieldDoc.fromParameter(parameter)
	---@type FieldDescription
	local field = setmetatable({}, FieldDoc)
	field.name = parameter.name..(parameter.optional and "?" or "")
	field.type = parameter.type
	if parameter.description:find("\n") then
		field.documentation = Docomentation.new(parameter.description)
	else
		field.documentation = parameter.description
	end
	return field
end

function FieldDoc:tostring()
	current.field = self.name
	local description = ("---@field %s %s"):format(self.name, solve_type(self.type))

	if type(self.documentation) == "string" then
		if self.documentation ~= "" then
			description = description.." @"..self.documentation
		end
	else
		description = self.documentation:tostring()..description
	end
	return description.."\n"
end

return FieldDoc
