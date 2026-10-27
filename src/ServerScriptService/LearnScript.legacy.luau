local playerHealth = 75

local hasShield = true
local isVip = false


if playerHealth < 0 then
	print("player die")
elseif (playerHealth > 50 and hasShield) or isVip then
	print("player an toan")
else
	print("Player need receive")
	
end

for i =19, 1, -1 do
	print(" i = " .. i)
end

print("---")

local allPart = workspace:GetChildren()

for i, obj in pairs(allPart) do
	if obj:IsA("Part") then
		print("tim thay part: " .. obj.Name)
	end
end