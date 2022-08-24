local PET_NAME = script:GetCustomProperty("PetName"):WaitForObject()
local WORD_LIST = require(script:GetCustomProperty("WordList"))
local ENABLED = script:GetCustomProperty("Enabled")

local function CensorWords(obj, text)
	for index, row in ipairs(WORD_LIST) do
		text = string.gsub(text, row.Find, row.Replacement)
		text = string.gsub(text, string.lower(row.Find), row.Replacement)
	end

	PET_NAME.text = text
end

if(ENABLED) then
	PET_NAME.textChangedEvent:Connect(CensorWords)
	PET_NAME.textCommittedEvent:Connect(CensorWords)
end