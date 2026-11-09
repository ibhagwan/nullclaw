# Zig Installation

## Prefer the packaged install when possible

If you already use Homebrew on macOS or Linux, the shortest path is the
prebuilt NullClaw package. It does not require a local Zig toolchain:

```bash
brew install nullclaw
```

Use the Debian steps below only when you want to build NullClaw from source and
need the exact pinned Zig 0.17.1 toolchain.

## Debian

These steps install Zig 0.17.1 from the official x86_64 Linux tarball on a fresh Debian system.
Run the `apt` commands as root, or prefix each with `sudo` if you have a non-root user.

The repository CI and container builds resolve Zig downloads through `.github/scripts/install-zig.sh`.
This page keeps the manual Debian path explicit for users setting up Zig before their first source build.

1. Refresh the package index:

   ```bash
   apt update
   ```

2. Install the download and extraction tools:

   ```bash
   apt install -y ca-certificates wget xz-utils
   ```

3. Visit [ziglang.org/download](https://ziglang.org/download/) and copy the URL for
   Zig 0.17.1. On a typical Debian x86_64 box, that is the Linux `x86_64`
   variant:

   [https://ziglang.org/download/0.17.1/zig-x86_64-linux-0.17.1.tar.xz](https://ziglang.org/download/0.17.1/zig-x86_64-linux-0.17.1.tar.xz)

4. Download the tarball:

   ```bash
   wget https://ziglang.org/download/0.17.1/zig-x86_64-linux-0.17.1.tar.xz
   ```

5. Verify the archive checksum from the official download metadata:

   ```bash
   printf '%s  %s\n' \
     3581863e3cbcfd0fce0efc682ce7e9e93da96668a977791d356a26d2a7e9b17a \
     zig-x86_64-linux-0.17.1.tar.xz | sha256sum -c -
   ```

6. Extract the archive:

   ```bash
   tar -xf zig-x86_64-linux-0.17.1.tar.xz
   ```

7. Add the extracted directory to your `PATH`:

   ```bash
   export PATH="$PWD/zig-x86_64-linux-0.17.1:$PATH"
   ```

   To keep Zig available in new shells, add the same `export` line with the
   absolute extracted directory path to your shell profile.

8. Verify the exact required version:

   ```bash
   zig version
   ```

   The output must be `0.17.1`.
