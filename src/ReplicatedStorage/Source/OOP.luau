--!strict
const Coin = require("./Coin")
const House = require("./House")
const Point = require("./other")
const Wizard = require("./Wizard")

local OOP = {}
const TEST = 19
print("TEST value: " .. TEST)

-- Test = 20 -- This line will cause an error because TEST is a constant and cannot be reassigned.
function OOP.Start()
	-- print("OOP system started")
	-- local myWizard = Wizard.new("Gandalf", 100, 50)
	-- myWizard:TakeDamage(20)
	-- myWizard:CastSpell("Fireball")

	-- local a = { x = 10, y = 20 } :: Point.Point
	-- local b = { x = 30, y = 40 } :: Point.Point
	-- print("Point coordinates: (" .. a.x .. ", " .. a.y .. ")")
	-- print("Point coordinates: (" .. b.x .. ", " .. b.y .. ")")
	local myCoin = Coin.new(100, "Player1", "coin_001")
	print("Initial coin value: " .. myCoin.value)
	myCoin:IncrementValue(50)
	print("Updated coin value: " .. myCoin.value)
end
return OOP
