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
|while|
