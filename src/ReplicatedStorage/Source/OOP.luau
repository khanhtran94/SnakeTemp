--!strict
const House = require("./House")

local OOP = {}

function OOP.Start()
	print("OOP system started")
	local house1 = House.new(Color3.fromRGB(255, 0, 0), "123 Main St", nil)
	local house2 = House.new(Color3.fromRGB(0, 255, 0), "456 Elm St", nil)

	house1:SellHouse("Join")
end
return OOP
