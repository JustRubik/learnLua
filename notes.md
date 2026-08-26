# All notes of learning Lua

## Booleans

### 1. Chỉ có `false` và `nil` là có giá trị false

For instance:
```
if 0 then
    print("true")
end
```
Trả về `true`

### 2. Trick để ép kiểu boolean trong Lua

Vì `not` luôn trả về boolean (không giống `and` và `or`) nên:
```
local m = not not m
```
sẽ ép `m` về boolean

### 3. Idiom kiểu Lua

```
local name = user.name or "unknown"
```
trả về `user.name` hoặc "unknown"

### 4. Toán tử 3 ngôi

Trong `Lua` không có toán tử 3 ngôi giống `C` nên ta có trick sau:
```
local result = condition and value1 or value2
```
trong đó: `value1` chỉ giá trị đúng, `value2` chỉ giá trị 2 (thứ tự phép toán vẫn là từ `trái` qua `phải`, như vậy `condition` sẽ **AND** với `value1` trước, nếu đúng trả về `value1`, nếu sai thì trả về `false` sau đó **OR** với `value2` thì trả về `value2`)
