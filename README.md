# RePlex — C++ Dynamic Library & Hot Reloading Project

## 1. Project overview

This project is a self-implementation inspired by the RePlex project described in the reference article:

https://howistart.org/posts/cpp/1/

The goal is **not to copy the original implementation**. The article is the reference for the overall problem and progression; the implementation, architecture, API design, and build setup should be developed independently.

### Final goal

Build a small C++ library/runtime system that can:

1. Load a shared library.
2. Find symbols inside it.
3. Call functions from the loaded library.
4. Read exported variables.
5. Rebuild the shared library while the runtime is still running.
6. Reload the new library.
7. Continue using the new implementation without restarting the runtime.

Conceptually:

```text
                 +---------------------+
                 |    RePlexRuntime    |
                 |                     |
                 |   load / reload     |
                 +----------+----------+
                            |
                     dynamic loading
                            |
                            v
                 +---------------------+
                 |     RePlexTest      |
                 |    shared library   |
                 |                     |
                 | foo()               |
                 | bar                 |
                 +---------------------+
```

---

# 2. Learning philosophy

The project is intended as a practical C++ project rather than a code-copying exercise.

Rules:

- Do not copy the implementation from the reference article.
- Prefer understanding the underlying mechanism before creating abstractions.
- Build every milestone into something executable.
- Use small experiments/projects when a concept is difficult.
- When blocked, solve the smallest missing concept first.
- Keep commits small and meaningful.
- Start with Linux/Unix dynamic loading.
- Treat Windows support as an advanced/optional phase.

The assistant should act primarily as a mentor:
- explain concepts;
- give hints;
- review code;
- point out design problems;
- avoid writing the whole implementation unless explicitly requested.

---

# 3. Suggested repository structure

A possible final structure:

```text
RePlex/
├── premake5.lua
├── src/
│   ├── ...
├── include/
│   └── ...
├── test/
│   └── ...
├── runtime/
│   └── ...
├── tests/
│   └── ...
├── build/
├── README.md
└── LICENSE
```

The exact structure is intentionally left open so that the implementation can evolve naturally.

Premake5 is suggested because the reference project uses it and because it provides an opportunity to practice Lua in a real build configuration.

CMake is also a valid alternative, especially if the goal is broader C++ ecosystem familiarity. The choice should be deliberate rather than accidental.

---

# 4. Phase 0 — Project skeleton

## Goal

Create a multi-target C++ project.

At minimum, eventually have:

```text
RePlex
RePlexTest
RePlexRuntime
```

The targets should be independently buildable.

## Input

- C++ source/header files
- compiler
- build configuration
- build system

## Output

A working build producing:

- a library target;
- a test shared library;
- a runtime executable.

The runtime should initially be able to execute something simple.

## Requirements

Understand the relationship between:

```text
source
  -> compiler
  -> object files
  -> linker
  -> library/executable
```

## Suggested side project

Create:

```text
hello-project/
├── lib/
│   ├── hello.cpp
│   └── hello.h
└── main/
    └── main.cpp
```

Build the library and executable separately.

---

# 5. Phase 1 — Object files and linking

## Goal

Understand what happens between C++ source and the final binary.

Study:

```text
.cpp
  |
  v
preprocessor
  |
  v
compiler
  |
  v
.o
  |
  v
linker
  |
  v
executable / library
```

Also understand:

- object files;
- static libraries;
- shared libraries;
- symbol resolution;
- linking.

## Input

Several independent source files, for example:

```text
foo.cpp
bar.cpp
main.cpp
```

## Output

Produce artifacts such as:

```text
foo.o
bar.o
libsomething.a
libsomething.so
main
```

## Requirements

Be able to explain:

- What is inside an object file?
- What does the linker do?
- What is a static library?
- What is a shared library?
- Why is a shared library useful for hot reloading?

## Suggested side project

Build a small math library:

```text
math/
├── add.cpp
├── sub.cpp
├── math.h
└── main.cpp
```

Initially build it manually with compiler commands rather than relying entirely on a build system.

---

# 6. Phase 2 — Dynamic loading

## Goal

Load a shared library at runtime instead of linking against it directly.

Target architecture:

```text
runtime
   |
   | dynamic loading
   v
test.so
```

On Unix/Linux, investigate:

```text
dlopen
dlsym
dlerror
dlclose
```

## Input

- path to a shared library;
- symbol name.

Example:

```text
"foo"
"bar"
```

## Output

- dynamic library handle;
- address of requested symbol;
- useful error information.

## Requirements

The runtime must be able to:

