--local DataStorageService = game:GetService("DataStoreService")
--local Players = game:GetService("Players")

--local coinDataStore = DataStorageService:GetDataStore("CoinDataStore")

--local function onPlayerAdded(player)
--    local success, data = pcall(function()
--        return coinDataStore:GetAsync(player.UserId)
--    end)

--    local leaderstats = Instance.new("Folder")
--    leaderstats.Name = "leaderstats"
--    leaderstats.Parent = player

--    --create coins stat
--    local coins = Instance.new("IntValue")
--    coins.Name = "Coins"
--    coins.Parent = leaderstats
--    coins.Value = 0 -- Default value

--    if success then
--        if data then
--            coins.Value = data
--        else
--            coins.Value = 0 -- Default value if no data exists
--        end
--    else
--        warn("Failed to load coin data for player: " .. player.Name)
--        coins.Value = 0 -- Default value on failure
--    end
--end

----function to save player data when they leave
--local function onPlayerRemoving(player)
--    local coins = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Coins")
--    if coins then
--        local success, errorMessage = pcall(function()
--            coinDataStore:SetAsync(player.UserId, coins.Value)
--        end)

--        if not success then
--            warn("Failed to save coin data for player: " .. player.Name .. ". Error: " .. errorMessage)
--        end
--    end
--end

--Players.PlayerAdded:Connect(onPlayerAdded)
--Players.PlayerRemoving:Connect(onPlayerRemoving)

---- Optional: Save all player data periodically (e.g., every 5 minutes)
--game:BindToClose(function()
--    for _, player in ipairs(Players:GetPlayers()) do
--        onPlayerRemoving(player)
--    end
--end)
