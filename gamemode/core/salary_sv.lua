function PLAYER:UpdateSalaryTimer()
    self._TimerSalaryName = "salary_"..self:SteamID()
    local pl = self
    timer.Create(pl._TimerSalaryName,FoerRP.Settings.SalaryTime,0,function()
        
        local job = pl:JobObject()
        if !job then timer.Remove(pl._TimerSalaryName) return end

        local can = hook.Call( "OnPlayerSalary", GAMEMODE, pl, job:ID())
        if !can then return end

        pl:AddMoney(job:Salary())

        pl:ChatPrint("Вы получили зарплату в размере ",Color(0,255,0),job:Salary().."$")
        
    end)
end

hook.Add("PlayerChangedJob","foerrp.SalaryPrepare",function(ply)
    ply:UpdateSalaryTimer()
end)