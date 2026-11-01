local Players = game:GetService("Players")
local PlayerDataService = require(script.Parent.PlayerDataService)

local LeaderstatsService = {}

local function showCoins(player: Player, balance: number)
	local leaderstats = player:FindFirstChild("leaderstats")
	if not leaderstats then
		leaderstats = Instance.new("Folder")
		leaderstats.Name = "leaderstats"
		leaderstats.Parent = player
	end

	local coins = leaderstats:FindFirstChild("Coins")
	if not coins then
		coins = Instance.new("IntValue")
		coins.Name = "Coins"
		coins.Value = balance
		coins.Parent = leaderstats
	else
		coins.Value = balance
	end
end

function LeaderstatsService.Start()
	--  Khi người chơi vào game, hiển thị số coin đã tải từ profile.
	PlayerDataService.Signals.PlayerProfileLoaded:Connect(function(player, data)
		showCoins(player, data.Coins)
	end)

	--khi cham coi, update bang coin
	PlayerDataService.Signals.OnDataUpdated:Connect(function(player, data, deltas)
		if deltas.Coins ~= nil then
			showCoins(player, data.Coins)
		end
	end)

	-- Profile có thể đã tải xong trước khi Start kết nối hai sự kiện trên.

    for _, player in ipairs(Players:GetPlayers()) do
        local profile = PlayerDataService.GetPlayerProfile(player)
        if profile then
            showCoins(player, profile.Data.Coins)
        end
    end
end

return LeaderstatsService
