local ReplicatedStorege = game:GetService("ReplicatedStorage")
local speedRemote = ReplicatedStorege.RequestSpeedBoost

speedRemote.OnServerEvent:Connect(function(player: Player, isBoosting: boolean)
	local character = player.Character
	
	if character and character:FindFirstChild("Humanoid") then
		local humanoid = character.Humanoid :: Humanoid
		
		if isBoosting then
			humanoid.WalkSpeed = humanoid.WalkSpeed + 12
		else
			humanoid.WalkSpeed = humanoid.WalkSpeed - 12
		end
		print(humanoid.WalkSpeed)
	end
end)