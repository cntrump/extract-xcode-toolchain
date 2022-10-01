#!/usr/bin/env bash

set -ex

xip_file=$1
output_dir=$2
PlistBuddy=/usr/libexec/PlistBuddy
if [[ ! -x $PlistBuddy ]]; then
  echo ERR: file $PlistBuddy do not exist
  exit 1
fi

pushd "$output_dir"
output_dir=$(pwd)
popd

if [[ ! -f $xip_file ]]; then
  echo ERR: file $xip_file do not exist
  exit 1
fi

if [[ -d Xcode.app ]]; then
  echo remove Xcode.app in current directory
  rm -rf Xcode.app
fi

xip --expand "$xip_file"

pushd Xcode.app/Contents
version=$($PlistBuddy -c 'Print :CFBundleShortVersionString' version.plist)
pushd Developer/Toolchains/XcodeDefault.xctoolchain
$PlistBuddy -c "Set :Identifier com.apple.dt.toolchain.Xcode_$version" ToolchainInfo.plist
tar -cJvf "$output_dir/Xcode_$version.xctoolchain.tar.xz" $(ls)
popd
popd

echo toolchain saved at $output_dir/Xcode_$version.xctoolchain.tar.xz
