local bounce = {}

function bounce.update(entity, dt)
    if not dir then
        dir = 1
    end

    if entity.z > 200 then
        entity.z = 200
        dir = -1
    elseif entity.z < 0 then
        entity.z = 0
        dir = 1
    end

    entity.z = entity.z + entity.speed * dt * dir
end

return bounce