# Roadmap học LÖVE (Love2D)

> Mục tiêu: học Lua đủ chắc để dùng LÖVE, hiểu cách một game 2D vận hành, rồi tự làm được một project nhỏ hoàn chỉnh.
>
> **Môi trường:** Windows + Linux (Debian 13), Neovim, LuaJIT/Lua, LÖVE, Git.

---

## 0. Chuẩn bị môi trường

- [x] Cài LÖVE
  - Linux: package manager
  - Windows: Scoop
- [x] Tạo và chạy project LÖVE đầu tiên
- [x] Cấu hình `lua-language-server` cho Lua/LÖVE
- [x] Có definition của LÖVE trong LSP
- [x] Cấu hình formatter/linter nếu cần (dùng stylua)
- [ ] Tạo template project cá nhân

### Kiến thức cần hiểu

- `love .` / chạy file `.love` ( biên dịch .love file?)
- `main.lua`
- `love.load`
- `love.update`
- `love.draw`
- `love.keypressed`
- `love.mousepressed`

---

# Phase 1 — Lua nền tảng

Không cần học toàn bộ Lua trước khi đụng LÖVE. Học đến đâu dùng LÖVE để thực hành đến đó.

## 1.1. Syntax cơ bản

- [x] Variables
- [x] `local`
- [x] Numbers
- [x] Strings
- [x] Booleans
- [x] `nil`
- [x] Operators
- [x] `if / elseif / else`
- [x] `while`
- [x] `repeat ... until`
- [x] Numeric `for`
- [x] Generic `for`

## 1.2. Tables

- [x] Array-like tables
- [x] Dictionary-like tables
- [x] Keys/values
- [x] `pairs`
- [x] `ipairs`
- [x] `#table`
- [x] Nested tables
- [x] `nil` và table holes
- [x] Table references

## 1.3. Functions

- [x] Function declaration
- [x] Anonymous functions
- [x] Multiple return values
- [x] Variadic functions
- [x] Functions as values
- [x] Higher-order functions
- [x] Closures

## 1.4. Modules

- [x] `require`
- [x] `package.path`
- [x] Module pattern
- [x] Tách code thành nhiều file
- [x] Quản lý project structure

## 1.5. Lua nâng cao

- [ ] Metatables
- [ ] Metamethods
- [ ] `__index`
- [ ] `__newindex`
- [ ] OOP-style programming bằng tables/metatables
- [ ] Coroutines
- [ ] Iterators
- [ ] Error handling
- [ ] `pcall` / `xpcall`

### Project nhỏ

**Lua CLI mini-project**

Ví dụ:
- Todo list
- Text-based game
- Calculator
- Inventory system

Mục tiêu là luyện:
`table` → `function` → `module` → data structure.

---

# Phase 2 — LÖVE fundamentals

## 2.1. Game loop

Hiểu thật rõ:

```text
Input
  ↓
love.update(dt)
  ↓
Game state
  ↓
love.draw()
  ↓
Render
  ↓
Input ...
```

- [ ] `love.load`
- [ ] `love.update(dt)`
- [ ] `love.draw`
- [ ] `dt`
- [ ] Delta time
- [ ] FPS
- [ ] Fixed timestep vs variable timestep
- [ ] Game loop

### Project

**Moving Square**

- [ ] Vẽ một hình vuông
- [ ] Di chuyển bằng keyboard
- [ ] Movement độc lập với FPS
- [ ] Hiển thị FPS

---

# Phase 3 — Input

## Keyboard

- [ ] `love.keypressed`
- [ ] `love.keyreleased`
- [ ] `love.keyboard.isDown`

## Mouse

- [ ] `love.mousepressed`
- [ ] `love.mousereleased`
- [ ] `love.mousemoved`
- [ ] `love.mouse.isDown`
- [ ] Mouse position

## Joystick / gamepad

- [ ] Hiểu LÖVE joystick API
- [ ] Gamepad mapping

### Project

**Input Playground**

Một project để thử:

- WASD
- Arrow keys
- Mouse
- Mouse buttons
- Gamepad

Không cần đẹp. Mục tiêu là hiểu input API.

---

# Phase 4 — Graphics

## 4.1. Drawing primitives

- [ ] `love.graphics.rectangle`
- [ ] `love.graphics.circle`
- [ ] `love.graphics.line`
- [ ] `love.graphics.polygon`
- [ ] Colors
- [ ] Line width
- [ ] Fill / line mode

