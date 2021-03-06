
#include "lua_extensions.h"

#if __cplusplus
extern "C" {
#endif

// cjson
#include "cjson/lua_cjson.h"

// zlib
#include "zlib/lua_zlib.h"

// lpack
#include "lpack/lpack.h"

#ifndef WP8
// socket
#include "socket/luasocket.h"
#include "socket/mime.h"
#include "socket/socket_scripts.h"

// filesystem
#include "filesystem/lfs.h"
#endif

// lsqlite3
#include "lsqlite3/lsqlite3.h"

#include "lraknet/lua-racknet.h"

// sproto
// #include "sproto/lsproto.c"
// #include "lpeg/lptree.c"
extern int luaopen_sproto_core(lua_State *L);
extern int luaopen_lpeg (lua_State *L);
extern int luaopen_crypt(lua_State *L);
extern int luaopen_bit(lua_State *L);
extern int luaopen_unicode(lua_State *L);
    
static luaL_Reg luax_exts[] = {
#if CC_USE_JSON
    {"cjson", luaopen_cjson_safe},
#endif
    {"zlib", luaopen_zlib},
    {"pack", luaopen_pack},
#ifndef WP8
    {"socket.core", luaopen_socket_core},
    {"mime.core", luaopen_mime_core},
    {"lfs", luaopen_lfs},
#endif
#if CC_USE_SQLITE
    {"lsqlite3", luaopen_lsqlite3},
#endif

// cloud wu's protocal buffer and lpeg
    {"sproto.core", luaopen_sproto_core},
    {"lpeg", luaopen_lpeg},
    {"bit", luaopen_bit},
    {"raknet.core", luaopen_raknet},
//    {"unicode", luaopen_unicode},
    {NULL, NULL}
};
    
#include "ConvertUTF.h"
#include <stdlib.h>
#include <string.h>

void luaopen_lua_extensions(lua_State *L)
{   
    // load extensions
    luaL_Reg* lib = luax_exts;
    lua_getglobal(L, "package");
    lua_getfield(L, -1, "preload");
    for (; lib->func; lib++)
    {
        lua_pushcfunction(L, lib->func);
        lua_setfield(L, -2, lib->name);
    }
    lua_pop(L, 2);

    // load extensions script
#ifndef WP8
	luaopen_socket_scripts(L);
#endif
}

#if __cplusplus
} // extern "C"
#endif
