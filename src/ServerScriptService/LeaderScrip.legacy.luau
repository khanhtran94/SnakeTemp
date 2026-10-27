local Player = game:GetService("Players")

local function setupPlayerStats(player:Player)
	--tao thu muc leaderstats
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	--tao chi so gold
	local gold = Instance.new("IntValue")
	gold.Name = "Coins"
	gold.Value = 0
	gold.Parent = leaderstats
	
	--tao chi so cap do
	local level = Instance.new("IntValue")
	level.Name = "Level"
	level.Value = 1
	level.Parent = leaderstats
	
	
end

Player.PlayerAdded:Connect(setupPlayerStats)

-- lam sao de lay gia tri tu leaderstats va thay doi?