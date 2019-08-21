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
    local data = saveDataStore:GetAsync(plr.UserId)
    if data then
        for i, v in pairs(leaderstats:GetChildren()) do
            v.Value = data[v.Name]
        end
    end
end)

-- Save quand le joueur leave
game.Players.PlayerRemoving:Connect(function()
    local leaderstats = plr:FindFirstChild("leaderstats")
    local saveData = {}
    if leaderstats then
        for i, v in pairs(leaderstats:GetChildren()) do
            saveData[v.Name] = v.Value
        end
        saveDataStore:SetAsync(plr.UserId, saveData)
    end
end)
