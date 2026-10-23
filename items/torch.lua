Item.Name = "Torch"
Item.Description = "An essential adventuring tool."
Item.Tooltip = [[Tooltips are defined in Lua statically for every item type, but parts of the tooltip can also be dynamically changed with some details.

For example, this is a {0}.]]
Item.Icon = "base#Items/icon_torch"

function Item.GetDetails(instance, player)
    local q = instance:GetQuantity()
    if (q == 1) then
        return { "<b>single torch</>" }
    end
    return { "stack of <o>" .. q .. "</> torches" }
end

function Item.GetActions(instance, player)
    return { "Light" }
end

function Item.OnLight(instance, player)
    player:Notify("Campfire", "Huzzah! Let there be light.", Color(0xfcc732))
end
