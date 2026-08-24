-- package.path = "./src/?.lua;" .. package.path
-- local leetcode = require("leetcode#9")
--
-- print(leetcode.hallo())

local result = 0
for i=5,13 do
  result = result + math.sqrt(i)
end
print(result)
