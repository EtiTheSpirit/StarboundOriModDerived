-- (IN DEVELOPMENT)
-- XUtils is a bunch of random garbage that I probably won't ever use. It's here as a just-in-case.
--[[
	API:
	
		XUtils:IsAnyNil(object args...)
			Returns true if any of the specified arguments are nil.
			THIS WILL FAIL IF THE LAST ELEMENT IS NIL.
			
			You can resolve this by putting a dummy value at the end of your args, like the global var XNULL created by this script
			For instance:
			XUtils:IsAnyNil(a, b, c)
				If c is nil, this will return false (aka "nothing is nil") due to how tables work in lua.
				HOWEVER:
			XUtils:IsAnyNil(a, b, c, XNULL)
				If c is nil, this will return true because, as a result of the placeholder XNULL at the end, the table now has a hole in it where c would go.
				
			Unfortunately, there is no way to avoid this or automatically implement it. You must do this yourself.
		
		XUtils:CanFindContextVars(string[] args..., boolean removeAutomaticError = false)
			Returns true if the specified variables exist in _ENV. This is mainly intended for context-specific commands where access to certain objects (e.g. entity) are required.
			All arguments MUST be strings (e.g. "entity" rather than entity), with the exception of the last argument which can be a boolean value.
			If the last argument is NOT true, this will print an error message to starbound.log if one of the vars is missing. It will not stop the game.
			If you wish to print your own error message, pass in `true` as the last argument.
			
		XUtils:PlaySound(Variant<table, string> soundOrList, vec2 position = entity.position())
			Plays a sound or random selection from a list of sounds (depending on what you input to the function) at the specified position.
			If position is nil, it uses `entity.position()` -- If you don't have the entity value in your current context, it will not work.
			If position is specified, the requirement for entity is removed and you can run it so long as the context has `world`
--]]

require("/scripts/vec2.lua")
require("/scripts/util.lua")
require("/scripts/xcore/LoggingOverride.lua")

XUtils = {}
XNULL = "\0" --A placeholder value to represent a null object. Used in XUtils::IsAnyNil by the user calling the function as a just-in-case for if the last object they specify might be nil.

-- Returns true if any of the values specified as arguments are nil.
-- WARNING: FAILS IF THE LAST ARGUMENT IS NIL.
function XUtils:IsAnyNil(...)
	local Array = {...}
	if #Array == 1 and type(Array[1]) == "table" then
		-- Catch case for if a user inputs a table.
		Array = Array[1]
	end
	
	for Index = 1, #Array do
		if Array[Index] == nil then
			return true
		end
	end
	return false
end

-- Similar to IsAnyNil but looks for environment vars specifically.
-- You ***MUST*** pass in string values (e.g. "entity" rather than entity)
-- Automatically prints an error message specifying which vars are missing, unless the last argument is true.
function XUtils:CanFindContextVars(...)
	local Array = {...}
	if #Array == 1 and type(Array[1]) == "table" then
		-- Catch case for if a user inputs a table.
		Array = Array[1]
	end

	local MissingVars = {}
	for Index, Value in ipairs(Array) do
		if Index == #Array and Value == true then
			break -- Last index, and it's `true` which means when the user wants to disable error printing. Don't factor this in to the missing vars.
		end
		if not _ENV[Value] then
			table.insert(MissingVars, Value)
		end
	end
	
	if #MissingVars > 0 and Array[#Array] ~= true then
		error("[XUtils :: CanFindContextVars] This script has an invalid environment! [Missing environment variables: " .. table.concat(MissingVars, ", ") .. "]")
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
	world.spawnProjectile("invisibleprojectile", position, nil, {0,0}, false, 
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