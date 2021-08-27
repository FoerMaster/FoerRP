if CLIENT then
    local c_tag = Color(47,64,218)

    function FoerRP:ChatPrint(...)
        chat.AddText(c_tag,"[FoerRP] ",color_white,unpack({...}))
    end

    netstream.Hook("foerrp.ChatPrint",function(...)
        FoerRP:ChatPrint(...)
    end)

    netstream.Hook("foerrp.ChatPrintCustom",function(...)
        chat.AddText(unpack({...}))
    end)

else
    function PLAYER:ChatPrint(...)
        netstream.Start(self,"foerrp.ChatPrint",...)
    end

    function PLAYER:ChatPrintCustom(...)
        netstream.Start(self,"foerrp.ChatPrintCustom",...)
    end
end