#!/bin/sh
if [ "$ENABLE_ROOT_OBJECT" ]; then
    ENABLE_ROOT_OBJECT=true
    echo "[INFO] Enabled root object schema"
else
    ENABLE_ROOT_OBJECT=false
fi

jq -Mf ./package-json2schema.jq "$@" \
    | jq -sMf --arg ENABLE_ROOT_OBJECT false ./json-schemas2schema.jq \
         > ./build/launch.json.jsonschema
