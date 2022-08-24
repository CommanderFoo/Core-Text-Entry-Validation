local PET_NAME = script:GetCustomProperty("PetName"):WaitForObject()
local COUNTER = script:GetCustomProperty("Counter"):WaitForObject()
local MAX_LENGTH = script:GetCustomProperty("MaxLength")
local ENABLED = script:GetCustomProperty("Enabled")

local function UpdateCounter()
	COUNTER.text = string.format("%s/%s", string.len(PET_NAME.text), MAX_LENGTH)
end

local function CheckLength(obj, text)
	local len = string.len(text)

	if len > MAX_LENGTH then
		PET_NAME.text = string.sub(text, 1, MAX_LENGTH)
	end
	
	UpdateCounter()
end

if(ENABLED) then
	PET_NAME.textChangedEvent:Connect(CheckLength)
	PET_NAME.textCommittedEvent:Connect(CheckLength)

	UpdateCounter()
else
	COUNTER.visibility = Visibility.FORCE_OFF
end
