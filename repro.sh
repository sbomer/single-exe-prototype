#!/usr/bin/env bash

# apt install cmake clang llvm libicu-dev liblttng-ust-dev libkrb5-dev

# initialize submodule
git submodule update --init

# pushd coreclr
# export LANG=en_US.UTF-8
# ./build.sh -stripsymbols
# popd
#
# wget https://dotnetcli.blob.core.windows.net/dotnet/Sdk/release/3.0.1xx/dotnet-sdk-latest-linux-x64.tar.gz
# tar xf dotnet-sdk-latest-linux-x64.tar.gz

dotnet publish -c Release webapi/webapi.csproj /v:n
mkdir -p bin
pushd bin
dotnet ../coreclr/bin/Product/Linux.x64.Release/bundle.dll --source ../publish --host webapi
popd