```text
load test.so
    |
    v
find foo
    |
    v
call foo
    |
    v
find bar
    |
    v
read bar
```

Do the first implementation directly with the platform API.

Do not create the final RePlex abstraction yet.

---

# 7. Side project — Dynamic Library Playground

Create a small independent project:

```text
dynamic-playground/
├── library/
│   ├── test.cpp
│   └── test.h
└── runtime/
    └── main.cpp
```

The library exports:

```text
foo()
bar
```

The runtime:

1. loads the library;
2. finds `foo`;
3. calls `foo`;
4. finds `bar`;
5. reads `bar`.

Then deliberately test:

- missing library;
- missing symbol;
- invalid symbol usage;
- loading/unloading errors.

The purpose is to understand dynamic loading independently of the larger RePlex architecture.

---

# 8. Side project — ABI / Symbol Playground

Create another small experiment:

```text
abi-playground/
├── lib/
│   ├── api.h
│   └── api.cpp
└── app/
    └── main.cpp
```

Experiment with:

- C functions;
- C++ functions;
- `extern "C"`;
- C++ name mangling;
- function pointers;
- exported/global variables.

Use binary inspection tools such as:

```text
nm
readelf
objdump
```

The purpose is to connect:

```text
C++ source
    |
    v
compiler
    |
    v
symbol
    |
    v
shared library
    |
    v
dlsym("...")
    |
    v
address
```

This is especially useful before implementing symbol lookup in RePlex.

---

# 9. Phase 3 — First hot reload

## Goal

Implement the first real hot-reloading experiment.

Runtime:

```text
load test.so
    |
call foo()
    |
read bar
    |
wait
```

While the runtime is still alive:

```text
edit test.cpp
    |
rebuild test.so
```

Then:

```text
reload
    |
lookup foo/bar again
    |
call/read them
```

## Input

Version 1:

```text
foo() -> "Hi"
bar = 4
```

Version 2:

```text
foo() -> "Can I haz hot-reloading"
bar = 314159
```

## Output

The same runtime process should demonstrate:

```text
Hi
bar == 4

[edit + rebuild]

Can I haz hot-reloading
bar == 314159
```

## Critical requirement

The runtime process must not be restarted.

This is the first milestone where the project genuinely becomes a hot-reloading system.

---

# 10. Phase 4 — RePlex dynamic-loader library

## Goal

Move direct calls to the platform dynamic-loading API behind a reusable abstraction.

Conceptually:

```text
runtime
   |
   v
RePlex API
   |
   v
dlopen / dlsym / dlclose
```

The runtime should no longer need to know the platform implementation.

## Input

- library path;
- symbol names.

## Output

- loaded-library state;
- symbol addresses;
- reload operation;
- errors.

## Requirements

The behavior from the previous phase must still work.

---

# 11. Phase 5 — Symbol manager

## Goal

Manage multiple symbols without manually repeating lookup code.

Conceptually:

```text
symbols:
    "foo" -> address
    "bar" -> address
    "baz" -> address
```

## Input

A collection/list of symbol names.

## Output

A symbol table or equivalent abstraction.

A natural implementation may involve:

```text
std::unordered_map<std::string, ...>
```

but the exact representation is part of the design exercise.

## Requirements

After load/reload:

- symbols must be available again;
- symbol lookup should be centralized;
- runtime code should not repeatedly perform raw `dlsym` operations.

---

# 12. Phase 6 — RePlexModule

## Goal

Create a higher-level C++ abstraction representing a hot-loaded module.

The module should contain or know:

- library path;
- exported symbol information;
- loading state;
- reload behavior;
- symbol lookup.

The test module can then conceptually become:

```text
RePlexModule
      ^
      |
      |
RePlexTest
```

## Input

A module description containing:

- library path;
- exported symbols.

## Output

A reusable module object that manages:

```text
load
reload
symbol lookup
```

## Suggested C++ topics

- classes;
- inheritance;
- class templates;
- singleton patterns (only if justified);
- `std::array`;
- `std::unordered_map`;
- function pointers;
- casts.

Do not introduce all of these merely because they exist in the reference. Use them when the design needs them.

---

# 13. Phase 7 — Function invocation abstraction

## Goal

Hide raw function-pointer casting from the runtime.

Conceptually, create an operation similar to:

```text
Execute<ReturnType>(name, args...)
```

## Input

- function name;
- expected return type;
- arguments.

Example:

```text
"add"
int
2, 3
```

## Output

```text
5
```

## Requirements

Test several function signatures:

```text
void foo()
int add(int, int)
float multiply(float, float)
```

## Suggested learning topic

