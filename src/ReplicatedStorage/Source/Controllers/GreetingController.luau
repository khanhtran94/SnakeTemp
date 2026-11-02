--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Network = require(ReplicatedStorage.Source.Libs.Network)

local GreetingController = {}

function GreetingController.Start()
	-- A keyboard shortcut for this networking tutorial.
	UserInputService.InputBegan:Connect(function(input: InputObject, gameProcessed: boolean)
		if gameProcessed or UserInputService:GetFocusedTextBox() then
			return
		end

		if input.KeyCode == Enum.KeyCode.H then
			Network.fireServer(Network.RemoteEvents.RequestGreeting)
		end
	end)
end

return GreetingController
