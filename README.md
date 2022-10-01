# Extract Xcode toolchain

a shell script for extract Xcode toolchain from xip file.

## Useage

Download Xcode xip file from: https://developer.apple.com/download/all/

```bash
./extract-xcode-toolchain.sh Xcode_11.3.1.xip ~/Documents
```

Xcode 11.3.1 toolchain will saved at `~/Documents/Xcode_11.3.1.xctoolchain.tar.xz`

Install toolchain into installed Xcode.app:

if your Xcode.app installed at `/Applications/Xcode.app`, create a directory with `.xctoolchain` suffix:

```bash
mkdir /Applications/Xcode.app/Contents/Developer/Toolchains/Xcode_11.3.1.xctoolchain
```

extract toolchain:

```bash
tar -xvf Xcode_11.3.1.xctoolchain.tar.xz \
    -C /Applications/Xcode.app/Contents/Developer/Toolchains/Xcode_11.3.1.xctoolchain
```

Using Xcode_11.3.1 toolchain in command line:

```bash
$ xcrun --toolchain Xcode_11.3.1 swift --version

Apple Swift version 5.1.3 (swiftlang-1100.0.282.1 clang-1100.0.33.15)
Target: x86_64-apple-darwin21.6.0
```
