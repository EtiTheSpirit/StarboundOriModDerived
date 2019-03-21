require "/scripts/vec2.lua"
require "/scripts/util.lua"
require "/scripts/interp.lua"

function GetNumberEnding(Number)
	local Number = tostring(Number)
	local LastDigit = Number:sub(Number:len(), Number:len())
	if LastDigit == "1" then
		return "st"
	elseif LastDigit == "2" then
		return "nd"
	elseif LastDigit == "3" then
		return "rd"
	end
	return "th"
	--0th, 1st, 2nd, 3rd, 4th, 5th, 6th, 7th, 8th, 9th
	--My 2th hurts.
	--I'm not sorry.
end

function CurrentDate(z)
	--Credits to https://scriptinghelpers.org/questions/25121/how-do-you-get-the-date-and-time-from-unix-epoch-time
	local z = z or os.time()
    local z = math.floor(z / 86400) + 719468
    local era = math.floor(z / 146097)
    local doe = math.floor(z - era * 146097)
    local yoe = math.floor((doe - doe / 1460 + doe / 36524 - doe / 146096) / 365)
    local y = math.floor(yoe + era * 400)
    local doy = doe - math.floor((365 * yoe + yoe / 4 - yoe / 100))
    local mp = math.floor((5 * doy + 2) / 153)
    local d = math.ceil(doy - (153 * mp + 2) / 5 + 1)
    local m = math.floor(mp + (mp < 10 and 3 or -9))
    return y + (m <= 2 and 1 or 0), m, d
end

function OriBirthdayFunction(IsBirthday)
	if IsBirthday then
		-- local Year, Month, Day = CurrentDate()
		-- local OriYear = tostring(Year - 2015)
		-- local RadioMessage = {type="mission", 
			-- text="I just thought I'd let you know that today is Ori's " .. OriYear .. GetNumberEnding(OriYear) .. " birthday."
		-- }
		-- world.sendEntityMessage(entity.uniqueId(), "radioMessage", RadioMessage)
		if world.sendEntityMessage(entity.uniqueId(), "hasCompletedQuest", "march11") then return end
		world.sendEntityMessage(entity.uniqueId(), "startQuest", "march11") --Added by questAccessDeployment.lua in scripts
	end 
end

function init()
	local Year, Month, Day = CurrentDate()
	self.IsOrisBirthday = (Month == 3 and Day == 11)
	
	self.hasDoneStuff = false
end

function update(dt)
	if not self.hasDoneStuff then 
		self.hasDoneStuff = true
		OriBirthdayFunction(self.IsOrisBirthday)
	end 
end

function uninit()
end
