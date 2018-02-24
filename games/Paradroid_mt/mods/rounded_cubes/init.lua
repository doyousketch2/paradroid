-- rounded cubes

minetest .register_node( 'rounded_cubes:rounded_cube',
  {
    drop  = 'rounded_cubes:rounded_cube',
    description  = 'Rounded Cube',

    drawtype  = 'mesh',
    mesh  = 'rounded_cube.obj',

    tiles  = {
      'rounded_cube.png', -- top
      'rounded_cube.png', -- bottom
      'rounded_cube.png', -- left
      'rounded_cube.png', -- right
      'rounded_cube.png', -- back
      'rounded_cube.png', -- front
    }, -- tiles

    light_source  = 4,
    paramtype  = 'light',
    paramtype2  = 'facedir',

    groups  = {snappy=1, choppy=2, oddly_breakable_by_hand=2},
    inventory_image  = minetest .inventorycube('rounded_cube.png'),

    selection_box  = {
      type  = 'fixed',
      fixed  = {
        {-0.485, -0.485, -0.485,  0.485, 0.485, 0.485 },
      }, -- fixed
    }, -- selection_box

  } -- rounded_cube
) -- register_node

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

minetest .register_node( 'rounded_cubes:cylindrical_cube',
  {
    drop  = 'rounded_cubes:cylindrical_cube',
    description  = 'Cylindrical Cube',

    drawtype  = 'mesh',
    mesh  = 'cylindrical_cube.obj',

-- http://www.nathansalapat.com/minetest/b3d4minetest-08

    tiles  = { -- thanks NathanS21
      'cylindrical_cube_top.png', -- top
      'cylindrical_cube_top.png', -- bottom
      'cylindrical_cube_side.png', -- left
      'cylindrical_cube_side.png', -- right
      'cylindrical_cube_side.png', -- back
      'cylindrical_cube_side.png', -- front
    }, -- tiles

    paramtype  = 'light',
    paramtype2  = 'facedir',

    groups  = {snappy=1, choppy=2, oddly_breakable_by_hand=2},
    inventory_image  = minetest .inventorycube('cylindrical_cube_top.png', 'cylindrical_cube_side.png', 'cylindrical_cube_side.png'),

    selection_box  = {
      type  = 'fixed',
      fixed  = {
        {-0.499, -0.5, -0.499,  0.499, 0.5, 0.499 }, -- thanks derixithy
      }, -- fixed
    }, -- selection_box

  } -- rounded_cube
) -- register_node

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- sudo apt-get intstall ogre-1.9-tools

minetest .register_node( 'rounded_cubes:bender',
  {
    drop  = 'rounded_cubes:bender',
    description  = 'Bender',

    drawtype  = 'mesh',
    mesh  = 'bennd3.obj', -- .obj  .x  .b3d

    tiles  = { 'bennd3.png' },

    paramtype  = 'light',
    paramtype2  = 'facedir',

    groups  = {snappy=1, choppy=2, oddly_breakable_by_hand=2},
    inventory_image  = 'bennd.png',

    selection_box  = {
      type  = 'fixed',
      fixed  = {
        {-0.2, -0.5, -0.15,  0.2, 0.48, 0.15 },
      }, -- fixed
    }, -- selection_box

  } -- rounded_cube
) -- register_node


