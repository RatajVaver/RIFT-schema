Item.Name = "Longsword"
Item.Icon = "base#Weapons/icon_longsword"
Item.Description = "Melee weapon, Versatile, <b>1d8{0}</> (<b>1d10{0}</>) <m>Slashing</> damage."
Item.Tooltip = [[<b>Longsword</>

Attack Roll: <b>1d20 + STR{0}</>
Damage: <b>1d8{0}</> (<b>1d10{0}</>) <m>Slashing</>

<y>Versatile</> - This weapon can be used with one or two hands. A damage value in parentheses applies when the weapon is used with two hands to make a melee attack.

{1}]]

function Item.GetDetails(weapon, player)
    local magical = weapon:GetData("magic")
    if (magical) then
        return { " + 1", "<c>Magic Weapon</> - This weapon has a +1 bonus to attack rolls and damage rolls." }
    end
    return { "", "" }
end

function Item.GetActions(weapon, player, character)
    local slot = character and character:GetEquippedSlot(weapon)

    local actions = {}
    if slot ~= "mainHand" then
        table.insert(actions, "equip=Equip into main hand")
    end
    if slot ~= "offHand" then
        table.insert(actions, "Equip into off-hand")
    end
    if slot then
        table.insert(actions, "Unequip")
    end
    return actions
end

function Item.OnEquip(weapon, player, character)
    character:Equip(weapon, "mainHand")
end

function Item.OnEquipIntoOffHand(weapon, player, character)
    character:Equip(weapon, "offHand")
end

function Item.OnUnequip(weapon, player, character)
    local slot = character:GetEquippedSlot(weapon)
    if slot then
        character:Unequip(slot)
    end
end
