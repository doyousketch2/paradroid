[![OpenSource](https://img.shields.io/badge/Open-Source-orange.svg)](https://github.com/doyousketch2)  [![Lua|LuaJIT](https://img.shields.io/badge/Lua-LuaJIT-000080.svg)](https://www.lua.org/)  [![License](https://img.shields.io/badge/license-AGPL--V3-lightgrey.svg)](https://www.gnu.org/licenses/agpl-3.0.en.html)  [![Git.io](https://img.shields.io/badge/Git.io-vAV41-233139.svg)](https://git.io/vAV41) 

# paradroid_mt  ![icon](https://raw.githubusercontent.com/doyousketch2/paradroid_mt/master/games/Paradroid_mt/menu/icon.png) 
Minetest survival subgame based off an old C64 game  

====================================

it's very beta at this stage, alpha even.  

Done so far:  
- [x] lowered eyeheight  
- [x] modded elevators to use low eyeheight  
- [x] rounded corner blocks  
- [x] bender  
- [x] indoor mice  
- [x] laser crossbows  


Todo:  

- [ ] this  
- [ ] that  
- [ ] and the other thing  
- [ ] models  
- [ ] textures  
- [ ] map  
- [ ] sounds  
- [ ] more weapons  
- [ ] framespec game  
- [ ] transfer capability  
- [ ] trim out mods that aren't really needed  
- [ ] merge blinky w/ weapon 
- [ ] flash a few times, then revert to solid icon  

====================================

get your copy of Minetest from the official location  
- https://www.minetest.net/  
- or compile from source:

    `git clone https://github.com/minetest/minetest.git --branch stable-0.4 && cd minetest/games && git clone https://github.com/minetest/minetest_game.git --branch stable-0.4 && cd ..`

    `sudo apt-get install git cmake build-essential libirrlicht-dev libgettextpo0 libfreetype6-dev libbz2-dev libpng-dev libjpeg-dev libxxf86vm-dev libgl1-mesa-dev libsqlite3-dev libogg-dev libvorbis-dev libopenal-dev libcurl4-openssl-dev libluajit-5.1-dev liblua5.1-0-dev libleveldb-dev libsm-dev mlocate && updatedb`

    `cmake . -DRUN_IN_PLACE=1 -DENABLE_GETTEXT=1 -DENABLE_FREETYPE=1 -DENABLE_LEVELDB=1 -DENABLE_GLES=1 -DLUA_INCLUDE_DIR= \`locate -br ^luajit-2.1$\` && make -j$(nproc) && cd bin`

    `./minetest`  

