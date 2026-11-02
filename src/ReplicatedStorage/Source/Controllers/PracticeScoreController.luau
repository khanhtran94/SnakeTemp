--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local Signal = require(ReplicatedStorage.Source.Libs.Signal)

local PracticescoreController = {}
local score = 0

--su kien truyen 2 so diem moi va diem vua cong

PracticescoreController.ScoreChanged = Signal.new() :: Signal.Signal<number, number>

function PracticescoreController:GetScore(): number
	return score
end

function PracticescoreController.AddScore(amount: number)
	score += amount

	--truyen su kien ra ngoai de hien thi diem vua cong
	PracticescoreController.ScoreChanged:Fire(score, amount)
end

function PracticescoreController.Start()
	UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
		if gameProcessedEvent or UserInputService:GetFocusedTextBox() then
			return
		end

		if input.KeyCode == Enum.KeyCode.R then
			PracticescoreController.AddScore(10)
		end
	end)
end

return PracticescoreController
