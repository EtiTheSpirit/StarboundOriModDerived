-- Initialization Utility
-- Offers the ability to specify a postinit() function which runs after init has completed.
--[[
	API: (After requiring this script...)
	
	bool InitUtil.postInitIsLate = false
		Set this property via `self.postInitIsLate`
		
		If false (the default), postinit() will run before the first update() call.
		If true, postinit() will run after the first update() call.

  If you do not specify postinit, an error will be printed in the console to notify you.
  Unfortunately Starbound has removed debug.stacktrace(), so it is not possible to get a stack at this time.
--]]

require "/scripts/xcore/LoggingOverride.lua"

local OLD_INIT_FUNC = init
local OLD_UPDATE_FUNC = update

function init()
	if OLD_INIT_FUNC then
		OLD_INIT_FUNC()
	end
	
	if postinit == nil then
		error("Script has employed the use of initutil but does not specify a postinit() function!")
		return
	end
	
	self.postInitCompleted = false
end

function update(dt)
	local canRun = postinit ~= nil and self.postInitCompleted == false
	if canRun and not self.postInitIsLate then
		superpostinit()
	end
	
	if OLD_UPDATE_FUNC then
		OLD_UPDATE_FUNC(dt)
	end
	
	if canRun and self.postInitIsLate then
		superpostinit()
	end
end

function superpostinit()
	if not postinit then return end
	postinit()
	self.postInitCompleted = true
	postinit = nil -- Prevents duped calls. I don't know of any cases where this happens.
end