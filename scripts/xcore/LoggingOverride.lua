-- LoggingOverride
-- Changes lua's stock print and error functions so that they use the sb log, and appends a warn() function for warnings.
--[[
	API:
	
		print(...)
			Calls sb.logInfo with the specified args.
			
		warn(...)
			Calls sb.logWarn with the specified args.
			
		error(...)
			Calls sb.logError with the specified args.
			
		assert(bool requirement, string errorMsg = "Assertion failed")
			Checks if the requirement is met (the value is true). If the value is false, it will print errorMsg via sb.logError.
			
		assertwarn(bool requirement, string errorMsg = "Assertion failed")
			Identical to assert but uses sb.logWarn instead of sb.logError
--]]

require "/scripts/util.lua"
local OLD_INIT_FUNC = init

function init()
	--Run old init AFTER this. Very important
	print = sb.logInfo
	warn = sb.logWarn
	error = sb.logError

	assertwarn = function(requirement, errorMsg) if not requirement then warn(errorMsg or "Assertion failed") end end
	assert = function(requirement, errorMsg) if not requirement then error(errorMsg or "Assertion failed") end end
	
	OLD_INIT_FUNC()
end