package.path = "./src/?.lua;" .. package.path
-- This is how to import modules to main.lua
-- local module = require("module.lua")

local str = "Hiếu Rubik là Hiếu"
local target = "hieu"
local target2 = "hiếu"

local normalized = target:lower()

print(target:len())     -- 4
print(#target)          -- 4
print(utf8.len(target)) -- 4
print(target2:len())    -- 6
print(#target2)         -- 6
print(utf8.len(target2))-- 4
print(str:find(normalized))
