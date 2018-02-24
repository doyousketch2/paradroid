-- script to make the magic happen

print('Paradroid_mt init')

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

local do_once  = true
local inventory  = false

minetest .register_on_joinplayer( function(player)
    minetest .after( 1, function() -- thanks sfan5

        if do_once then
          local player1name  = player :get_player_name()
          inventory  = minetest.get_inventory({ type = 'player', name = player1name })
          do_once  = false
        end

        -- mouseview,  relative to orig cam view.
        local low1p  = {x=0, y=-14.999999, z=0}
        local low3p  = {x=0, y=0, z=0}
        player :set_eye_offset(low1p, low3p)

        local properties = player :get_properties()
        --print(dump(properties))

        properties .visual = 'mesh'
        properties .mesh = 'monkey.obj'
        properties .textures = { 'monkey.png' }

        properties .collisionbox = { -0.1, 0, -0.1,  0.1, -0.8, 0.1 }
        player :set_properties(properties) -- thanks RobertZenz

    end -- function()
    ) -- minetest.after

  end -- function(player)
) -- minetest.joinplayer

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- https://github.com/minetest/minetest/blob/master/doc/lua_api.txt#L4579   0.5 code
-- https://github.com/minetest/minetest/blob/0.4.16/doc/lua_api.txt#L3979   0.4.16 code
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

minetest .register_tool( 'paradroid_mt:influencer', { -- thanks Krock, progysm, & cx384
    description  = 'Influence Device',
    inventory_image  = 'influencer.png',

    range  = 4.0,
    stack_max  = 1,
    wield_image  = nil,
    on_place  = nil,

    tool_capabilities = {
        max_drop_level=3,
        groupcaps= {
            cracky={times={[1]=4.00, [2]=1.50, [3]=1.00}, uses=70, maxlevel=1}
        }
    },

    on_use  = function(itemstack, user, pointed_thing) -- Left click transfer

      if pointed_thing .type == 'nothing' then
        print('on_use - nothing') --
      elseif pointed_thing .type == 'node' then
        print('on_use - node')
      else
        print('on_use - entity')
        -- battle menu
        local formname  = 'battle'
        local tablespec  = { "size[8,12]",
          "button[1,1; 1,1; 'name1'; 'label1']",
          "button[1,2; 1,1; 'name2'; 'label2']",
          "button[1,3; 1,1; 'name3'; 'label3']",
          "button[1,4; 1,1; 'name4'; 'label4']",
          "button[1,5; 1,1; 'name5'; 'label5']",
          "button[1,6; 1,1; 'name6'; 'label6']",
          "button[1,7; 1,1; 'name7'; 'label7']",
          "button[1,8; 1,1; 'name8'; 'label8']",
          "button[1,9; 1,1; 'name9'; 'label9']",
          "button[1,10; 1,1; 'name10'; 'label10']",
          "button[1,11; 1,1; 'name11'; 'label11']",
          "button[1,12; 1,1; 'name12'; 'label12']",  }

        local formspec  = table.concat(tablespec) -- thanks pgimeno

        minetest .show_formspec( user.get_player_name(),  formname,  formspec )

        if pointed_thing.ref :is_player() then -- show battle menu for enemy player

          minetest .show_formspec( pointed_thing.ref.get_player_name(),  formname,  formspec )

        else

          print('mob')
          -- AI code that randomly clicks 'till all available slots are used up

        end -- if pointed_thing :is_player()

      end -- .type == 'node'

    end, -- on_place

    }
)

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

minetest .register_tool( 'paradroid_mt:weapon1', {
    description  = 'Weapon System',
    inventory_image  = 'bullet2.png',

    range  = 4.0,
    stack_max  = 1,
    wield_image  = 'clear.png',
    on_place  = nil,

    tool_capabilities = {
        max_drop_level=3,
        groupcaps= {
            cracky={times={[1]=4.00, [2]=1.50, [3]=1.00}, uses=70, maxlevel=1}
        }
    },

    on_use  = function(itemstack, user, pointed_thing) -- Left click attack

      if pointed_thing .type == 'nothing' then
        print('on_use - nothing')
      elseif pointed_thing .type == 'node' then
        print('on_use - node')
      else -- entity
        print(dump(pointed_thing))

        local puncher  = user -- thanks raymoo
        local punchee  = pointed_thing .ref

        local damage  = 1

        local time_from_last_punch  = 1
        local tool_capabilities  = {
          full_punch_interval = 1.0,
          damage_groups = {fleshy = damage},  }
        local direction  = nil

        punchee :punch(puncher, time_from_last_punch, tool_capabilities, direction)

      end -- .type == 'node'
    end, -- on_use

    }
)

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

minetest .register_tool( 'paradroid_mt:weapon2', {
    description  = 'Weapon System',
    inventory_image  = 'bullet3.png',

    range  = 4.0,
    stack_max  = 1,
    wield_image  = 'clear.png',
    on_place  = nil,

    tool_capabilities = {
        max_drop_level=3,
        groupcaps= {
            cracky={times={[1]=4.00, [2]=1.50, [3]=1.00}, uses=70, maxlevel=1}
        }
    },

    on_use  = function(itemstack, user, pointed_thing) -- Left click attack

      if pointed_thing .type == 'nothing' then
        print('on_use - nothing')
      elseif pointed_thing .type == 'node' then
        print('on_use - node')
      else -- entity
        print(dump(pointed_thing))

        local puncher  = user -- thanks raymoo
        local punchee  = pointed_thing .ref

        local damage  = 1

        local time_from_last_punch  = 1
        local tool_capabilities  = {
          full_punch_interval = 1.0,
          damage_groups = {fleshy = damage},  }
        local direction  = nil

        punchee :punch(puncher, time_from_last_punch, tool_capabilities, direction)

      end -- .type == 'node'
    end, -- on_use

    }
)

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

local timer  = 0
local ticktock  = true

minetest .register_globalstep( function(dtime)
    timer  = timer +dtime;
    if timer >= 0.25 and ticktock then
      if inventory then
        inventory :set_stack( 'main',  1,  'paradroid_mt:weapon1' )
        ticktock  = false
      end -- if inventory
    elseif timer >= 0.5 then
      if inventory then
        inventory :set_stack( 'main',  1,  'paradroid_mt:weapon2' )
        ticktock  = true
        timer  = 0
      end -- if inventory
    end -- if timer
  end -- function(dtime)
) -- register_globalstep

