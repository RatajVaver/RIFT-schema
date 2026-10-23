RIFT = exports["RIFT"].Get()

include("config.lua")

-- RIFT.Characters.RegisterVariable("race", { column = "VARCHAR(32) NULL" })
-- RIFT.Characters.RegisterVariable("class", { column = "VARCHAR(32) NULL" })

RIFT.Modules.Load({
    "rp2",
})

local files = {}
for _, path in ipairs(listFiles("items", "lua")) do
    Item = {}
    local ok, err = pcall(function() include("items/" .. path) end)
    if ok then
        files[path] = { definition = Item, version = math.min(getFileModTime("items/" .. path), PLUGIN_START) }
    else
        files[path] = { error = err }
    end
end
Item = nil
RIFT.Items.LoadFiles(PLUGIN_NAME, files)

RIFT.Servers.Register({
    -- { id = "s1", address = "127.0.0.1:7777", title = "Server 1" },
})
