--!strict

local Character = {}
Character.__index = Character

type CharacterData = {
	-- Thêm các trường dữ liệu của lớp tại đây
	Name: string,
	Health: number,
	TakeDamage: (self: Character, amount: number) -> (),
}

export type Character = setmetatable<CharacterData, typeof(Character)>

function Character.new(name: string, startingHealth: number): Character
	local self = setmetatable({}, Character)
	self = setmetatable({}, Character) :: Character

	self.Name = name
	self.Health = startingHealth
	return self
end

function Character.TakeDamage(self: Character, amount: number)
	self.Health -= amount
	print(self.Name .. " took " .. amount .. " damage. Remaining health: " .. self.Health)
end

return Character
