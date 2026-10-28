--!strict

local Coin = {}
Coin.__index = Coin

type CoinData = {
	-- Thêm các trường dữ liệu của lớp tại đây
	value: number,
	owner: string?,
	id: string,

	IncrementValue: (self: Coin, amount: number) -> (),
}

export type Coin = setmetatable<CoinData, typeof(Coin)>
function Coin.new(value: number, owner: string?, id: string): Coin
	local self = setmetatable({}, Coin) :: Coin
	-- self = setmetatable({}, Coin) :: Coin
	self.value = value
	self.owner = owner
	self.id = id
	return self
end

function Coin.IncrementValue(self: Coin, amount: number)
	self.value += amount
	print("Coin value incremented by " .. amount .. ". New value: " .. self.value)
end

return Coin
