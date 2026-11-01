local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")

local PlayerDataService = require(script.Parent.PlayerDataService)

local COIN_TAG = "Coin"
local REWARD = 10
local RESPAWN_TIME = 5

local CoinService = {}

local function connectCoin(coin: BasePart)
	if not coin:IsA("BasePart") then
		warn("Coin is not a BasePart")
		return
	end
	local collected = false
	local originalColor = coin.Color
	local originalCanCollide = coin.CanCollide

	coin.Touched:Connect(function(hit)
		if collected then
			return
		end
		local character = hit:FindFirstAncestorOfClass("Model")
		local player = Players:GetPlayerFromCharacter(character)
		if not player then
			warn("Touched by non-player")
			return
		end

		collected = true
		local awarded = PlayerDataService.UpdateData(player, function(data: PlayerDataService.PlayerData)
			data.Coins += REWARD
		end)

		if not awarded then
			warn("Failed to award coins to player: " .. player.Name)
			collected = false
			return
		end

        coin.Color = Color3.fromRGB(255, 255, 255)
        coin.CanCollide = false

        task.delay(RESPAWN_TIME, function()
            if not coin or not coin.Parent then
                return
            end
            coin.Color = originalColor
            coin.CanCollide = originalCanCollide
            collected = false
        end)
	end)
end

function CoinService.Start()
    local coins = CollectionService:GetTagged(COIN_TAG)
    for _, coin in ipairs(coins) do
        connectCoin(coin)
    end

    CollectionService:GetInstanceAddedSignal(COIN_TAG):Connect(function(coin)
        connectCoin(coin)
    end)
end

return CoinService
