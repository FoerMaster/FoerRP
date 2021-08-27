hook.Add( "OnPlayerChangedJob", "foerrp.StopChangeJob", function(ply, id)
    if !ply.coldown then
        ply.coldown = 0
    end

    if ply.coldown > CurTime() then
        ply:ChatPrint(Color(184,69,69),"Подождите, вы слишком быстро делаете это!")
        return false
    end

    ply.coldown = CurTime() + FoerRP.Settings.ChangeJobColdown
end)