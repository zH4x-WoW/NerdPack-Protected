local _, glb               = ...
local NeP                       = NeP
local CastSpellByName           = CastSpellByName
local GetCVar                   = GetCVar
local SetCVar                   = SetCVar
local CameraOrSelectOrMoveStart = CameraOrSelectOrMoveStart
local CameraOrSelectOrMoveStop  = CameraOrSelectOrMoveStop
local RunMacroText              = RunMacroText
local UseItemByName             = UseItemByName
local UseInventoryItem          = UseInventoryItem

-- Generic
glb.Generic = {}

local validGround = {
	["player"] = true,
	["cursor"] = true
}

function glb.Generic.Cast(spell, target)
	CastSpellByName(spell, target)
	return true
end

function glb.Generic.CastGround(spell, target)
	if not validGround[target] then
		target = "cursor"
	end
	glb.Generic.Macro("/cast [@"..target.."]"..spell)
	return true
end

function glb.Generic.Macro(text)
	RunMacroText(text)
	return true
end

function glb.Generic.UseItem(name, target)
	UseItemByName(name, target)
	return true
end

function glb.Generic.UseInvItem(name)
	UseInventoryItem(name)
	return true
end

NeP:AddUnlocker('Generic', function()
	pcall(RunMacroText, '/run NeP.Unlocked = true')
	return NeP.Unlocked
end, glb.Generic)