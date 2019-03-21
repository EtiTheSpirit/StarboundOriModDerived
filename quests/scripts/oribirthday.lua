require "/scripts/util.lua"
require "/scripts/vec2.lua"
require "/quests/scripts/portraits.lua"
require "/quests/scripts/questutil.lua"

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

function CurrentDate()
	--Credits to https://scriptinghelpers.org/questions/25121/how-do-you-get-the-date-and-time-from-unix-epoch-time
	local z = os.time()
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

function init()
	setPortraits()

	self.descriptions = config.getParameter("descriptions")
	storage.complete = storage.complete or false
	storage.stage = storage.stage or 1
	self.stages = {remindOri}
	
	self.techstationUid = config.getParameter("techstationUid")
	self.compassUpdate = config.getParameter("compassUpdate", 0.5)
    self.descriptions = config.getParameter("descriptions")

	self.state = FSM:new()
	self.state:set(self.stages[storage.stage])
	
	self.didInteract = false
	
	--^cyan;Happy Birthday, Ori!^reset;
end

function questInteract(entityId)
	if world.entityUniqueId(entityId) == self.techstationUid then
		self.didInteract = true
		return true
	end
end

function questStart()
end

function update(dt)
	self.state:update(dt)
end

function questComplete()
	setPortraits()
	questutil.questCompleteActions()
end

function remindOri()
	quest.setIndicators({})
	quest.setCompassDirection(nil)
	
	local findTechStation = util.uniqueEntityTracker(self.techstationUid, self.compassUpdate)
	quest.setObjectiveList({
		{self.descriptions.talkToSail, false}
	})
	while true do
		questutil.pointCompassAt(findTechStation())
		if self.didInteract then
			quest.setCanTurnIn(true)
			quest.complete()
		end
		coroutine.yield()
	end
end
