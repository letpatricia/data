# fivem player data

This system allows temporary (session-based) data storage for players using their Steam ID.  

##  Examples

```lua

-- resource name = data

local userID = exports.data:steamID(source) 
exports.script:saveData(userID, 'killcount', 5)

local kills = exports.script:loadData(userID, 'killcount') or 1 
print('count:', kills) -- Output: count: 5
