--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Source = ReplicatedStorage.Source

local PracticeScoreController = require(Source.Controllers.PracticeScoreController)

local NoticationController = require(Source.UI.NotificationController)

local PracticeScoreNoticeController = {}
function PracticeScoreNoticeController.Setup()
	PracticeScoreController.ScoreChanged:Connect(function(newScore: number, amount: number)
		NoticationController.Show:Fire(`Bạn vừa được +{amount} điểm. Tổng: {newScore}`, 1.5)
	end)
end
return PracticeScoreNoticeController
