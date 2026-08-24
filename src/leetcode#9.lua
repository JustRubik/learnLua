-- Leetcode #9 
local M = {}

function M.checkType(integer)
  if type(integer) ~= "number" then
    return false
  else
    return true
  end
end

function M.solution(integer)
  if M.checkType(integer) then
    if integer < 0 then 
      return false
    else
      local num = integer
      local rev = 0
      while integer>0 do
        rev=rev*10+integer%10
        integer=integer//10
      end
      if num==rev then
        return true
      else
        return false
      end
    end
  else
    return "Wrong type"
  end
end

function M.test()
  local testCase = {
        {
            index = 1,
            nums = 121,
            expect = true
        },

        {
            index = 2,
            nums = -121,
            expect = false
        },

        {
            index = 3,
            nums = 10,
            expect = false
        }
    }
  
  for _, test in ipairs(testCase) do
    local output = M.solution(test.nums)
    if output == test.expect then
      print("Pass")
    else 
      print("Testcase", test.index, " failed")
    end
  end
end

return M
