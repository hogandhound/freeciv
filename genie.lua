solution "freeciv-genie"
	location "./genie"
	configurations {
		"Debug",
		"Release",
	}
	platforms {
		"x32",
		"x64",
	}
	language "C"
	configuration "Debug"
		targetdir "bin/Debug"

	configuration "Release"
		targetdir "bin/Release"
	
PROJ_DIR = path.getabsolute(".")

	
project "fc_utility"
	kind "StaticLib"
	
	includedirs {
		path.join(PROJ_DIR, "utility"),
		path.join(PROJ_DIR, "gen_headers"),
		path.join(PROJ_DIR, "dependencies/zlib/include"),
		path.join(PROJ_DIR, "dependencies/curl/include"),
		path.join(PROJ_DIR, "dependencies/tinycthread"),
		path.join(PROJ_DIR, "dependencies/unicode/include/"),
	}
	files {
		path.join(PROJ_DIR, "utility/**.c"),
		path.join(PROJ_DIR, "utility/**.h"),
		path.join(PROJ_DIR, "dependencies/tinycthread/**.c"),
		path.join(PROJ_DIR, "dependencies/tinycthread/**.h"),
	}
	
	--defines { "HAVE_CONFIG_H" }
	defines { 
	"_CRT_SECURE_NO_WARNINGS", "DATASUBDIR=\"2.6\"", 
		"VERSION_STRING=\"2.6.0\"",
		"WIN32_NATIVE",
		"ALWAYS_ROOT",
		"BUG_URL=\"\"",
		"LOCALEDIR=\"\"",
		"FREECIV_HAVE_TINYCTHR",
		"FREECIV_HAVE_DIRENT_H",
		"FREECIV_HAVE_WINSOCK",
		"FREECIV_HAVE_WINSOCK2",
		"FREECIV_HAVE_WS2TCPIP_H",
		"FREECIV_MSWINDOWS",
		"FREECIV_STORAGE_DIR=\"~/.freeciv\"",

	}
	configuration "Debug"
		flags { "Symbols" }
	
project "fc_common"
	kind "StaticLib"
	
	includedirs {
		path.join(PROJ_DIR, "common"),
		path.join(PROJ_DIR, "common/aicore"),
		path.join(PROJ_DIR, "common/networking"),
		path.join(PROJ_DIR, "common/scriptcore"),
		--path.join(PROJ_DIR, "dependencies/LuaJIT-2.0.5"),
		path.join(PROJ_DIR, "dependencies/lua-5.3/src"),
		path.join(PROJ_DIR, "dependencies/tolua-5.2/include"),
		path.join(PROJ_DIR, "dependencies/zlib/include"),
		path.join(PROJ_DIR, "dependencies/tinycthread"),
		path.join(PROJ_DIR, "utility"),
		path.join(PROJ_DIR, "gen_headers"),
	}
	
	files {
		path.join(PROJ_DIR, "common/**.c"),
		path.join(PROJ_DIR, "common/**.h"),
	}
	
	defines { 
		"_CRT_SECURE_NO_WARNINGS",
		"FREECIV_HAVE_TINYCTHR",
		"NETWORK_CAPSTRING=\"+Freeciv.Devel-3.1-2019.Jul.13\"",
		"NETWORK_CAPSTRING_MANDATORY=\"+Freeciv-2.6-network\"",
		"NETWORK_CAPSTRING_OPTIONAL=\"techloss_forgiveness\"",
		"VERSION_STRING=\"2.6.0\"",
		"WIN32_NATIVE",
		"FREECIV_AI_MOD_LAST=3",
		"FREECIV_HAVE_WINSOCK",
		"FREECIV_HAVE_WINSOCK2",
		"FREECIV_HAVE_WS2TCPIP_H",
		"BUG_URL=\"\"",
	}
	configuration "Debug"
		flags { "Symbols" }
	
	
project "lua53"
	kind "StaticLib"
	
	includedirs {
		path.join(PROJ_DIR, "dependencies/lua-5.3/src"),
	}
	
	files {
		path.join(PROJ_DIR, "dependencies/lua-5.3/**.c"),
		path.join(PROJ_DIR, "dependencies/lua-5.3/**.h"),
	}
	
	defines { 
	}
