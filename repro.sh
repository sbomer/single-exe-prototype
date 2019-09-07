#!/usr/bin/env bash

scriptroot="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$scriptroot/build-coreclr.sh"

# initialize dotnet cli?
#
# wget https://dotnetcli.blob.core.windows.net/dotnet/Sdk/release/3.0.1xx/dotnet-sdk-latest-linux-x64.tar.gz
# tar xf dotnet-sdk-latest-linux-x64.tar.gz

# to run locally:
# dotnet publish -c Release webapi/webapi.csproj -o published
# published/webapi

source "$scriptroot/send-to-perflab.sh"
