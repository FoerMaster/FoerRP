function PLAYER:Money()
    return self:GetNetVar('Money') or 0
end

function PLAYER:SetMoney(value)
    value = tonumber(value) or 0
    self:SetNetVar('Money',value)

    hook.Call( "PlayerChangedMoney", GAMEMODE, self, value)
end

function PLAYER:AddMoney(count)
    count = tonumber(count) or 0
    self:SetMoney(self:Money() + count)
end

function PLAYER:Job()
    return self:GetNetVar('Job') or 0
end

function PLAYER:JobObject()
    return FoerRP.GetJob(self:GetNetVar('Job') or 0)
end

function PLAYER:JobName()
    local job = FoerRP.GetJob(self:GetNetVar('Job') or 0)

    if job then
        return job:Name()
    end

    return "NULL"
end

function PLAYER:BecomeJob(id)
    local job = FoerRP.GetJob(id)

    if !job then return end

    local changed = hook.Call( "OnPlayerChangedJob", GAMEMODE, self, id)
    if !changed then return end
    self:SetNetVar('Job',id)

    self:Spawn()
    self:SetModel(table.Random(job:Models()))
    self:SetPos(table.Random(job:Spawns()))
    job:OnBecome(self)

    self:ChatPrint("Вы стали ",job:Color(),job:Name())

    hook.Call( "PlayerChangedJob", GAMEMODE, self, id)
end

function PLAYER:SetJob(id)
    local job = FoerRP.GetJob(id)

    if !job then return end

    self:SetNetVar('Job',id)

    self:Spawn()
    self:SetModel(table.Random(job:Models()))
    self:SetPos(table.Random(job:Spawns()))
    job:OnBecome(self)

    hook.Call( "PlayerChangedJob", GAMEMODE, self, id)
end

function PLAYER:JobColor()
    local job = FoerRP.GetJob(self:Job())

    if !job then return color_white end
    return job:Color()
end