-- PlayerReplicator
-- Replicates ALL player functions and exposes them as a message handler.

require "/scripts/messageutil.lua"

local OLD_INIT_FUNC = init;

function init()
	if OLD_INIT_FUNC then
		OLD_INIT_FUNC()
	end
	
	for Index, Data in pairs(player) do
		if type(Data) == "function" then
			message.setHandler(Index, localHandler(Data))
		end
	end
end