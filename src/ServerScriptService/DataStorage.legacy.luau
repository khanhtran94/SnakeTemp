local DatastoreService = game:GetService("DataStoreService")
local Players =game:GetService("Players")

local myData = DatastoreService:GetDataStore("GameData_v1")

--load data khi vao game
Players.PlayerAdded:Connect(function(player: Player) 
	local playerKey = "Player_" .. player.UserId
	
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Parent = leaderstats
	
	local success, saveCoins = pcall(function()
		return myData:GetAsync(playerKey)
	end)
	
	if success and saveCoins then
		coins.Value = saveCoins
		print("load success")
	else
		coins.Value = 0 
		print("player new or error")
	end
	
end)

--luu data khi thoat game

Players.PlayerRemoving:Connect(function(player: Player, reason: Enum.PlayerExitReason) 
	print(reason)
	local playerKey ="Player_" .. player.UserId
	local leaderStats = player:FindFirstChild("leaderstats")
	
	if leaderStats then
		local coins = leaderStats:FindFirstChild("Coins")
		if coins then
			coins.Value += 20

			local success , err = pcall(function() 
				myData:SetAsync(playerKey, coins.Value)
				
			end)
			
			if success then
				print("save success: " .. player.UserId)
			else
				print("save fail " .. error())
			end
		end
	end	
end)