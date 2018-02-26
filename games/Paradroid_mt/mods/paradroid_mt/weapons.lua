
print('Paradroid_mt:weapons init')

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

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

