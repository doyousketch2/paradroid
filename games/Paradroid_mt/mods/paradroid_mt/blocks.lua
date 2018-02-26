
print('Paradroid_mt:blocks init')

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

local texturepath  = modpath ..'/textures'
--print('texturepath  ' ..texturepath)

-- is_dir : nil = all,  true = subdirs,  false = files
local files  = minetest .get_dir_list( texturepath, false )
table .sort(files)

local color  = 'nada'
local prevcolor  = 'nada'
local counter = 0

for file = 1, #files do

  local filename  = files[file]
  local beginswith  = filename :sub(1,4)

  if beginswith == 'pink' then
    color  = 'pink'
  elseif beginswith == 'yell' then
    color  = 'yellow'
  elseif beginswith == 'gree' then
    color  = 'green'
  elseif beginswith == 'grey' then
    color  = 'grey'
  elseif beginswith == 'purp' then
    color  = 'purple'
  elseif beginswith == 'cyan' then
    color  = 'cyan'
  end -- beginswith

  if color == prevcolor then
    counter  = counter +1
  else
    prevcolor  = color
    counter  = 1
  end

  sansExt  = filename :sub(1,-5)
  nodename  = 'paradroid_mt:' ..sansExt

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  if sansExt :sub(-6,-1) == 'charge' then -- animated recharge node

    print(filename)
    minetest .register_node( nodename, {
      description  = sansExt,
      drop  = nodename,

      tiles  =  {
        {
          name  = filename,
          animation  = {
            type  = 'vertical_frames',
            aspect_w  = 64,
            aspect_h  = 64,
            length  = 0.5, -- seconds
          },  -- thanks Krock
        },
      },

      light_source  = 3,
      paramtype  = 'light',
      paramtype2  = 'facedir',
      buildable_to = true,
      is_ground_content  = true,

      sounds  = default .node_sound_wood_defaults(),
      groups  = { choppy = 3 },

    })

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  elseif sansExt :sub(-4,-1) == 'wall' then -- roundcube

    minetest .register_node( nodename, {
      description  = sansExt,
      drop  = nodename,

      drawtype  = 'mesh',
      mesh  = 'roundcube.obj',

      tiles  = { filename },
      pointable  = false, -- release game

      sounds  = default .node_sound_wood_defaults(),
      groups  = { choppy = 3 },

    })

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  else -- plain node

    minetest .register_node( nodename, {
      description  = sansExt,
      drop  = nodename,

      tiles  = { filename },

      paramtype2  = 'facedir',
      pointable  = false, -- release game

      sounds  = default .node_sound_wood_defaults(),
      groups  = { choppy = 3 },

    })

  end -- recharge

end -- files



minetest .register_lbm({
   name  = ':lbm1',
   nodenames  = {'rounded_cubes:rounded_cube'}, -- find nodes of this type

   action  = function(pos)
      minetest .set_node(pos, {name = 'paradroid_mt:grey_wall'}) -- replacer node name
   end,
})

