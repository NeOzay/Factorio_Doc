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

---@param description? string
---@param notes? string[]
---@param examples? string[]
---@return DocomentationDescription
function Documentation.new(description, notes, examples)
	local documentation = {}
	documentation.description = description or ""
	documentation.notes = notes or {}
	documentation.examples = examples or {}
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
	local doc = add_balise(self.description).."\n"
	local notes = {}
	for index, note in ipairs(self.notes) do
		notes[index] = add_balise(note)
	end
	if #notes> 0 then
		doc = doc.."---\n"
		doc = doc..table.concat(notes,"\n---\\\n").."\n"
	end

	local examples = {}
	for index, example in ipairs(self.examples) do
		examples[index] = add_balise(example)
	end
  if #examples > 0 then
		doc = doc.."---\n"
		doc = doc..table.concat(examples,"\n---\\\n").."\n"
  end

	return doc
end


return Documentation
