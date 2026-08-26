# Notes about Lua

## Ví dụ về 1 project Lua
```
my-lua-project/
├── README.md
├── .gitignore
├── .stylua.toml
├── src/
│   ├── main.lua
│   ├── math_utils.lua
│   ├── player.lua
│   └── game.lua
└── tests/
    ├── test_math.lua
    └── test_player.lua
```

## Truyền module
```
- local math_utils = require("math_utils")
(Lua tìm thông qua package.path)

- Với foo/bar.lua thì require("foo.bar")
```

## Keywords in Lua

|and        |break  |do     |else   |
|-----------|-------|-------|-------|
|elseif     |end    |false  |for    |
|function   |if     |in     |local  |
|nil        |not    |or     |repeat |
|return     |then   |true   |until  |
|while      |       |       |       |

## Datatypes in Lua

|Sr.No|Value Types & Description|
|-|----------|
|1|**nil**<br>Used to differentiate the value from having some data or no(nil) data.|
|2|**boolean**<br>Includes true and false as values. Generally used for condition checking.|
|3|**number**<br>Represents real(double precision floating point) numbers.|
|4|**string**<br>Represents array of characters.|
|5|**function**<br>Represents a method that is written in C or Lua.|
|6|**userdata**<br>Represents arbitrary C data.|
|7|**thread**<br>Represents independent threads of execution and it is used to implement coroutines.|
|8|**table**<br>Represent ordinary arrays, symbol tables, sets, records, graphs, trees, etc., and implements associative arrays. It can hold any value (except nil).|

## Format Codes for Dates in Lua

| Character | Description | Example |
| --- | --- | --- |
| **a** | Abbreviated weekday name | Wed |
| **A** | Full weekday name | Wednesday |
| **b** | abbreviated month name | Sep |
| **B** | full month name | September |
| **c** | date and time | 09/16/98 23:48:10 |
| **d** | day of the month | (16)\[01-31\] |
| **H** | hour, using a 24-hour clock | (23) \[00-23\] |
| **I** | hour, using a 12-hour clock | (11) \[01-12\] |
| **M** | minute | (48) \[00-59\] |
| **m** | month | (09) \[01-12\] |
| **p** | either "am" or "pm" | (pm) |
| **S** | second | (10) \[00-61\] |
| **w** | weekday | (3) \[0-6 = Sunday-Saturday\] |
| **x** | date | 09/16/98 |
| **X** | time | 23:48:10 |
| **Y** | full year | 1998 |
| **y** | two-digit year | (98) \[00-99\] |
| **%** | the character \`%´ | % |

