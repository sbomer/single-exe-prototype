#!/usr/bin/env bash

scriptroot="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
driverproject="$scriptroot/benchmarks/src/BenchmarksDriver/BenchmarksDriver.csproj"

client=
server=

if [[ -z "$client" ]] || [[ -z "$server" ]]; then
    echo "specify client and server in $BASH_SOURCE"
    exit 1
fi

# clone benchmarks repo
if [[ ! -e "$driverproject" ]]; then
    git clone https://github.com/aspnet/benchmarks
fi

dotnet run -p "$driverproject" -- \
       --source webapi \
       --client "$client"  \
       --server "$server" \
       --project-file webapi.csproj \
       --self-contained \
       --sdk 3.0.100-rc1-014176 \
       --path weatherforecast \
       --warmup 1 \
       --duration 2 \
       --build-arg "/p:UseStaticHost=true" \
       --build-arg "/p:UsePublishFilterList=true" \
       --build-arg "/p:PublishTrimmed=true" \
       --build-arg "/p:PublishReadyToRun=true" \
       --display-output

#       --verbose (to show all client/server communication)
#       --fetch (to retrieve the publish directory which for this project includes intermediate output)
