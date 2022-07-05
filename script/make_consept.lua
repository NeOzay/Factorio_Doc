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
	local def = ("---@alias %s\n"):format(concept.name)
	for index, member in ipairs(concept.options) do
		---@cast member -Concept.spec
		def = def..("---| \"%s\"\n"):format(member.name)
	end
	return def
end

---@param concept Concept
concepts_types.flag = function (concept)
	local members = concept.options--[[@as BasicMember[]
	]]

	local def = ("---@class %s\n"):format(concept.name)

	for index, member in ipairs(members) do
		local field = ("---@field %s boolean"):format(member.name)
		if member.description ~= "" then
			field = field.." @"..member.description
		end
		def = def..field.."\n"
	end
	return def
end

---@param concept Concept
concepts_types.union = function (concept)
	local types = {}
	for index, spec in ipairs(concept.options) do
		types[index] = solve_type(spec.type)
	end
	return ("---@alias %s %s\n"):format(concept.name, table.concat(types, "|"))
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
	for index, concept in ipairs(concepts) do
		current.class = concept.name
		def = def..Docomentation.new(concept.description, concept.notes, concept.examples):tostring()
		def = def..(concepts_types[concept.category](concept) or ("---@class %s\n"):format(concept.name)).."\n"
	end
	return def
end

make_file(solve_concept(), "./factorio_doc/concept.lua")
