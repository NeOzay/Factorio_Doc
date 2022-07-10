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
	local members = concept.options--[[@as BasicMember[] ]]

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
	local params = concept.parameters --[[@as Parameter[] ]]
	table.sort(params, function (a, b)
		return a.order < b.order
	end)

	table.sort(concept.variant_parameter_groups, function (a, b)
		return a.order < b.order
	end)

	local variant_parameter_groups_list = {}

	local variant_parameter_field_list = {}
	for index, variant_parameter in ipairs(concept.variant_parameter_groups) do
		variant_parameter_groups_list[index] = ('"%s"'):format(variant_parameter.name)

		for index, param in ipairs(variant_parameter.parameters) do
			
			if not variant_parameter_field_list[param.name] then
				variant_parameter_field_list[param.name] = {}
			end
			local _type = solve_type(param.type)
			local found
			for index, t in ipairs(variant_parameter_field_list[param.name]) do
				if t ==_type then
					found = true
					break
				end
			end
			if not found  then
				table.insert(variant_parameter_field_list[param.name], _type)
			end
		end
	end

	local def = ("---@class %s\n"):format(concept.name)
	params[1].type = table.concat(variant_parameter_groups_list,"|")
	params[2].type = '"or"|"and"'

	for index, param in ipairs(concept.parameters) do
		def = def..FieldDescription.fromParameter(param):tostring()
	end
	for name, variant_parameter_field in pairs(variant_parameter_field_list) do
		def = def..("---@field %s? %s\n"):format(name, table.concat(variant_parameter_field, "|"))
	end
	return def
end

---@param concept Concept
concepts_types.struct = function (concept)
	local attributes = concept.attributes

	local def = ("---@class %s\n"):format(concept.name)
	for index, attribute in ipairs(attributes) do
		local field = FieldDescription.new(attribute)
		def = def..field:tostring()
	end
	return def
end

---@param concept Concept
concepts_types.concept = function (concept)
	return ("---@alias %s  any\n"):format(concept.name)
end


local function solve_concept()
	local def = ""
	for index, concept in ipairs(concepts) do
		if concept.custom then
			def = def..concept.custom
		else
			def = def..DocDescription.new(concept.description, concept.notes, concept.examples):tostring()
			def = def..(concepts_types[concept.category](concept) or ("---@class %s\n"):format(concept.name)).."\n"
		end
	end
	return def
end

make_file(solve_concept(), "./factorio_doc/concept.lua")
