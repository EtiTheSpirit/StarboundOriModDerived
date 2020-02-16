require("/scripts/vec2.lua")
require("/scripts/util.lua")
require("/scripts/interp.lua")
require("/scripts/xcore/LuaRadioMessage.lua")
require("/scripts/xcore/InitializationUtility.lua")
require("/scripts/xcore/XUtils.lua")
require("/scripts/xmodcfg_util/XModConfigProxy.lua")

local XModConfig

local OLD_INIT_FUNC_LOCAL = init


-- Naming convention:
-- GAME_(length)	= Audio files denoted of a specific length ("short", "med", "long") based on the game's internal filename.
-- (length)			= Audio files sorted by file length.
--						Short		= 2 to 4 seconds
--						Medium		= 5 to 7 seconds
--						Long		= 11 to 13 seconds
--						Super Long	= 18 seconds (This was originally stored in long, but the difference was large compared to the other files which may have adverse effects in random selection.)

-- UPDATE: USING STANDARD AUDIO FILES, NOT THE EXTENDED ONES.
-- Radio chatter sounds stop the sound as soon as the text stops.
-- Additionally, the chatter sounds like this might be annoying to players.
local SEIN_CHATTER_SOUNDS = {
	GAME_LONG = {"/sfx/interface/sein/standard/oriSpeechLongA.ogg", "/sfx/interface/sein/standard/oriSpeechLongB.ogg", "/sfx/interface/sein/standard/oriSpeechLongC.ogg", "/sfx/interface/sein/standard/oriSpeechLongD.ogg"};
	GAME_MEDIUM = {"/sfx/interface/sein/standard/oriSpeechMedA.ogg", "/sfx/interface/sein/standard/oriSpeechMedB.ogg", "/sfx/interface/sein/standard/oriSpeechMedC.ogg", "/sfx/interface/sein/standard/oriSpeechMedD.ogg", "/sfx/interface/sein/standard/oriSpeechMedE.ogg", "/sfx/interface/sein/standard/oriSpeechMedF.ogg", "/sfx/interface/sein/standard/oriSpeechMedG.ogg"};
	GAME_SHORT = {"/sfx/interface/sein/standard/oriSpeechShortA.ogg", "/sfx/interface/sein/standard/oriSpeechShortB.ogg", "/sfx/interface/sein/standard/oriSpeechShortC.ogg", "/sfx/interface/sein/standard/oriSpeechShortD.ogg", "/sfx/interface/sein/standard/oriSpeechShortE.ogg", "/sfx/interface/sein/standard/oriSpeechShortF.ogg", "/sfx/interface/sein/standard/oriSpeechShortG.ogg", "/sfx/interface/sein/standard/oriSpeechShortH.ogg", "/sfx/interface/sein/standard/oriSpeechShortI.ogg", "/sfx/interface/sein/standard/oriSpeechShortJ.ogg"};
	
	SUPER_LONG = "/sfx/interface/sein/standard/oriSpeechLongC.ogg";
	LONG = {"/sfx/interface/sein/standard/oriSpeechLongA.ogg", "/sfx/interface/sein/standard/oriSpeechLongB.ogg"};
	MEDIUM = {"/sfx/interface/sein/standard/oriSpeechLongD.ogg", "/sfx/interface/sein/standard/oriSpeechMedA.ogg", "/sfx/interface/sein/standard/oriSpeechMedB.ogg", "/sfx/interface/sein/standard/oriSpeechMedC.ogg", "/sfx/interface/sein/standard/oriSpeechMedD.ogg", "/sfx/interface/sein/standard/oriSpeechMedE.ogg", "/sfx/interface/sein/standard/oriSpeechShortA.ogg"};
	SHORT = {"/sfx/interface/sein/standard/oriSpeechMedF.ogg", "/sfx/interface/sein/standard/oriSpeechMedG.ogg", "/sfx/interface/sein/standard/oriSpeechShortB.ogg", "/sfx/interface/sein/standard/oriSpeechShortC.ogg", "/sfx/interface/sein/standard/oriSpeechShortD.ogg", "/sfx/interface/sein/standard/oriSpeechShortE.ogg", "/sfx/interface/sein/standard/oriSpeechShortF.ogg", "/sfx/interface/sein/standard/oriSpeechShortG.ogg", "/sfx/interface/sein/standard/oriSpeechShortH.ogg", "/sfx/interface/sein/standard/oriSpeechShortI.ogg", "/sfx/interface/sein/standard/oriSpeechShortJ.ogg"};
}

