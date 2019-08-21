local DataStoreService = game:GetService("DataStoreService")
local saveDataStore = DataStoreService:GetDataStore("VotreNomDeDataStoreIci")

game.Players.PlayerAdded:Connect(function(plr)
    print("Le leaderstats de ".. plr.Name .." est load!")

    local leaderstats = Instance.new("Folder", plr)
    leaderstats.Name = "leaderstats"

    local cash = Instance.new("IntValue", leaderstats)
    cash.Name = "Cash"
    cash.Value = 0 -- Mettre ici la valeur à la premiere connexion

    local kill = Instance.new("IntValue", leaderstats)
    kill.Name = "Kill"
    kill.Value = 0

    -- obtenir la save
    local data = saveDataStore
end)