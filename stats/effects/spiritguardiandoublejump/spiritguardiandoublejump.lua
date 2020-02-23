function init()
	-- Flag both jumps as false.
	self.firstJump = false
	self.secondJump = false
end

function update(dt)
	if mcontroller.jumping() then
		if not self.firstJump then
			self.firstJump = true
			mcontroller.setYVelocity(60)
			sb.logInfo("firstJump")
		else
			if not self.secondJump and mcontroller.yVelocity() <= 0 then
				self.secondJump = true
				sb.logInfo("secondJump")
				animator.playSound("jumpSounds")
				mcontroller.setYVelocity(60)
			end
		end
	end
	-- On the ground? Reset it all.
	if mcontroller.onGround() then
		self.firstJump = false
		self.secondJump = false
	end
end