function init()
	local Year, Month, Day = CurrentDate()
	self.isOrisBirthday = (Month == 3 and Day == 11)
	self.isXansBirthday = (Month == 7 and Day == 11)
	--self.postInitIsLate = true
	
	local oriYear = tostring(Year - 2015)
	local xanYear = tostring(Year - 1682)
	local realXanYear = tostring(Year - 2000)
	
	self.oriBirthdayMessage = LuaRadioMessage:NewMessage({
		-- I did use GetNumberWithEnding(oriYear) but due to rewording I can just use the number.
		text = "I thought I'd let you know that today marks ^#99BBFF;Nibel^reset;'s ^green;" .. tostring(oriYear) .. "^reset; year anniversary recognizing ^cyan;Ori^reset;'s legendary journey. I've sent a spiritual message on your behalf. You can thank me later.";
		
		unique = true;
		messageId = "oribirthday" .. oriYear;
		--chatterSound = SEIN_CHATTER_SOUNDS.MEDIUM[math.random(1, #SEIN_CHATTER_SOUNDS.MEDIUM)];
	})
	
	if Year == 2020 then
		self.oriBirthdayMessage.portraitImage = "yell.<frame>"
		self.oriBirthdayMessage.text = "What are you doing playing ^yellow;Starbound^reset;?! Don't you know ^cyan;Ori and the Will of the Wisps ^reset;released ^green;today^reset;? You should be out experiencing pure beauty, not playing this!"
	end
	
	self.xanBirthdayMessage = LuaRadioMessage:NewMessage({
		text = "Today is ^#FF3F00;Xan^reset;'s ^green;" .. GetNumberWithEnding(xanYear) .. " ^gray;(" .. GetNumberWithEnding(realXanYear) .. ")^reset; birthday. You probably don't know who he is, but he's responsible for proposing the annexation of ^#99BBFF;Nibel^reset; into ^yellow;The Protectorate.";
		persistTime = 10;
		unique = true;
		messageId = "xanbirthday" .. realXanYear;
		--chatterSound = SEIN_CHATTER_SOUNDS.MEDIUM[math.random(1, #SEIN_CHATTER_SOUNDS.MEDIUM)];
	})
	
	self.updateMessage = LuaRadioMessage:NewMessage({
		text = "^yellow;[NEW OPTIONAL UPDATE] ^reset;The mod has been updated and now leverages ^orange;XModConfig^reset;. ^cornflowerblue;This allows you to enable or disable certain features of this mod. ^reset;You can find it on the Steam Workshop by searching ^orange;XModConfig^reset;.";
		persistTime = 10;
		unique = true;
		messageId = "modUpdate-2162020";
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
	
	self.updateMessage:SendToEntityInWorld(entity, world)
	
	XModConfig = TryGetXModConfig()
	
	local cfg
	if XModConfig ~= nil then
		cfg = XModConfig:Instantiate("OriModRedux")
	else
		sb.logInfo("Config is null.")
	end
	
	local messagesEnabled = true --cfg:Get("eventMessagesEnabled", true)
	local useSeinSounds = false --cfg:Get("useSeinVoiceSounds", false)
	local debugAlwaysSendEvent = false --cfg:Get("debugAlwaysRunMessage", false)
	
	if cfg ~= nil and cfg.ReferenceType ~= 2 then
		messagesEnabled = cfg:Get("eventMessagesEnabled", true)
		useSeinSounds = cfg:Get("useSeinVoiceSounds", false)
		debugAlwaysSendEvent = cfg:Get("debugAlwaysRunMessage", false)
	end
	
	--sb.logInfo("messages? " .. tostring(messagesEnabled))
	--sb.logInfo("sein sounds? " .. tostring(useSeinSounds))
	--sb.logInfo("always run? " .. tostring(debugAlwaysSendEvent))
	
	local year = CurrentDate()
	
	if messagesEnabled == true then
		if (self.isOrisBirthday or debugAlwaysSendEvent) and self.oriBirthdayMessage then
			if debugAlwaysSendEvent then 
				self.oriBirthdayMessage.unique = false
				self.oriBirthdayMessage.messageId = tostring(math.random())
			end
			self.oriBirthdayMessage:SendToEntityInWorld(entity, world)
			if useSeinSounds then 
				if year == 2020 then
					XUtils:PlaySound("/sfx/interface/sein/urgent/oriSpeechUrgentShortD.ogg", entity.position())
					return
				end
				XUtils:PlaySound(SEIN_CHATTER_SOUNDS.MEDIUM, entity.position())
			end
		end
		
		-- this one doesn't count
		if self.isXansBirthday and self.xanBirthdayMessage then
			self.xanBirthdayMessage:SendToEntityInWorld(entity, world)
			if useSeinSounds then XUtils:PlaySound(SEIN_CHATTER_SOUNDS.MEDIUM, entity.position()) end
		end
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