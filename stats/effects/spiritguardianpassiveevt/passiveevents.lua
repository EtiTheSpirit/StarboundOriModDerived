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

function SayAsSAIL(Message, MessageId)
	local RadioMessage = {
		type="mission",
		text=Message,
		unique=true,
		messageId=MessageId or tostring(math.random())
	}
	world.sendEntityMessage(entity.uniqueId(), "radioMessage", RadioMessage) --Added by questAccessDeployment.lua in scripts
end

function OriBirthdayFunction(IsBirthday)
	if not IsBirthday then return end
	local Year, Month, Day = CurrentDate()
	local OriYear = tostring(Year - 2015)
	SayAsSAIL("I just thought I'd let you know that today is ^cyan;Ori^reset;'s ^green;" .. OriYear .. GetNumberEnding(OriYear) .. "^reset; birthday. I've taken the liberty of sending a virtual postcard for you. You can thank me later.", "OriBirthday"..OriYear)
	-- if world.sendEntityMessage(entity.uniqueId(), "hasCompletedQuest", "march11"):result() then return end
	-- world.sendEntityMessage(entity.uniqueId(), "startQuest", "march11") --Added by questAccessDeployment.lua in scripts
end

function XanBirthdayFunction(IsBirthday)
	if not IsBirthday then return end
	local Year, Month, Day = CurrentDate()
	local XanYear = tostring(Year - 1626)
	local ActualXanYear = tostring(Year - 2000)
	SayAsSAIL("Today's is ^#FF3F00;Xan^reset;'s ^green;" .. XanYear .. GetNumberEnding(XanYear) .. "^reset; birthday ^darkgray;(" .. ActualXanYear .. GetNumberEnding(ActualXanYear) .. " birthday in real life)^reset;. You probably don't know who he is. He's the Draconian who found the ^cyan;Spirit Guardian^reset; homeworld, ^cornflowerblue;Nibel^reset;, and suggested your race be annexed into ^yellow;The Protectorate^reset;. I thought I'd let you know.", "XanBirthday"..ActualXanYear)
end

function init()
	local Year, Month, Day = CurrentDate()
	self.IsOrisBirthday = (Month == 3 and Day == 11)
	self.IsXansBirthday = (Month == 7 and Day == 11) --xan did 7/11 >:(
	
	self.hasDoneStuff = false
end

function update(dt)
	if not self.hasDoneStuff then 
		self.hasDoneStuff = true
		OriBirthdayFunction(self.IsOrisBirthday)
		XanBirthdayFunction(self.IsXansBirthday)
	end
end

function uninit()
end