project "tolua52"
	kind "StaticLib"
	
	includedirs {
		path.join(PROJ_DIR, "dependencies/tolua-5.2/include"),
		path.join(PROJ_DIR, "dependencies/lua-5.3/src"),
	}
	
	files {
		path.join(PROJ_DIR, "dependencies/tolua-5.2/**.c"),
		path.join(PROJ_DIR, "dependencies/tolua-5.2/**.h"),
	}
	links { 
		"lua53",
	}
	
	defines { 
	}
	
project "freeciv-client"
	kind "ConsoleApp"
	
	includedirs {
		path.join(PROJ_DIR, "client"),
		path.join(PROJ_DIR, "client/agents"),
		path.join(PROJ_DIR, "client/luascript"),
		path.join(PROJ_DIR, "client/include"),
		path.join(PROJ_DIR, "common"),
		path.join(PROJ_DIR, "common/aicore"),
		path.join(PROJ_DIR, "common/networking"),
		path.join(PROJ_DIR, "common/scriptcore"),
		--path.join(PROJ_DIR, "dependencies/LuaJIT-2.0.5"),
		path.join(PROJ_DIR, "dependencies/lua-5.3/src"),
		path.join(PROJ_DIR, "dependencies/tolua-5.2/include"),
		path.join(PROJ_DIR, "dependencies/zlib/include"),
		path.join(PROJ_DIR, "dependencies/SDL2"),
		path.join(PROJ_DIR, "dependencies/cvercmp"),
		path.join(PROJ_DIR, "dependencies/tinycthread"),
		path.join(PROJ_DIR, "utility"),
		path.join(PROJ_DIR, "gen_headers"),
		
	}
	
	
	links { 
		"SDL2", 
		"SDL2_mixer",
		"SDL2_gfx",
		"SDL2_ttf",
		"SDL2_image",
		"fc_common",
		"fc_utility",
		"lua53",
		"tolua52",
		"Ws2_32",
		"Winmm",
		"icuuc",
	}
	files {
		path.join(PROJ_DIR, "client/gui-sdl2/*.c"),
		path.join(PROJ_DIR, "client/gui-sdl2/*.h"),
		path.join(PROJ_DIR, "client/agents/*.c"),
		path.join(PROJ_DIR, "client/agents/*.h"),
		path.join(PROJ_DIR, "client/luascript/*.c"),
		path.join(PROJ_DIR, "client/luascript/*.h"),
		path.join(PROJ_DIR, "client/include/*.c"),
		path.join(PROJ_DIR, "client/include/*.h"),
		path.join(PROJ_DIR, "client/*.c"),
		path.join(PROJ_DIR, "client/*.h"),
		path.join(PROJ_DIR, "dependencies/cvercmp/*.c"),
		path.join(PROJ_DIR, "dependencies/cvercmp/*.h"),
	}
	excludes {
		path.join(PROJ_DIR, "client/gui_*"),
		
	}
	
	defines { 
		"_CRT_SECURE_NO_WARNINGS",
		"DEFAULT_SOCK_PORT=5556",
		"MAJOR_VERSION=2",
		"MINOR_VERSION=6",
		"PATCH_VERSION=0",
		"VERSION_LABEL=\"\"",
		"FREECIV_DISTRIBUTOR=\"\"",
		"FOLLOWTAG=\"stable\"",
		"BUG_URL=\"\"",
		"WIKI_URL=\"\"",
		"FREECIV_META_URL=\"\"",
		"VERSION_STRING=\"2.6.0\"",
		"WIN32_NATIVE",
		"BINDIR=\"bin/\"",
		"SDL_MAIN_HANDLED",
		"FREECIV_HAVE_WINSOCK",
		"FREECIV_HAVE_WINSOCK2",
		"FREECIV_HAVE_WS2TCPIP_H",
		"FREECIV_HAVE_TINYCTHR",
		"FREECIV_AI_MOD_LAST=3",
	}
	
	configuration "Debug"
		libdirs { 
			"dependencies/curl/Debug",
			"dependencies/SDL2/Debug",
			"dependencies/zlib/lib",
			"dependencies/unicode/lib64",
			"bin/Debug",
		}
		links {
			"zlibstaticd",
			"libcurl-d_imp",
			"vcruntimed",
			"ucrtd",
			"msvcrtd",
		}
		flags { "Symbols" }
		
	configuration "Release"
		libdirs { 
			"dependencies/curl/Release",
			"dependencies/SDL2/Release",
			"dependencies/zlib/lib",
			"dependencies/unicode/lib64",
			"bin/Release",
		}
		links {
			"zlibstatic",
			"libcurl_imp",
			"vcruntime",
			"ucrt",
			"msvcrt",
		}
	
	

