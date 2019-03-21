require("/scripts/messageutil.lua")

local old = init;

function init()
	old()
	message.setHandler("startQuest", localHandler(player.startQuest)) --Append a message handler to player to expose startQuest
	message.setHandler("radioMessage", localHandler(player.radioMessage)) --Same to expose radioMessage
	message.setHandler("hasCompletedQuest", localHandler(player.hasCompletedQuest)) --Same to expose hasCompletedQuest
end