## 4.2. Images

- [ ] `love.graphics.newImage`
- [ ] `Image`
- [ ] Sprite
- [ ] Sprite scaling
- [ ] Sprite rotation
- [ ] Sprite flipping

## 4.3. Coordinate system

Hiểu:

```text
(0, 0)
  ─────────→ x
  │
  │
  │
  ↓
  y
```

- [ ] Screen coordinates
- [ ] World coordinates
- [ ] Position
- [ ] Rotation
- [ ] Scale
- [ ] Origin

## 4.4. Transformations

- [ ] `love.graphics.translate`
- [ ] `love.graphics.rotate`
- [ ] `love.graphics.scale`
- [ ] `push`
- [ ] `pop`

### Project

**Sprite Playground**

- [ ] Load sprite
- [ ] Move sprite
- [ ] Rotate sprite
- [ ] Scale sprite
- [ ] Flip sprite
- [ ] Camera-like movement

---

# Phase 5 — Animation

- [ ] Sprite sheet
- [ ] Quads
- [ ] Animation frames
- [ ] Animation timer
- [ ] Idle animation
- [ ] Walking animation
- [ ] Animation state

Hiểu pattern:

```text
elapsed time
     ↓
current frame
     ↓
sprite quad
     ↓
draw
```

### Project

**Animated Character**

Một character có:

- Idle
- Walk
- Direction
- Animation switching

---

# Phase 6 — Game state

Đây là phần cực kỳ quan trọng khi project bắt đầu lớn.

- [ ] State machine
- [ ] Menu state
- [ ] Playing state
- [ ] Pause state
- [ ] Game over state
- [ ] State transition

Ví dụ:

```text
Main Menu
    │
    ↓
 Playing
    │
 ┌──┴──┐
 ↓     ↓
Pause Game Over
 │
 └──→ Playing
```

### Project

**Mini Game Framework**

Tạo framework nhỏ có:

```text
states/
    menu.lua
    game.lua
    pause.lua
    gameover.lua
```

---

# Phase 7 — Collision & Physics

## Collision cơ bản

- [ ] AABB
- [ ] Circle collision
- [ ] Point collision
- [ ] Rectangle collision
- [ ] Collision response

Hiểu toán học:

```text
A.x < B.x + B.width
A.x + A.width > B.x
A.y < B.y + B.height
A.y + A.height > B.y
```

## Physics

- [ ] Velocity
- [ ] Acceleration
- [ ] Gravity
- [ ] Friction
- [ ] Jump
- [ ] Momentum

## LÖVE physics

Sau khi hiểu collision cơ bản:

- [ ] `love.physics`
- [ ] World
- [ ] Body
- [ ] Fixture
- [ ] Shape
- [ ] Collision callbacks

### Project

**Platformer Prototype**

- [ ] Player
- [ ] Gravity
- [ ] Jump
- [ ] Platforms
- [ ] Collision
- [ ] Camera
- [ ] Death / respawn

---

# Phase 8 — Audio

- [ ] `love.audio`
- [ ] Sound effect
- [ ] Music
- [ ] Volume
- [ ] Looping
- [ ] Pause/resume
- [ ] Audio source lifecycle

### Project

Thêm audio vào platformer:

- Jump sound
- Hit sound
- Death sound
- Background music

---

# Phase 9 — UI

- [ ] Text
- [ ] Font
- [ ] `love.graphics.newFont`
- [ ] Text alignment
- [ ] Buttons
- [ ] Hover state
- [ ] Click state
- [ ] Health bar
- [ ] Score
- [ ] HUD

### Project

Xây một HUD hoàn chỉnh:

```text
┌──────────────────────────────┐
│ HP ████████░░    SCORE: 1200 │
│                              │
│                              │
│          GAME                │
│                              │
└──────────────────────────────┘
```

---

# Phase 10 — Camera & World

- [ ] Camera concept
- [ ] World coordinates
- [ ] Screen coordinates
- [ ] Camera transform
- [ ] Camera follow
- [ ] Camera bounds
- [ ] Screen shake

Có thể tự viết camera đơn giản:

```lua
love.graphics.push()
love.graphics.translate(-camera.x, -camera.y)

-- draw world

love.graphics.pop()
```

