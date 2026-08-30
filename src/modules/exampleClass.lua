local Rectangle = {}

function Rectangle:new( length, width )
  local _length = length or 0
  local _width = width or 0
  local _area = _length * _width

  -- local self = { _length, _width }

  function self:printArea()
    print("Area: ", _area)
  end

  function self:getLength()
    return _length
  end

  function self:getWidth()
    return _width
  end

  return self
end

return Rectangle