project "freeciv-server"
	kind "ConsoleApp"
	
	includedirs {
		path.join(PROJ_DIR, "server"),
		path.join(PROJ_DIR, "server/advisors"),
		path.join(PROJ_DIR, "server/scripting"),
		path.join(PROJ_DIR, "server/generator"),
		path.join(PROJ_DIR, "server/savegame"),
		path.join(PROJ_DIR, "ai"),
		path.join(PROJ_DIR, "ai/default"),
		path.join(PROJ_DIR, "ai/classic"),
		path.join(PROJ_DIR, "common"),
		path.join(PROJ_DIR, "common/aicore"),
		path.join(PROJ_DIR, "common/networking"),
		path.join(PROJ_DIR, "common/scriptcore"),
		path.join(PROJ_DIR, "dependencies/lua-5.3/src"),
		path.join(PROJ_DIR, "dependencies/tolua-5.2/include"),
		path.join(PROJ_DIR, "dependencies/zlib/include"),
		path.join(PROJ_DIR, "dependencies/SDL2"),
		path.join(PROJ_DIR, "dependencies/cvercmp"),
		path.join(PROJ_DIR, "dependencies/tinycthread"),
		path.join(PROJ_DIR, "utility"),
		path.join(PROJ_DIR, "gen_headers"),
		
	}
	
	
	links { 
		"SDL2", 
		"SDL2_mixer",
		"SDL2_gfx",
		"SDL2_ttf",
		"SDL2_image",
		"fc_common",
		"fc_utility",
		"lua53",
		"tolua52",
		"Ws2_32",
		"icuuc",
	}
	
	files {
		path.join(PROJ_DIR, "server/advisors/*.c"),
		path.join(PROJ_DIR, "server/advisors/*.h"),
		path.join(PROJ_DIR, "server/generator/*.c"),
		path.join(PROJ_DIR, "server/generator/*.h"),
		path.join(PROJ_DIR, "server/scripting/*.c"),
		path.join(PROJ_DIR, "server/scripting/*.h"),
		path.join(PROJ_DIR, "server/savegame/*.c"),
		path.join(PROJ_DIR, "server/savegame/*.h"),
		path.join(PROJ_DIR, "server/*.c"),
		path.join(PROJ_DIR, "server/*.h"),
		path.join(PROJ_DIR, "ai/**.c"),
		path.join(PROJ_DIR, "ai/**.h"),
	}
	
	defines { 
		"_CRT_SECURE_NO_WARNINGS",
		"DEFAULT_SOCK_PORT=5556",
		"MAJOR_VERSION=2",
		"MINOR_VERSION=6",
		"PATCH_VERSION=0",
		"VERSION_LABEL=\"\"",
		"FREECIV_DISTRIBUTOR=\"\"",
		"FOLLOWTAG=\"stable\"",
		"BUG_URL=\"\"",
		"WIKI_URL=\"\"",
		"FREECIV_META_URL=\"\"",
		"VERSION_STRING=\"2.6.0\"",
		"AI_MOD_DEFAULT=\"classic\"",
		"SDL_MAIN_HANDLED",
		"AI_MOD_STATIC_CLASSIC",
		"AI_MOD_STATIC_THREADED",
		"AI_MOD_STATIC_STUB",
		"FREECIV_HAVE_WINSOCK",
		"FREECIV_HAVE_WINSOCK2",
		"FREECIV_HAVE_WS2TCPIP_H",
		"FREECIV_HAVE_TINYCTHR",
		"FREECIV_AI_MOD_LAST=3",
	}
	
	configuration "Debug"
		libdirs { 
			"dependencies/curl/Debug",
			"dependencies/SDL2/Debug",
			"dependencies/zlib/lib",
			"dependencies/unicode/lib64",
			"bin/Debug",
		}
		links {
			"zlibstaticd",
			"libcurl-d_imp",
			"vcruntimed",
			"ucrtd",
			"msvcrtd",
		}
		flags { "Symbols" }
		
	configuration "Release"
		libdirs { 
			"dependencies/curl/Release",
			"dependencies/SDL2/Release",
			"dependencies/zlib/lib",
			"dependencies/unicode/lib64",
			"bin/Release",
		}
		links {
			"zlibstatic",
			"libcurl_imp",
			"vcruntime",
			"ucrt",
			"msvcrt",
		}
	
	