### Project

**Scrolling World**

- [ ] Map lớn hơn màn hình
- [ ] Camera follow player
- [ ] Camera boundaries
- [ ] Parallax background

---

# Phase 11 — Tilemap & Level Design

- [ ] Tile
- [ ] Tileset
- [ ] Tilemap
- [ ] Grid
- [ ] Layers
- [ ] Collision layer
- [ ] Background layer
- [ ] Foreground layer

Sau đó có thể tìm hiểu:

- [ ] Tiled
- [ ] TMX
- [ ] LDtk
- [ ] Các thư viện hỗ trợ map

### Project

**Tilemap Platformer**

- Tilemap
- Player
- Collision
- Camera
- Enemies
- Collectibles

---

# Phase 12 — Entity & Architecture

Khi game có nhiều object, bắt đầu quan tâm architecture.

## Entity

Ví dụ:

```text
Entity
├── Player
├── Enemy
├── Bullet
├── Item
└── Particle
```

- [ ] Entity lifecycle
- [ ] `update`
- [ ] `draw`
- [ ] Destroy/remove entity
- [ ] Entity manager

## Components

Có thể tìm hiểu ECS sau khi đã hiểu architecture truyền thống.

- [ ] Composition
- [ ] Component
- [ ] System
- [ ] ECS concept

**Không cần nhảy vào ECS quá sớm.**

---

# Phase 13 — Data & Resource Management

- [ ] Asset loading
- [ ] Asset caching
- [ ] Texture manager
- [ ] Audio manager
- [ ] Font manager
- [ ] Resource lifetime
- [ ] Save/load game

Ví dụ:

```text
assets/
├── images/
├── sounds/
├── music/
├── fonts/
└── maps/
```

---

# Phase 14 — Performance

Chỉ học sâu khi đã có game chạy được.

## Lua

- [ ] Garbage collector
- [ ] Allocation
- [ ] Tables và allocation cost
- [ ] Local variables
- [ ] Profiling

## LÖVE

- [ ] Draw calls
- [ ] Sprite batching
- [ ] SpriteBatch
- [ ] Texture memory
- [ ] Canvas
- [ ] Shader

## Debugging

- [ ] FPS counter
- [ ] Memory usage
- [ ] Profiling
- [ ] Debug overlay

---

# Phase 15 — Shaders & Effects

Đây là phần nâng cao, không cần học sớm.

- [ ] GPU vs CPU
- [ ] Vertex shader concept
- [ ] Fragment shader concept
- [ ] GLSL basics
- [ ] LÖVE shaders
- [ ] Uniforms
- [ ] Post-processing
- [ ] Lighting
- [ ] Blur
- [ ] Distortion
- [ ] Color effects

### Project

Tạo vài effect:

- [ ] Flash
- [ ] Screen tint
- [ ] Bloom-like effect
- [ ] CRT effect
- [ ] Water distortion

---

# Phase 16 — Packaging & Distribution

- [ ] `.love` archive
- [ ] Command line
- [ ] Windows distribution
- [ ] Linux distribution
- [ ] Game data
- [ ] Save directory
- [ ] Versioning

Tìm hiểu:

```text
source/
    main.lua
    src/
    assets/

build/
    game.love
```

---

# Phase 17 — Git & Project Management

Trong toàn bộ quá trình nên dùng Git.

- [ ] Repository
- [ ] `.gitignore`
- [ ] Commit
- [ ] Branch
- [ ] Merge
- [ ] Rebase
- [ ] Tag
- [ ] Release

Project structure có thể hướng tới:

```text
my-game/
├── main.lua
├── conf.lua
├── src/
│   ├── player.lua
│   ├── enemy.lua
│   ├── world.lua
│   ├── camera.lua
│   └── states/
├── assets/
│   ├── images/
│   ├── sounds/
│   ├── music/
│   ├── fonts/
│   └── maps/
├── tests/
├── README.md
└── .gitignore
```

---

# Phase 18 — Project cuối

Sau khi hoàn thành các phase trên, làm **một game 2D hoàn chỉnh**.

Không cần game lớn.

## Scope đề xuất

Một game platformer/top-down nhỏ:

