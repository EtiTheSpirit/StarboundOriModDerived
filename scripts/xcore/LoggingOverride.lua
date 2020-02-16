-- LoggingOverride
-- Changes lua's stock print and error functions so that they use the sb log, and appends a warn() function for warnings.
--[[
	API:
	
		print(...)
			Behaves identically to Lua's stock print(), but redirects the output to sb.logInfo
			
		warn(...)
			Behaves identically to Lua's stock print(), but redirects the output to sb.logWarn
			
		error(...)
			Behaves identically to Lua's stock print(), but redirects the output to sb.logError
			NOTE: This REMOVES the trace level argument from error, since stack traces are not possible to grab in Starbound.
			
		assert(bool requirement, string errorMsg = "Assertion failed")
			Checks if the requirement is met (the value is true). If the value is false, it will print errorMsg via sb.logError.
			
		assertwarn(bool requirement, string errorMsg = "Assertion failed")
			Identical to assert but uses sb.logWarn instead of sb.logError
			
			
	EXTRA API:
		
		void MakeIntoContextualLogger(string prefix)
			
			This will override the existing modifications further to always include the specified prefix before all log entries.
			For instance:
				local print, warn, error, assertwarn, assert = MakeIntoContextualLogger("[Joe Mama]")
				-- NOTE: Setting ^ is very important! This function cannot do it out of the box since it causes loggers to get scrambled and simply use the latest call to MakeIntoContextualLogger
				print("asdfg")
				
			Will output:
				[Joe Mama] asdfg
--]]

require("/scripts/util.lua")

-- Converts an arbitrary number of args into a string like how print() does.
local function argsToString(...)
	local array = {...}
	local strArray = {}
	
	-- Make sure everything is a string. table.concat does NOT get along with non-string values.
	-- sb.print adds some extra flair and I believe it's a better fit than tostring
	for index = 1, #array do
		strArray[index] = sb.print(array[index])
	end
	return table.concat(strArray, " ")
end

--Run old init AFTER this. Very important
print = function (...)
	sb.logInfo(argsToString(...))
end
warn = function (...)
	sb.logWarn(argsToString(...))
end
error = function (...)
	sb.logError(argsToString(...))
end

assertwarn = function(requirement, msg) if not requirement then warn(msg or "Assertion failed") end end
assert = function(requirement, msg) if not requirement then error(msg or "Assertion failed") end end

function MakeIntoContextualLogger(prefix)
	local oldprint, oldwarn, olderror, oldassertwarn, oldassert = print, warn, error, assertwarn, assert
	local print = function (...)
		oldprint(prefix, ...)
	end
	
	local warn = function (...)
		oldwarn(prefix, ...)
	end
	
	local error = function (...)
		olderror(prefix, ...)
	end
	
	local assertwarn = function (requirement, msg)
		oldassertwarn(requirement, argsToString(prefix, msg or "Assertion failed"))
	end
	
	local assert = function (requirement, msg)
		oldassert(requirement, argsToString(prefix, msg or "Assertion failed"))
	end
	
	return print,warn,error,assertwarn,assert
end