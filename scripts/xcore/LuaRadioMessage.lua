-- LuaRadioMessage
-- Offers the ability to create messages and send them later. Usage example:
--[[
	self.direMessage = LuaRadioMessage:NewMessage({
		text = "Oh no!"
	})
	
	--For whatever reason you may forget to specify a parameter above, or you need to change a parameter...
	self.direMessage.important = true --You can edit it after creation.
	
	--To send it...
	self.direMessage:SendToEntityInWorld(entity, world)
--]]
require "/scripts/xcore/LoggingOverride.lua"

LuaRadioMessage = {}

local function ValueOrDefault(Value, Default)
	if Value ~= nil then
		return Value
	end
	return Default
end

function LuaRadioMessage:NewMessage(messageData)
	local messageData = messageData or {}
	setmetatable(messageData, {__index = self})
	
	self.unique = ValueOrDefault(messageData.unique, true)
	self.important = ValueOrDefault(messageData.important, false)
	self.type = ValueOrDefault(messageData.type, "generic")
	self.text = ValueOrDefault(messageData.text, "")
	self.senderName = ValueOrDefault(messageData.senderName, "SAIL")
	self.portraitImage = ValueOrDefault(messageData.portraitImage, "talk.<frame>")
	self.portraitFrames = ValueOrDefault(messageData.portraitFrame, 2)
	self.portraitSpeed = ValueOrDefault(messageData.portraitSpeed, 0.25)
	self.textSpeed = ValueOrDefault(messageData.textSpeed, 40)
	self.persistTime = ValueOrDefault(messageData.persistTime, 6)
	self.chatterSound = ValueOrDefault(messageData.chatterSound, "/sfx/interface/aichatter1_loop.ogg")
	self.messageId = ValueOrDefault(messageData.messageId, tostring(math.random()))
	
	return messageData
end

function LuaRadioMessage:SendToEntityInWorld(entity, world)
	local RadioMessage = {
		unique = self.unique;
		important = self.important;
		type = self.type;
		text = self.text;
		senderName = self.senderName;
		portraitImage = self.portraitImage;
		portraitFrames = self.portraitFrames;
		portraitSpeed = self.portraitSpeed;
		textSpeed = self.textSpeed;
		persistTime = self.persistTime;
		chatterSound = self.chatterSound;
		messageId = self.messageId;
	}
	print("Sending radio message")
	world.sendEntityMessage(entity.uniqueId(), "radioMessage", RadioMessage) --This works because of the deployment script.
end