--[[
local var = nw.Register 'MyVar' 	-- You MUST call this ALL shared
	var:Write(net.WriteUInt, 32) 	-- Write function
	var:Read(net.ReadUInt, 32) 		-- Read function
	var:SetPlayer() 				-- Registers the var for use on players 
	var:SetLocalPlayer() 			-- Optionally set the var to only network to the player its set on, no need to call SetPlayer with this
	var:SetGlobal() 				-- Registers the var for use with nw.SetGlobal
	var:SetNoSync() 				-- Stops the var from syncing to new players, SetLocalPlayer does this for you.
	var:Filter(function(ent, value) -- Sets a var to only send to players you return in your callback
		return player.GetWhatever() -- return table players
	end)
nw.WaitForPlayer(player, callback) 	-- Calls your callback when the player is ready to recieve net messages

-- Set Functions
ENTITY:SetNetVar(var, value)
nw.SetGlobal(var, value)

-- Get functions
ENTITY:GetNetVar(var)
nw.GetGlobal(var)
]]

nw.Register 'Money'
    :Write(net.WriteUInt, 32)
    :Read(net.ReadUInt, 32)
    :SetLocalPlayer()

nw.Register 'Job'
    :Write(net.WriteString)
    :Read(net.ReadString)
    :SetPlayer()