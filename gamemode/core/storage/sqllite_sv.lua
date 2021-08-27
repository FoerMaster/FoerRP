FoerRP.Data = {}

function FoerRP.Data:MakeTable()
    sql.Query( "CREATE TABLE IF NOT EXISTS player_data ( SteamID TEXT, Money INTEGER )" )
end

FoerRP.Data:MakeTable()

function PLAYER:LoadData()
    local money = sql.QueryValue( "SELECT Money FROM player_data WHERE SteamID = " .. sql.SQLStr( self:SteamID() ) .. ";" )
    
    self:SetMoney(money)
end

function PLAYER:SaveData()
    local steamid = sql.SQLStr( self:SteamID() )
    local money = self:Money()
    local data = sql.Query( "SELECT * FROM player_data WHERE SteamID = " .. steamid .. ";")
 	if ( data ) then
 		sql.Query( "UPDATE player_data SET Money = " .. money .. " WHERE SteamID = " .. steamid .. ";" )
 	else
 		sql.Query( "INSERT INTO player_data ( SteamID, Money ) VALUES( " .. steamid .. ", " .. money .. " )" )
    end
end

-- function SavePlayerToDataBase( ply, Money )
-- 	local data = sql.Query( "SELECT * FROM player_data WHERE SteamID = " .. sql.SQLStr( ply:SteamID() ) .. ";")
-- 	if ( data ) then
-- 		sql.Query( "UPDATE player_data SET Money = " .. Money .. " WHERE SteamID = " .. sql.SQLStr( ply:SteamID() ) .. ";" )
-- 	else
-- 		sql.Query( "INSERT INTO player_data ( SteamID, Money ) VALUES( " .. sql.SQLStr( ply:SteamID() ) .. ", " .. Money .. " )" )
-- 	end
-- end

-- function LoadPlayerToDataBase( ply )
-- 	local val = sql.QueryValue( "SELECT Money FROM player_data WHERE SteamID = " .. sql.SQLStr( ply:SteamID() ) .. ";" )
-- 	return val
-- end