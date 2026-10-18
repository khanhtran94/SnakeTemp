--!strict
const House = require("./House")
const Wizard = require("./Wizard")

local OOP = {}

function OOP.Start()
	print("OOP system started")
	local myWizard = Wizard.new("Gandalf", 100, 50)
	myWizard:TakeDamage(20)
	myWizard:CastSpell("Fireball")
end
return OOP
