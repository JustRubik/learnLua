package.path = "./src/modules/?.lua;" .. package.path
-- This is how to import modules from module.lua to main.lua
-- local module = require("module")

-- Project chuyển hướng sang việc tạo 1 class hoàn chỉnh, giống vector trong c++

-- Project chuyển hướng sang việc tạo 1 class linkedlist (double linkedList)

-- First, cần phải học cách tạo 1 class, 1 object trong lua

-- local List = require("lists")
--
--
-- 

local Exg = require("exampleClass")

local a = Exg:new(12, 10)

print(a:getLength())
print(a:getWidth())

a:printArea()

print(a.length)
print(a._length)
