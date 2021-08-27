GM.Name = "FoerRP"
GM.Author = "Foer"

FoerRP = FoerRP or {}

-- GET TABLES
PLAYER = FindMetaTable("Player")
ENTITY = FindMetaTable("Entity")

-- PREPARE
function FoerRP:P(text)
    MsgC(Color(0,255,0),"[FoerRP] "..text.."\n")
end

function FoerRP:Include(path)
	if string.find(path, '_sv.lua') then
        if SERVER then include(path) end
    elseif string.find(path, '_cl.lua') then
        if SERVER then AddCSLuaFile(path) end if CLIENT then include(path) end
    else
        if SERVER then AddCSLuaFile(path) end include(path)
    end
end

function FoerRP:IncludeModules()
    local files,_ = file.Find( "foerrp/gamemode/modules/*", "LUA" )
    for _,f in pairs(files) do
        FoerRP:P("Included module: "..f)
        FoerRP:Include('modules/' .. f)
    end
end

function FoerRP:IncludeUtils()
    local files,_ = file.Find( "foerrp/gamemode/utils/*", "LUA" )
    for _,f in pairs(files) do
        FoerRP:P("Included util: "..'utils/' .. f)
        FoerRP:Include('utils/' .. f)
    end
end

-- INCLUDE
FoerRP:P("===== Loading modules =====")
FoerRP:IncludeModules()

FoerRP:P("===== Loading utils =====")
FoerRP:IncludeUtils()
FoerRP:P("===== INCLUDE END =====")

-- STORAGE
FoerRP:Include("core/storage/sqllite_sv.lua")


-- CHAT
FoerRP:Include("core/chat/core.lua")
FoerRP:Include("core/chat/cmd_sv.lua")
FoerRP:Include("core/chat/cmd_cl.lua")

-- CORE
FoerRP:Include("core/vars.lua")
FoerRP:Include("core/hooks_sv.lua")
FoerRP:Include("core/salary_sv.lua")

-- CLASS
FoerRP:Include("core/class/jobs.lua")
FoerRP:Include("core/class/player.lua")

-- UI
FoerRP:Include("core/ui/fonts_cl.lua")
FoerRP:Include("core/ui/hud_cl.lua")

-- SETTINGS
FoerRP:Include("settings/globals.lua")
FoerRP:Include("settings/jobs.lua")

-- END
hook.Run("foerrp.Loaded")
FoerRP:P("Gamemode loaded!")