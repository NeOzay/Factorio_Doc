---@class ClassDescription
local ClassDoc = {}
ClassDoc.__index = ClassDoc

function ClassDoc.new()
	local classDoc = {}
	return setmetatable(classDoc, ClassDoc)
end

function ClassDoc:tostring()
	
end
