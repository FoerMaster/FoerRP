function GM:PlayerInitialSpawn(ply)
    ply:SetMoney(FoerRP.Settings.StartMoney)
    ply:SetJob(FoerRP.Settings.DefaultJob)

    ply:LoadData()
end

function GM:PlayerDisconnected(ply)
    ply:SaveData()
end

function GM:PlayerSpawn(ply)
    local job = FoerRP.GetJob(ply:Job())

    if !job then ply:Kick("Ошибка игрового режима, перезайдите на сервер!") return end
    ply:SetModel(table.Random(job:Models()))
    ply:SetPos(table.Random(job:Spawns()))
    job:OnSpawn(ply)

    for _,class in pairs(job:Weapons()) do
        print(class)
        ply:Give(class)
    end
end

function GM:PlayerDeath(ply)
    local job = FoerRP.GetJob(ply:Job())

    if !job then ply:Kick("Ошибка игрового режима, перезайдите на сервер!") return end
    job:OnDie(ply)
end


function GM:OnPlayerChangedJob(ply,job)
    return true
end

function GM:OnPlayerSalary(ply,job)
    return true
end