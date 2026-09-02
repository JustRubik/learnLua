package.path = "./src/modules/?.lua;" .. package.path
-- This is how to import modules from module.lua to main.lua
-- local module = require("module")

-- Project chuyển hướng sang việc tạo 1 class hoàn chỉnh, giống vector trong c++

-- Project chuyển hướng sang việc tạo 1 class linkedlist (double linkedList)

-- First, cần phải học cách tạo 1 class, 1 object trong lua

--
-- local Exg = require("exampleClass")
--
-- local a = Exg:new(12, 10)
--
-- print(a:getLength())
-- print(a:getWidth())
--
-- a:printArea()
--
-- print(a.length)
-- print(a._length)
--

local List = require("lists")

local mon = { "Monday" }
local tue = { "Tuesday" }
local wed = { "Wednesday" }
local fri = { "Friday" }

local o = List(mon, tue)

local function printList(t)
	for v in t:iterate() do
		print(v[1])
	end
end

printList(o)
print("\n")

o:pushback(wed)
o:pushback({ "Thursday" })
o:pushback(fri)

printList(o)
print(o.length)