Variadic templates.

This is a good point to study them directly rather than avoiding them.

---

# 14. Phase 8 — Variable access

## Goal

Provide a safe-ish abstraction for accessing exported variables.

Conceptually:

```text
GetVar<T>("bar")
```

## Input

- symbol name;
- expected type.

## Output

A pointer/reference/value corresponding to the exported symbol.

## Requirements

Test several types.

Understand the fundamental limitation:

`dlsym()` gives an address. It does not know the C++ type of the object at that address.

Therefore the system needs a convention or explicit type information.

---

# 15. Phase 9 — Error handling

## Goal

Make failure understandable and recoverable.

Test:

```text
library does not exist
symbol does not exist
reload fails
invalid symbol
invalid function usage
```

## Input

Deliberately invalid operations.

## Output

Useful error information.

Avoid turning ordinary user mistakes into unexplained segmentation faults.

---

# 16. Phase 10 — Debug and Release configurations

## Goal

Provide at least:

```text
Debug
Release
```

Debug may contain:

- debug symbols;
- assertions;
- less optimization.

Release may contain:

- optimization;
- reduced debugging information.

## Output

For example:

```text
build/
├── Debug/
└── Release/
```

---

# 17. Phase 11 — Testing

## Goal

Test the library independently from the demo runtime.

Test:

```text
Load
LoadSymbol
Reload
Execute
GetVar
Error handling
```

Distinguish:

```text
unit tests
integration tests
hot-reload integration tests
```

## Output

A repeatable test command producing clear results:

```text
PASS
PASS
PASS
...
```

---

# 18. Phase 12 — Cross-platform support

## Status

Optional / advanced.

Start with Linux/Unix.

After the Linux implementation is stable, investigate Windows dynamic-library loading.

Potential architecture:

```text
DynamicLibrary
├── UnixDynamicLibrary
└── WindowsDynamicLibrary
```

The important learning goal is to separate:

```text
platform-independent RePlex logic
```

from:

```text
platform-specific dynamic loading
```

---

# 19. Phase 13 — Packaging and publishing

## Goal

Someone should be able to clone the repository and understand how to:

```text
configure
build
test
run
```

## README requirements

Document:

- requirements;
- build instructions;
- test instructions;
- runtime usage;
- architecture;
- example;
- limitations;
- supported platforms.

---

# 20. Final milestone checklist

The project is considered complete when:

```text
[ ] Project builds reproducibly
[ ] RePlexRuntime exists
[ ] RePlexTest exists
[ ] Shared library can be loaded dynamically
[ ] Symbols can be located
[ ] Functions can be invoked
[ ] Variables can be accessed
[ ] Library can be unloaded
[ ] Library can be rebuilt while runtime is alive
[ ] Runtime can reload the new library
[ ] Runtime does not need to restart
[ ] Symbol state is rebuilt after reload
[ ] Errors are handled
[ ] Debug/Release configurations exist
[ ] Tests exist
[ ] README explains the project
[ ] Linux implementation works
[ ] Cross-platform support is optionally investigated
```

---

# 21. Recommended progression

```text
Project skeleton
       |
       v
Object files / linking
       |
       v
Static vs shared libraries
       |
       v
Dynamic Library Playground
       |
       v
dlopen / dlsym / dlclose
       |
       v
First hot reload
       |
       v
RePlex loader abstraction
       |
       v
Symbol manager
       |
       v
RePlexModule
       |
       v
Execute<Ret>(...)
       |
       v
GetVar<T>(...)
       |
       v
Error handling
       |
       v
Debug / Release
       |
       v
Testing
       |
       v
Cross-platform [advanced]
       |
       v
Packaging
```

Every milestone should produce a runnable artifact or demonstrable behavior.

---

# 22. Possible future extensions

After the core project works, possible extensions include:

- automatic detection of a changed library;
- file watching;
- automatic rebuild;
- automatic reload;
- preserving selected runtime state across reload;
- dependency management;
- plugin architecture;
- hot-reloading game systems;
- hot-reloading Lua/C++ components;
- Windows support;
- a small editor/demo application.

These are extensions, not requirements for the initial project.

---

# 23. Relationship to Lua and Love2D

Premake5 is intentionally interesting for this learning path because its configuration language is Lua.

A possible long-term progression is:

```text
Lua
 |
 +--> Lua language fundamentals
 |
 +--> Premake5
 |
 +--> Love2D
 |
 +--> Lua scripting in games/tools
```

The RePlex project therefore provides a useful opportunity to use Lua in a practical non-game context while continuing to learn C++.
