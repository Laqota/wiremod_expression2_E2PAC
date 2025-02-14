E2Lib.RegisterExtension("PAC3_E2", true, "Allows players to execute PAC3 Events without then need of ConCMD.")
local sbox_E2_PacEventAdminOnly = CreateConVar( "wire_expression2_pac3_adminonly", "0", FCVAR_ARCHIVE )

local function canUse(self)
	local ply = self.player
	return sbox_E2_PacEventAdminOnly:GetInt()==0 or (sbox_E2_PacEventAdminOnly:GetInt()==1 and ply:IsAdmin())
end

local function firePAC3(self,command)
	if not canUse(self) then return end
	self.player:ConCommand("pac_event "..command)
end

e2function void firePAC3(string command)
	firePAC3(self,command)
end