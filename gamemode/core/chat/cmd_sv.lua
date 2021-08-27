FoerRP.Commands = {}

function FoerRP:AddCommand(command,callback)

    FoerRP.Commands["/"..command] = callback

end

netstream.Hook("foerrp.CheckCommand",function(ply,command,args,fullstr)
    if !ply or !IsValid(ply) or !ply:Alive() or !isstring(command) then return end
    
    local command = FoerRP.Commands[command]

    if string.StartWith(fullstr, "///") then
        local explode = string.TrimLeft( fullstr, "///" )
        explode = string.Trim( explode )
        for k,v in pairs(player.GetAll()) do
            v:ChatPrintCustom(Color(180,180,180),"[OOC] "..ply:Name()..": ", Color(243,243,243),explode)
        end
        return
    end
    
    if command then
        command(ply,args,fullstr)
    else
        ply:ChatPrint(Color(255,0,0),"Команда не найдена!")
    end
end)