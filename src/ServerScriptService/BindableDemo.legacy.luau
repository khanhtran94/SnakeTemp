local appleEaten = Instance.new("BindableEvent")
appleEaten.Event:Connect(function(point) 
	print("Ran vua an tao", point, "diem " )	
end)

appleEaten:Fire(10)


local getRequiredScore = Instance.new("BindableFunction")

getRequiredScore.OnInvoke = function(level)
	return level * 100
end

local requiredScore = getRequiredScore:Invoke(3)
print("Điểm cần để lên cấp 3 =", requiredScore)