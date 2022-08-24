local PET_NAME = script:GetCustomProperty("PetName"):WaitForObject()
local ENABLED = script:GetCustomProperty("Enabled")

local function NumbersOnly(obj, text)
	if string.find(text, "%D") then
		text = string.gsub(text, "%D", "")
	end

	PET_NAME.text = text
end

if(ENABLED) then
	PET_NAME.textChangedEvent:Connect(NumbersOnly)
	PET_NAME.textCommittedEvent:Connect(NumbersOnly)
end