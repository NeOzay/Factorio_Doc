local complex_type = {}

---@param _type Type
local function solve_type(_type)
	return type(_type) ~= "string" and complex_type[_type.complex_type](_type) or tostring(_type)
end

---@param _type ComplexType
complex_type.variant = function (_type)
	local types = {}
	for index, t in ipairs(_type.options) do
		types[index] = solve_type(t)
	end
	return table.concat(types, "|")
end

---@param _type ComplexType
complex_type.array = function (_type)
	return ("%s[]"):format(solve_type(_type.value))
end

---@param _type ComplexType
complex_type.dictionary = function (_type)
	return ("table<%s, %s>"):format(solve_type(_type.key), solve_type(_type.value))
end

---@param _type ComplexType
complex_type.LuaCustomTable = complex_type.dictionary

---@param _type ComplexType
complex_type["function"] = function (_type)
	local args = {}
	for index, param in ipairs(_type.parameters) do
		---@cast param -Parameter
		args[index] = ("_arg%s:%s"):format(index, solve_type(param))
	end
	return ("fun(%s)"):format(table.concat(args, ", "))
end

---@param _type ComplexType
complex_type.LuaLazyLoadedValue = function (_type)
	
end

---@param _type ComplexType
complex_type.table = function (_type)
	local name = current.class.name.."."..current.field.name
	local def = ("---@class %s"):format(name).."\n"
	for index, param in ipairs(_type.parameters) do
		---@cast param -Type
		def = def..FieldDescription.fromParameter(param)
	end

	table.insert(current.class.extras, def)
	return name
end

return solve_type
