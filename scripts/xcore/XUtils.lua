-- (IN DEVELOPMENT)
-- XUtils is a bunch of random garbage that I probably won't ever use. It's here as a just-in-case.
--[[
	API:
	
		XUtils:IsAnyNil(object[] args...)
			Returns true if any of the specified arguments are nil. THIS WILL FAIL IF THE LAST ARGUMENT IN THE LIST IS NIL.
		
		XUtils:CanFindContextVars(string[] args...)
			Returns true if the specified variables exist in _ENV. This is mainly intended for context-specific commands where access to certain objects (e.g. entity) are required.
			All arguments MUST be strings (e.g. "entity" rather than entity)
			Will print an error message to starbound.log if one of the vars is missing, but will NOT stop the game or the script.
			
		XUtils:PlaySound(Variant<table, string> soundOrList, vec2 position = entity.position())
			Plays a sound or random selection from a list of sounds (depending on what you input to the function) at the specified position.
			If position is nil, it uses `entity.position()` -- If you don't have the entity value in your current context, it will not work.
			If position is specified, the requirement for entity is removed and you can run it so long as the context has `world`
--]]

require("/scripts/vec2.lua")
require("/scripts/util.lua")
require("/scripts/xcore/LoggingOverride.lua")

XUtils = {}

-- Returns true if any of the values specified as arguments are nil.
-- WARNING: FAILS IF THE LAST ARGUMENT IS NIL.
function XUtils:IsAnyNil(...)
	local Array = {...}
	for Index = 1, #Array do
		if Array[Index] == nil then
			return true
		end
	end
	return false
end

-- Similar to IsAnyNil but looks for environment vars specifically.
-- You ***MUST*** pass in string values (e.g. "entity" rather than entity)
-- Automatically prints an error message specifying which vars are missing.
function XUtils:CanFindContextVars(...)
	local Array = {...}
	if #Array == 1 and type(Array[1]) == "table" then
		-- Catch case for if a user inputs a table.
		Array = Array[1]
	end

	local MissingVars = {}
	for Index, Value in pairs(Array) do
		if not _ENV[Value] then
			table.insert(MissingVars, Value)
		end
	end
	
	if #MissingVars > 0 then
		error("Failed to call XUtils function due to incorrect environment state. [Missing required environment variables: " .. table.concat(MissingVars, ", ") .. "]")
		return false
	end
	return true
end

-- Plays a sound at the specified position.
-- If Position is nil, then the entity table will be required (resulting in an error if this context doesn't have it) to use entity.position()
function XUtils:PlaySound(soundOrList, position)
	local requiredVars = {"world"}
	if not position then
		table.insert(requiredVars, "entity")
	end
	
	if not XUtils:CanFindContextVars(requiredVars) then return end
	if type(soundOrList) == "string" then
		soundOrList = {soundOrList}
	end
	
	if not position then
		position = entity.position()
	end
	
	-- And now: The hackiest thing you will see in a while.
	world.spawnProjectile("invisibleprojectile", Position, nil, {0,0}, false, 
	{
		timeToLive = 0,
		actionOnReap = {
			{
				action = "actions",
				list = {
					{
						action = "sound",
						options = soundOrList
					}
				}
			}
		}
	})
end