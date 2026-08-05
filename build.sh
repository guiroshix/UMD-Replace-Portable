#!/bin/sh

set -e

x86_64-w64-mingw32-gcc umd-replace.c -O3 -o umd-replace-win64.exe
i686-w64-mingw32-gcc umd-replace.c -O3 -o umd-replace-win32.exe

aarch64-linux-gnu-gcc umd-replace.c -O3 -o umd-replace-linux-arm64
gcc umd-replace.c -O3 -o umd-replace-linux-x86_64

$ANDROID_NDK_LATEST_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android21-clang \
    umd-replace.c \
    -O3 \
    -o umd-replace-android-arm64

chmod +x umd-replace-linux-arm64 umd-replace-linux-x86_64 umd-replace-android-arm64