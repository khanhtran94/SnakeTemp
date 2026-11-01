--!strict

local TypeFunctions = require("../Utility/TypeFunctions")

export type PlayerData = {
	Coins: number,
}

export type PlayerDataKey = TypeFunctions.EnumOf<PlayerData>

return nil
