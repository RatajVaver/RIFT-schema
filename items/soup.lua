Item.Name = "Soup"
Item.Description = "Really tasty soup."
Item.Tooltip = "<b>Soup</>\n\nYou can <l>use</> some <i>colors</> here, like <r>red</>, <o>orange</>, <y>yellow</>, <g>green</>, <t>teal</>, <c>cyan</>, <a>pink</>, and <m>gray</>."
Item.Icon = "base#Items/icon_soup"

function Item:GetActions(player)
    return { "Eat", "feed=Feed nearby animals" }
end

function Item:OnEat(player)
    self:Consume()
end

function Item:OnFeed(player)
    self:Consume()
end
