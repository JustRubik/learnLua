package.path = "./src/modules/?.lua;" .. package.path
-- This is how to import modules from module.lua to main.lua
-- local module = require("module")

-- Project chuyển hướng sang việc tạo 1 class hoàn chỉnh, giống vector trong c++

local vector = require("vector")

local v = vector.new(10, 12)

print("Value of vector: ")

local dataT = v.data()

for key=1, v.len do
  print(key, dataT[key])
end
