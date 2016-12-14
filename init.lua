minetest.register_node("leave_spawn:button", {
     description = "Leave Spawn Button",
     groups = {not_in_creative_inventory=1, cracky=3, crumbly=3},
     tiles = {"button.png"},
     on_rightclick = function(pos, node, player, itemstack, pointed_thing)
          if minetest.check_player_privs(player:get_player_name(), {interact=true}) == true then
               local pos = player:getpos()
               pos.x = pos.x + 10
               player:setpos(pos)
          else
               minetest.kick_player(player:get_player_name(), "You don't have interact yet.")
          end
     end
})

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
     if node.name == "leave_spawn:button" then
          if minetest.check_player_privs(puncher:get_player_name(), {interact=true}) == true then
               local pos = puncher:getpos()
               pos.x = pos.x + 10
               puncher:setpos(pos)
          else
               minetest.kick_player(puncher:get_player_name(), "You don't have interact yet.")
          end
     end
end)
