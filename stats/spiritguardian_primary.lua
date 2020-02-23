require("/scripts/status.lua")
require("/scripts/util.lua")
require("/scripts/interp.lua")
local oldUpdate = update

--The original script for the tweak to mouthposition was created by the user Alceris.

function update(dt)
    if world.entitySpecies(entity.id()) == "spiritguardian" then
        status.setStatusProperty("mouthPosition", {0.0, 0.55})
        status.addPersistentEffects("spiritGuardianPersistentEffects", {"spiritguardiannofalldamage", "spiritguardiancore"}); --, "spiritguardiandoublejump"
    end
    oldUpdate(dt)
end
