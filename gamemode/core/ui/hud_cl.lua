FoerRP.HUD = FoerRP.HUD or {query = {}}

function FoerRP.HUD:AddDraw(name,_func)
    FoerRP.HUD.query[name] = _func
end

local hide = {
	["CHudHealth"] = true,
	["CHudBattery"] = true
}

local hide = {
	["CHudHealth"] = true,
	["CHudBattery"] = true
}

hook.Add( "HUDShouldDraw", "foer.HideHud", function( name )
	if ( hide[ name ] ) then
		return false
	end

	-- Don't return anything here, it may break other addons that rely on this hook.
end )

function GM:HUDPaint()
    for _,_draw in pairs(FoerRP.HUD.query) do
        if _draw then _draw() end
    end
end

local buffer = {
    colors = {
        black = Color(0,0,0),
        white = Color(255,255,255)
    },
    materials = {
        money = Material("icon16/money.png"),
        heart = Material("icon16/heart.png"),
        shield = Material("icon16/shield.png"),
        user = Material("icon16/user.png"),
    }
}

FoerRP.HUD:AddDraw("MainHUD",function()

    local LP = LocalPlayer()
    local spacing = 0
    
    -- MONEY
    surface.SetAlphaMultiplier(0.9)
    draw.RoundedBox(4,3,3,150,25,buffer.colors.black)
    surface.SetAlphaMultiplier(1)

    surface.SetAlphaMultiplier(0.5)
    draw.RoundedBox(4,3,3,25,25,buffer.colors.black)
    surface.SetAlphaMultiplier(1)

    surface.SetMaterial(buffer.materials.money)
    surface.SetDrawColor(255,255,255,255)
    surface.DrawTexturedRectRotated(15,15,16,16,0)

    draw.SimpleText(LP:Money() .. "$ + "..LP:JobObject():Salary().."$","frp.20",35,15,buffer.colors.white,0,1)

    spacing = spacing + 30
    
    -- HEALTH
    surface.SetAlphaMultiplier(0.9)
    draw.RoundedBox(4,3,3+spacing,150,25,buffer.colors.black)
    surface.SetAlphaMultiplier(1)

    surface.SetAlphaMultiplier(0.5)
    draw.RoundedBox(4,3,3+spacing,25,25,buffer.colors.black)
    surface.SetAlphaMultiplier(1)

    surface.SetMaterial(buffer.materials.heart)
    surface.SetDrawColor(255,255,255,255)
    surface.DrawTexturedRectRotated(15,15+spacing,16,16,0)

    draw.SimpleText(LP:Health(),"frp.20",35,15+spacing,buffer.colors.white,0,1)

    spacing = spacing + 30

    -- ARMOR
    local armor = LP:Armor()
    if armor > 0 then
        surface.SetAlphaMultiplier(0.9)
        draw.RoundedBox(4,3,3+spacing,150,25,buffer.colors.black)
        surface.SetAlphaMultiplier(1)

        surface.SetAlphaMultiplier(0.5)
        draw.RoundedBox(4,3,3+spacing,25,25,buffer.colors.black)
        surface.SetAlphaMultiplier(1)

        surface.SetMaterial(buffer.materials.shield)
        surface.SetDrawColor(255,255,255,255)
        surface.DrawTexturedRectRotated(15,15+spacing,16,16,0)

        draw.SimpleText(armor,"frp.20",35,15+spacing,buffer.colors.white,0,1)

        spacing = spacing + 30
    end

    -- ARMOR
    surface.SetAlphaMultiplier(0.9)
    draw.RoundedBox(4,3,3+spacing,150,25,buffer.colors.black)
    surface.SetAlphaMultiplier(1)

    surface.SetAlphaMultiplier(0.5)
    draw.RoundedBox(4,3,3+spacing,25,25,buffer.colors.black)
    surface.SetAlphaMultiplier(1)

    surface.SetMaterial(buffer.materials.user)
    surface.SetDrawColor(255,255,255,255)
    surface.DrawTexturedRectRotated(15,15+spacing,16,16,0)

    draw.SimpleText(LP:JobName(),"frp.20",35,15+spacing,buffer.colors.white,0,1)

    spacing = spacing + 30
end)

FoerRP.HUD:AddDraw("PlayersTag",function()
    local LP = LocalPlayer()
    local ent = LP:GetEyeTrace().Entity

    if !ent or !IsValid(ent) or !ent:IsPlayer() then return end

    draw.SimpleText(ent:Name(),"frp.25",ScrW()/2,ScrH()/2-10,ent:JobColor(),1,1)
    draw.SimpleText(ent:JobName(),"frp.25",ScrW()/2,ScrH()/2+10,ent:JobColor(),1,1)
end)