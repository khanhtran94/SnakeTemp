--!strict
local House = {}

House.__index = House

type HouseData = {
	Color: Color3,
	Address: string,
	Owner: string?,

	SellHouse: (self: House, owner: string) -> (),
	PositionHouse: (self: House, position: Vector3) -> ()
}

export type House = setmetatable<HouseData, typeof(House)>

function House.new(color: Color3, address: string, owner: string?): House
	local self = setmetatable({}, House) :: House
	self.Color = color
	self.Address = address
	self.Owner = owner
	return self
end

function House.SellHouse(self: House, owner: string)
	self.Owner = owner
	print("House at " .. self.Address .. " sold to " .. owner)
end

function House.PositionHouse(self: House, position: Vector3) 
	local test = vector.create(0, 0, 1)
	
end

return House
