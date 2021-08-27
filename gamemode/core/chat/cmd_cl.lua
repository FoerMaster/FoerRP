hook.Add( "OnPlayerChat", "foerrp.ChatCommands", function( ply, strText, bTeam, bDead ) 
    if ( ply != LocalPlayer() ) then return end

	strText = string.lower( strText )

    if bDead then FoerRP:ChatPrint(Color(204,55,55),"Вы должны быть живым для выполнения этого действия!") return true end

    if !string.StartWith(strText, "/") then chat.AddText(ply:JobObject():Color(),ply:Name(),Color(255,255,255),": "..strText) return true end
    local args = string.Explode( " ", strText )
    local command = args[1]

    netstream.Start("foerrp.CheckCommand",command,args,strText)

	return true
end )