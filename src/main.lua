-- Leetcode #1 

function formatMin(a, b)
  if a > b then return b, a
  elseif a < b then return a, b
  else return nil, "Error: 2 numbers equal"
  end
end

function compare2Tables(a, b)
  if type(a) ~= "table" or type(b) ~= "table" then
    return "Error: Wrong format"
  end

  if #a ~= #b then
    return false
  end
  
  for i=1, #a do
    if a[i] ~= b[i] then 
      return false
    end
  end

  return true
end

function twoSum(nums, target)
  local hash = {}

  for i,v in ipairs(nums) do
    if type(v) ~= "number" then
      return nil, "Error: False type"
    end
    local tmp = target - v
    if hash[tmp] then
      return formatMin(i, hash[tmp])
    end
    hash[v] = i
  end
  
  return nil, "No solutions" 
end

function solution(nums, target)
  if type(nums) ~= "table" then
    return nil, "Error: False type"
  end

  if type(target) ~= "number" then
    return nil, "Error: False type"
  end

  return twoSum(nums, target)
end

function test()
  local testCase = {
        {
            index = 1,
            nums = {2, 7, 11, 15},
            target = 9,
            expect = {1, 2}
        },

        {
            index = 2,
            nums = {3, 2, 4},
            target = 6,
            expect = {2, 3}
        },

        {
            index = 3,
            nums = {3, 3},
            target = 6,
            expect = {1, 2}
        }
    }
  
  for _, test in ipairs(testCase) do
    local output = solution(test.nums, test.target)
    if compare2Tables(output, test.expect) then
      print("Pass")
    else 
      print("Testcase", test.index, " failed")
    end
  end
end

return test()
