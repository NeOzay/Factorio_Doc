---@class ClassDescription
---@field fields FieldDescription[]
---@field methods MethodDescription[]
---@field extras string[]
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
	classDoc.extras = {}
	classDoc.fields = {}
	classDoc.base_classes = class.base_classes
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

---@param event Event
function ClassDoc.fromEvent(event)
	local classDoc = setmetatable({}, ClassDoc)
	classDoc.name = event.name
	classDoc.documentation = Docomentation.new(event.description, event.notes, event.examples)
	classDoc.extras = {}
	classDoc.methods = {}
	classDoc.fields = {}
	local fields = classDoc.fields
	for index, field in ipairs(event.data) do
		fields[index] = FieldDescription.fromParameter(field)
	end
	return classDoc
end

function ClassDoc:tostring()
	current.class = self
	local description = ""
	description = description..self.documentation:tostring()

	local classHeading = string.format("---@class %s", self.name)
	if self.base_classes and #self.base_classes > 0 then
		classHeading = classHeading..(":%s"):format(table.concat(self.base_classes, ", "))
	end
	description = description..classHeading.."\n"

	for index, field in ipairs(self.fields) do
		description = description..field:tostring()
	end
	description = description..("local %s = {}\n"):format(self.name)
	description = description.."\n"

	for index, method in ipairs(self.methods) do
		description = description..method:tostring().."\n"
	end

	if #self.extras > 0 then
		description = description.."\n"
		for index, extra in ipairs(self.extras) do
			description = description..extra.."\n"
		end
		
	end
	return description
end

return ClassDoc
