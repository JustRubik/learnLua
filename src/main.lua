-- package.path = "./src/?.lua;" .. package.path
-- local leetcode = require("leetcode#9")
--
-- print(leetcode.hallo())


file = io.open("test.txt", "a+")
-- io.stdin(file)
io.output(file)
for _=1,10 do 
  io.write("Hello Hiếu Rubik")
end
io.close(file)

