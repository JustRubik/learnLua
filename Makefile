# Lua version
LUA = lua

SRC = src
LUA_PATH = src/?.lua

test:
	LUA_FILES="$(LUA_FILES);$$LUA_PATH" $(LUA) $(FILE)

