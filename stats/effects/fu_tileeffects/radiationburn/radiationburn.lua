function init()
  animator.setParticleEmitterOffsetRegion("flames", mcontroller.boundBox())
  animator.setParticleEmitterActive("flames", true)
  effect.setParentDirectives("fade=00FF33=0.15")
  script.setUpdateDelta(5)
  self.tickDamagePercentage = 0.012
  self.tickTime = 1.0
  self.tickTimer = self.tickTime
end



function update(dt)
	if (status.stat("radioactiveResistance",0)  >= 0.4) then
	  effect.expire()
	else
	
  self.tickTimer = self.tickTimer - dt
  if self.tickTimer <= 0 then
    self.tickTimer = self.tickTime
    status.applySelfDamageRequest({
        damageType = "IgnoresDef",
        damage = math.floor(status.resourceMax("health") * self.tickDamagePercentage) + 1,
        damageSourceKind = "radioactive",
        sourceEntityId = entity.id()
      })
  end
end

function uninit()

end
