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


