--!strict

const Character = require("./Character")

type Character = Character.Character

local Wizard = {}
Wizard.__index = Wizard
setmetatable(Wizard, Character)

export type Wizard = Character & {
	-- Thêm các trường dữ liệu của lớp Wizard tại đây
	Mana: number,
	CastSpell: (self: Wizard, spellName: string) -> (),
}

function Wizard.new(name: string, startingHealth: number, startingMana: number): Wizard
	local self = Character.new(name, startingHealth) :: Wizard

	self.Mana = startingMana
	return self
end

return Wizard
