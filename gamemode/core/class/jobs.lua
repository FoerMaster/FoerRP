FoerRP.Jobs = {}
local JOB = {}
JOB.__index = JOB

function FoerRP.AddJob(id,name)
    local _JOB = {
        id = id,
        name = name or "NULL",
        salary = 0,
        weapons = {},
        color = Color(255,255,255),
        models = {},
        spawns = {Vector(0,0,0)},
        max_count = 0,
        onspawn = function(ply) end,
        onbecome = function(ply) end,
        ondie = function(ply) end,
        c_check = function(ply) return true end,
    }

    if SERVER then
        FoerRP:AddCommand(id,function(ply)
            local job = FoerRP.GetJob(id)
            if !job then return end

            local numplayers = FoerRP.GetNumPlayersOnJob(id)

            if ply:Job() == id then
                ply:ChatPrint(Color(255,0,0),"Вы уже "..job:Name())
                return
            end

            if job:MaxCount() == 0 or numplayers < job:MaxCount() then
                ply:BecomeJob(id)
            else
                ply:ChatPrint(Color(255,0,0),"Мест на устройство нет!")
                return
            end


        end)
    end

    FoerRP.Jobs[id] = _JOB

    FoerRP:P("Registred new job "..name.."("..id..")")
    
    setmetatable(_JOB, JOB)

    return _JOB
end

function FoerRP.GetJob(id)
    return FoerRP.Jobs[id]
end

function FoerRP.GetNumPlayersOnJob(id)
    local num = 0
    for k,v in pairs(player.GetAll()) do
        if v:Job() == id then
            num = num + 1
        end
    end
end

-- GET FUNCTIONS
function JOB:ID()
    return self.id
end

function JOB:Name()
    return self.name
end

function JOB:Salary()
    return self.salary
end

function JOB:Color()
    return self.color
end

function JOB:Models()
    return self.models
end

function JOB:Spawns()
    return self.spawns
end

function JOB:Weapons()
    return self.weapons
end

function JOB:MaxCount()
    return self.max_count
end

function JOB:OnSpawn(ply)
    return self.onspawn(ply)
end

function JOB:OnBecome(ply)
    return self.onbecome(ply)
end

function JOB:OnDie(ply)
    return self.ondie(ply)
end

function JOB:CustomCheck(ply)
    self.c_check(ply)
end

-- SET FUNCTIONS
function JOB:SetName(str)
    self.name = str
    return self
end

function JOB:SetColor(col)
    self.color = col
    return self
end

function JOB:SetSalary(val)
    self.salary = val
    return self
end

function JOB:SetModels(models)
    self.models = models
    return self
end

function JOB:SetWeapons(weps)
    self.weapons = weps
    return self
end

function JOB:SetSpawns(spawns)
    self.spawns = spawns
    return self
end

function JOB:SetMaxCount(mc)
    self.max_count = mc
    return self
end

function JOB:SetOnSpawn(func)
    self.onspawn = func
    return self
end

function JOB:SetOnBecome(func)
    self.onbecome = func
    return self
end

function JOB:OnDie(func)
    self.ondie = func
    return self
end

function JOB:CustomCheck(func)
    self.c_check = func
    return self
end