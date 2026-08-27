# All notes of learning Fundamental Lua

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

## Strings

### 1 vài `escape`

|Kí tự  |Đầu ra |
|-------|-------|
|\\n    |newline|
|\\t    |tab    |
|\\     |\\     |
|\"     |"      |
|\'     |'      |


### 1 ví dụ về `#`

```
local target = "hieu"
local target2 = "hiếu"

local normalized = target:lower()

print(target:len())     -- 4
print(#target)          -- 4
print(utf8.len(target)) -- 4

print(target2:len())    -- 6
print(#target2)         -- 6
print(utf8.len(target2))-- 4
```

## Loop

### repeat ... until
Giống như do ... while trong c/c++, điểm khác là biến ở trong vòng lặp có thể được gọi ở `until`, trong khi đó ở c thì phải khai báo trước cả vòng lặp.

### Generic loop
1 ví dụ thú vị:
```
local text = "HP=100 MP=50 XP=200"

for stat, value in text:gmatch("(%w+)=(%d+)") do
    print(stat, value)
end
```

### pairs và ipairs

ipairs là duyệt iterator với bắt đầu từ index=1

## Tables
### Nested tables

A table can contain other tables.

```
local player = {
    position = {
        x = 100,
        y = 200
    }
}

```

Access:
    player.position.x


### nil

`nil represents "no value" / "does not exist".`

Missing key:
   `local t = {}
    print(t.foo) --> nil` 

Assigning nil removes a key:
    `    t.foo = nil`

nil is falsy.


### Table holes

An array-like table can contain holes:

    local t = {
        "A",
        "B",
        nil,
        "D"
    }

Index 3 is a hole.

Important:
    #t should only be relied on for contiguous sequences.

ipairs() stops at the first nil.

pairs() can iterate over non-contiguous keys.


### Table references

Tables are reference-like values.

    local a = { hp = 100 }
    local b = a

a and b refer to the same table.

    b.hp = 50
    print(a.hp) --> 50

Creating two tables creates two different tables:

    local a = {}
    local b = {}

    a == b --> false

Assignment does NOT copy a table.

Copying requires explicitly creating a new table.

Shallow copy:
    copies the top-level fields.

Nested tables remain shared.

Deep copy:
    recursively copies nested tables.

## Closure

A closure is a function together with the variables
from its surrounding scope that it captures.

A function can keep accessing captured variables even
after the outer function/scope has finished.

Example:

    local function counter()
        local count = 0

        return function()
            count = count + 1
            return count
        end
    end

    local c = counter()

    print(c()) -- 1
    print(c()) -- 2
    print(c()) -- 3

`count` is captured by the returned function.

Each call to `counter()` creates an independent closure:

    local a = counter()
    local b = counter()

    a() --> 1
    a() --> 2

    b() --> 1
    b() --> 2

Closures are useful for:

    - private state
    - callbacks
    - event handlers
    - iterators
    - state machines
    - maintaining state between function calls

A closure captures the variable itself, not simply a copy
of its current value.

## Modules

### Require
`Require` sẽ gán module vào cái biến mà gọi module ấy.

### Dofile và Loadfile
- Truyền vào 1 đường dẫn file: `local a = dofile(a.lua)` dùng để chạy file đấy như 1 hàm duy nhất, ngay lập tức; `local b = loadfile(b.lua) dùng để lưu b như 1 hàm (lúc này chưa chạy ngay), và dùng như 1 hàm ngoài.
- Ngoài ra, dofile và loadfile không lưu cache file truyền vào, không giống như module load bằng `require()`.
- Nói chung, `dofile` và `loadfile` nhìn 1 file `.lua` như 1 **hàm**, trong khi đó `module` nhìn 1 file `.lua` như 1 **module**.

### package.path

1 ví dụ đơn giản:
Giả sử ta có cấu trúc thư mục như sau:

```Tree
├── main.lua
└── src
    └── modules
        └── math.lua
```

thì import module kiểu:
```Lua
package.path = "./src/modules/?.lua;" .. package.path
```

# All notes of advanced Lua

## Meta: metatables and metamethod

### Các key đặc biệt
Bắt đầu với `__` 
```
__add           -- tổng
__sub           -- hiệu
__mul           -- tích
__div           -- chia
__mod           -- modulo
__pow           -- power: lũy thừa
__eq            -- equal: so sánh bằng
__lt            -- less than (<)
__le            -- less than or equal (<=)
--unm           -- số âm
--idiv          -- floor division (//)
__index         -- trigger when looking up a missing key or absent table index
__newindex      -- trigger when assigning a value to a missing key.
__len           -- len operator
__concat        -- concat
__tostring      -- formatting
__call          -- destructer called when a userdata or table is collected
```
để trỏ tới metamethod
