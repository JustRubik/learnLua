local M = {}

function M.new(len, init)
  local v = {
    len = len,
    init = init,
    data = function()
      local t = {}
      for i=1, len do
        t[i] = i*init
      end
      return t
    end
  }
	return v
end

return M
