
local _defines = data.defines

local subList = {} ---@type string[]
local aliasList = {} ---@type string[]
---@param define DefineBase
local function make_sub(define)
	local def = "---@class "..define.name.."\n"

	if define.values then
		local alias = ("---@alias %s\n"):format(define.name:lower())
		for index, member in ipairs(define.values) do
			alias = alias .. ("---| `%s`\n"):format(define.name:lower().."."..member.name)

			local _type = define.name:find("event") and member.name or "any"
			def = def..("---@field %s %s"):format(member.name, _type)
			if member.description ~= "" then
				def = def.." @"..member.description
			end
			def = def.."\n"
		end
		table.insert(aliasList, alias)
	end

	if define.subkeys then
		for index, sub in ipairs(define.subkeys) do
			local name = sub.name
			sub.name = define.name..'.'..sub.name
			def = def..("---@field %s %s"):format(name, make_sub(sub))
			if sub.description ~= "" then
				def = def.." @"..sub.description
			end
			def = def.."\n"
		end
	end
	table.insert(subList, def)
	return define.name
end

local def = "---@class Defines".."\n"
for index, define in ipairs(_defines) do
	local name = define.name
	define.name = "Defines."..define.name
	def = def..("---@field %s %s"):format(name, make_sub(define))
	if define.description ~= "" then
		def = def.." @"..define.description
	end
	def = def.."\n"
end

def = def.."\n"
def = def..table.concat(subList, "\n")
local alias = table.concat(aliasList, "\n")

make_file(def, "./factorio_doc/defines.lua")
make_file(alias,"./factorio_doc/defines_alias.lua" )

