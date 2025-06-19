dataSystem = {
    data = {},

    _steamID = function(self, source)
        if source then
            self.steamid = GetPlayerIdentifier(source)  
            if self.steamid then
                return string.gsub(self.steamid, 'license:', '')
            end
        end
        return nil
    end,

    _loadData = function(self, entity, key)
        if entity and key then
            self.playerData = dataSystem.data[entity]
            return self.playerData and self.playerData[key] or nil
        end
        return nil
    end,

    _saveData = function(self, entity, arg1, arg2)
        if entity and arg1 and arg2 then
            self.playerData = dataSystem.data[entity]
            if not self.playerData then
                dataSystem.data[entity] = {}
                self.playerData = dataSystem.data[entity]
            end
            self.playerData[arg1] = arg2
        end
    end,

    _checkAllData = function(self, arg)
        self.results = {}
        for username, userData in pairs(dataSystem.data) do
            if userData[arg] then
                table.insert(self.results, {username = username, value = userData[arg]})
            end
        end
        return self.results
    end
}

dataSystem:_saveData('testUser', 'name', 'test')

-- export

steamID = function(source)
    local player = source
    return dataSystem:_steamID(player)
end

loadData = function(entity, key)
    return dataSystem:_loadData(entity, key)
end

saveData = function(entity, arg1, arg2)
    dataSystem:_saveData(entity, arg1, arg2)
end

checkAllData = function(arg)
    return dataSystem:_checkAllData(arg)
end