- [ ] Main menu
- [ ] Player
- [ ] Movement
- [ ] Animation
- [ ] Collision
- [ ] Enemy
- [ ] Attack
- [ ] Health
- [ ] Score
- [ ] Items
- [ ] Camera
- [ ] Tilemap
- [ ] Sound effect
- [ ] Music
- [ ] Pause
- [ ] Game over
- [ ] Save/load
- [ ] Settings
- [ ] Packaging

## Definition of Done

Game phải:

- Có thể chạy từ source
- Có thể build thành `.love`
- Có README
- Có Git repository
- Có ít nhất một release
- Có gameplay loop hoàn chỉnh
- Có thể chơi từ đầu đến cuối

---

# Thứ tự học rút gọn

Nếu không muốn đi theo toàn bộ roadmap một cách cứng nhắc:

```text
Lua
 │
 ├── Tables
 ├── Functions
 ├── Modules
 └── Metatables
       │
       ↓
LÖVE basics
       │
       ├── Game loop
       ├── Input
       └── Graphics
              │
              ↓
        Animation
              │
              ↓
       Collision/Physics
              │
              ↓
       Game State / UI
              │
              ↓
       Camera / Tilemap
              │
              ↓
       Entity Architecture
              │
              ↓
        Audio / Assets
              │
              ↓
        Optimization
              │
              ↓
       Shaders / Effects
              │
              ↓
        Final Project
```

---

# Nguyên tắc học

## 1. Không học LÖVE theo kiểu đọc API từ đầu đến cuối

Mỗi API nên đi kèm một project nhỏ.

Ví dụ:

```text
love.keyboard
    ↓
Moving Square

love.graphics
    ↓
Sprite Playground

Animation
    ↓
Animated Character

Collision
    ↓
Platformer

Camera
    ↓
Scrolling World
```

## 2. Không over-engineer project đầu tiên

Đừng vội:

- ECS
- dependency injection
- architecture phức tạp
- optimization sớm
- shader phức tạp
- physics engine tự viết hoàn chỉnh

Hãy làm game chạy trước.

## 3. Tự viết những thứ cơ bản ít nhất một lần

Ví dụ:

- AABB collision
- Camera
- Animation system
- State machine
- Entity manager

Sau khi hiểu rồi mới dùng thư viện.

## 4. Học toán vừa đủ cho game 2D

Nên nắm:

- Vector 2D
- Distance
- Angle
- Trigonometry
- Dot product
- Normalization
- Interpolation
- Coordinate systems

Không cần học toán đồ họa 3D ngay.

---

# Milestones

## Milestone 1 — Lua

> Có thể viết Lua mà không phải liên tục tra syntax.

## Milestone 2 — First LÖVE Game

> Có một cửa sổ game, input, update và rendering.

## Milestone 3 — Interactive Game

> Có player, movement, collision và animation.

## Milestone 4 — Real Game Structure

> Có state, entity, camera, assets và UI.

## Milestone 5 — Complete Game

> Có một game nhỏ hoàn chỉnh và có thể release.

## Milestone 6 — Advanced LÖVE

> Có thể tự tìm hiểu shader, performance, physics và architecture nâng cao.

---

# Cheat Sheet kiến thức cần đạt

| Chủ đề | Mức độ |
|---|---|
| Lua syntax | ⭐ |
| Tables | ⭐⭐⭐ |
| Functions | ⭐⭐⭐ |
| Closures | ⭐⭐ |
| Modules | ⭐⭐⭐ |
| Metatables | ⭐⭐ |
| LÖVE game loop | ⭐⭐⭐ |
| Input | ⭐⭐⭐ |
| Graphics | ⭐⭐⭐ |
| Animation | ⭐⭐⭐ |
| Collision | ⭐⭐⭐ |
| Physics | ⭐⭐ |
| Game state | ⭐⭐⭐ |
| UI | ⭐⭐ |
| Camera | ⭐⭐⭐ |
| Tilemap | ⭐⭐ |
| Entity architecture | ⭐⭐ |
| Audio | ⭐⭐ |
| Asset management | ⭐⭐ |
| Performance | ⭐⭐ |
| Shader | ⭐ |
| Packaging | ⭐⭐ |

---

# Mục tiêu cuối cùng

Không phải:

> "Biết hết API của LÖVE."

Mà là:

> **Nhìn vào một ý tưởng game 2D và biết cách tự chia nó thành các hệ thống Lua + LÖVE, triển khai, debug và đóng gói thành một game chạy được.**
