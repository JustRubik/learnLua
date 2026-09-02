local List = {}
List.__index = List

function List:pushback(t)
	if self.last then
		self.last._next = t
		t._prev = self.last
		self.last = t
	else
    t._prev = nil
		self.first = t
		self.last = t
	end

	self.length = self.length + 1
end

setmetatable(List, {
	__call = function(_, ...)
		local t = setmetatable({ length = 0 }, List)
		for _, v in ipairs({ ... }) do
			t:pushback(v)
		end
		return t
	end,
})

local function iterate(self, current)
  if not current then
    current = self.first
  elseif current then
    current = current._next
  end

  return current
end

function List:iterate()
  return iterate, self, nil
end


-- function List.insert(node, value)
-- 	node = { next = node, data = value }
-- 	return node
-- end
--
-- function List.traverse(head)
-- 	local node = head
-- 	while node do
-- 		print(node.data)
-- 		node = node.next
-- 	end
-- end

return List
