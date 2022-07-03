local concepts = data.concepts

local concepts_types = {}

---@param concept Concept
concepts_types.table = function (concept)
	local def = ("---@class %s\n"):format(concept.name)
	for index, param in ipairs(concept.parameters) do
		def = def..FieldDescription.fromParameter(param):tostring()
	end
	return def
end

---@param concept Concept
concepts_types.table_or_array = function (concept)
	local def = ("---@class %s\n"):format(concept.name)
	table.sort(concept.parameters, function (a, b) return a.order < b.order	end)
	for index, param in ipairs(concept.parameters) do
		local field = FieldDescription.fromParameter(param)
		local fieldIndex = ("---@field [%s] %s\n"):format(index, solve_type(field.type))
		def = def..field:tostring()
		def = def..fieldIndex
	end
	return def
end

---@param concept Concept
concepts_types.enum = function (concept)
	
end

---@param concept Concept
concepts_types.flag = function (concept)
	
end

---@param concept Concept
concepts_types.union = function (concept)
	
end

---@param concept Concept
concepts_types.filter = function (concept)
	
end

---@param concept Concept
concepts_types.struct = function (concept)
	
end

---@param concept Concept
concepts_types.concept = function (concept)
	
end


local function solve_concept()
	local def = ""
	for index, concepts in ipairs(concepts) do
		def = def..(concepts_types[concepts.category](concepts) or ("---@class %s\n"):format(concepts.name)).."\n"
	end
	return def
end

make_file(solve_concept(), "./factorio_doc/concept.lua")