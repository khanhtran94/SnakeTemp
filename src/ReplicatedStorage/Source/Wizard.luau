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
	local self = Character.new(name, startingHealth) :: any
	self.Mana = startingMana

	setmetatable(self, Wizard)

	return self
end

function Wizard.CastSpell(self: Wizard, spellName: string)
	if self.Mana > 0 then
		print(self.Name .. " casts " .. spellName .. "!")
		self.Mana -= 10 -- Giảm mana khi sử dụng phép thuật
	else
		print(self.Name .. " does not have enough mana to cast " .. spellName .. ".")
	end
end

return Wizard
