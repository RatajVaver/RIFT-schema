Item.Name = "Greatsword"
Item.Icon = "base#Weapons/icon_greatwolf_greatsword"
Item.Description = "Melee weapon, Two-Handed, <b>2d6{0}</> <m>Slashing</> damage."
Item.Tooltip = [[<b>Greatsword</>

Attack Roll: <b>1d20 + STR{0}</>
Damage: <b>2d6{0}</> <m>Slashing</>

<y>Two-Handed</> - This weapon requires two hands when you attack with it.

{1}]]

Item.BlocksSlots = { mainHand = { "offHand" } }

function Item.GetDetails(weapon, player)
    local magical = weapon:GetData("magic")
    if (magical) then
        return { " + 1", "<c>Magic Weapon</> - This weapon has a +1 bonus to attack rolls and damage rolls." }
    end
    return { "", "" }
end

function Item.GetActions(weapon, player, character)
    local slot = character and character:GetEquippedSlot(weapon)
    if slot then
        return { "Unequip" }
    end
    return { "Equip" }
end

function Item.OnEquip(weapon, player, character)
    character:Equip(weapon, "mainHand")
end

function Item.OnUnequip(weapon, player, character)
    local slot = character:GetEquippedSlot(weapon)
    if slot then
        character:Unequip(slot)
    end
end
