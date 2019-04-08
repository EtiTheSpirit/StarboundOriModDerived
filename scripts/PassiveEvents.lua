require "/scripts/vec2.lua"
require "/scripts/util.lua"
require "/scripts/interp.lua"
require "/scripts/xcore/LuaRadioMessage.lua"
require "/scripts/xcore/InitializationUtility.lua"

local OLD_INIT_FUNC_LOCAL = init --_LOCAL because InitializationUtility uses the same var name, and things will get mixed up if I use it.

function init()
	local Year, Month, Day = CurrentDate()
	self.isOrisBirthday = (Month == 3 and Day == 11)
	self.isXansBirthday = (Month == 7 and Day == 11)
	--self.postInitIsLate = true
	
	local oriYear = tostring(Year - 2015)
	local xanYear = tostring(Year - 1682)
	local realXanYear = tostring(Year - 2000)
	
	self.oriBirthdayMessage = LuaRadioMessage:NewMessage({
		text = "I just thought I'd let you know that today is ^cyan;Ori^reset;'s ^green;" .. GetNumberWithEnding(oriYear) .. "^reset; birthday. I've taken the liberty of sending a virtual postcard for you. You can thank me later.";
		
		unique = true;
		messageId = "oribirthday" .. oriYear;
	})
	
	self.xanBirthdayMessage = LuaRadioMessage:NewMessage({
		text = "Today is ^#FF3F00;Xan^reset;'s ^green;" .. GetNumberWithEnding(xanYear) .. " ^gray;(" .. GetNumberWithEnding(realXanYear) .. ")^reset; birthday. You probably don't know who he is. He's the dragon responsible for proposing the annexation of ^#99BBFF;Spirit Guardians^reset; into ^yellow;The Protectorate.";
		persistTime = 10;
		unique = true;
		messageId = "xanbirthday" .. realXanYear;
	})
	
	--Poll's over! Check species folder for more info.
	--[[
	self.tempPollMessage = LuaRadioMessage:NewMessage({
		text = "This is ^#FF3F00;Xan^reset; speaking. Some critical changes are being done to the ^#99BBFF;Spirit Guardian^reset; mod, and I need your opinions. ^cyan;Go to the workshop page to see the link.^reset;";
		persistTime = 12;
		important = true;
		senderName = "^#FF3F00Xan^reset;";
		portraitImage = "/interface/chatbubbles/other/xan.png:<frame>";
		portraitSpeed = 0.5;
		chatterSound = "/sfx/interface/xanchatter.ogg";
		unique = true;
		messageId = "PollMessage0"
	})
	--]]
	--self.hasDoneStuff = false
	if OLD_INIT_FUNC_LOCAL then
		OLD_INIT_FUNC_LOCAL()
	end
end

function postinit()
	-- if self.tempPollMessage then
		-- self.tempPollMessage:SendToEntityInWorld(entity, world)
	-- end
	if self.isOrisBirthday and self.oriBirthdayMessage then
		self.oriBirthdayMessage:SendToEntityInWorld(entity, world)
	end
	if self.isXansBirthday and self.xanBirthdayMessage then
		self.xanBirthdayMessage:SendToEntityInWorld(entity, world)
	end
end

function GetNumberWithEnding(Number)
	return tostring(Number) .. GetNumberEnding(Number)
end

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