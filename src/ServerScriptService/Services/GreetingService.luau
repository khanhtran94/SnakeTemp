--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = require(ReplicatedStorage.Source.Libs.Network)

local GreetingService = {}

function GreetingService.Start()
	Network.connectEvent(Network.RemoteEvents.RequestGreeting, function(player: Player)
		-- Roblox supplies the sender; the client does not choose this Player.
		print(`[GreetingService] Received greeting from {player.Name}`)
		Network.fireClient(
			Network.RemoteEvents.SendNotification,
			player,
			`Xin chào {player.DisplayName}! Server đã nhận yêu cầu của bạn.`,
			3
		)
	end, { Network.Middleware.RateLimit(2) })
end

return GreetingService
