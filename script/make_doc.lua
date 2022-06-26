---@class DocomentationDescription
---@field description string
---@field notes string[]
---@field examples string[]
local Documentation = {}
Documentation.__index = Documentation

---@param s string
---@return string
local function add_balise(s)
	s = "---"..s
	s = string.gsub(s, "\n", "\n---")

	s = string.gsub(s, "```", "```lua", 1)
	return s
end



function Documentation.new()
	local documentation = {}
	documentation.description = ""
	documentation.notes = {}
	documentation.examples = {}
	return setmetatable(documentation, Documentation)
end

---@param description string
function Documentation:add_description(description)
	self.description = description
end
---@param notes string[]
function Documentation:add_notes(notes)
	self.notes = notes or {}
end
---@param examples string[]
function Documentation:add_examples(examples)
	self.examples = examples or {}
end

function Documentation:tostring()
	local doc = add_balise(self.description).."\n---\n"
	for index, note in ipairs(self.notes) do
		doc =	doc..add_balise(note).."\n"
	end
	doc = doc.."---\n"
	for index, example in ipairs(self.examples) do
		doc = doc..add_balise(example).."\n--- -\n"
	end

	return doc
end


return Documentation
