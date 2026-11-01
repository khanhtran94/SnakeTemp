local ReplicatedStorage = game:GetService("ReplicatedStorage")
local OpenDoorEvent = ReplicatedStorage:WaitForChild("OpenDoor")

OpenDoorEvent.OnServerEvent:Connect(function(player, door)
	print("da mo cau: " .. door)
end)
