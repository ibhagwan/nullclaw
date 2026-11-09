# Vendored websocket package

This directory vendors the `nullclaw/websocket` package at commit
`9151f70b27024a072ea04425b9e7609eb6b1386c`.

Why vendored:
- Zig 0.17 removed `**` array repetition and several stdlib APIs used by the
  upstream package's test declarations.
- The package root calls `std.testing.refAllDecls`, so the whole package must
  compile under the pinned toolchain even when only the client API is used.
- Keeping the patched source in-tree makes the build deterministic and avoids
  a dependency on a mutable upstream branch.

Local patches:
- Replaced `"A" ** 130` with `@splat('A')` in `src/websocket.zig`.
- Migrated `std.meta.fields`/`std.meta.Tuple` to `@typeInfo`/`@Tuple`.
- Migrated `std.heap.memory_pool.Managed` to `std.heap.memory_pool.Extra`.
- Replaced `std.ascii.indexOfIgnoreCase` with `std.ascii.findIgnoreCase`.

Upstream: https://github.com/nullclaw/websocket
License: MIT (see `LICENSE`).
