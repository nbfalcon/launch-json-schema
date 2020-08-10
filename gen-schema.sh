#!/bin/sh
if [ -n "$ENABLE_ROOT_OBJECT" ]; then
    echo "[INFO] Enabled root object schema"
    jq -Mf ./package-json2schema.jq "$@" \
        | jq -sMf ./json-schemas2schema-with-root-object.jq \
             > ./build/launch.json.jsonschema
else
    jq -Mf ./package-json2schema.jq "$@" \
        | jq -sMf ./json-schemas2schema.jq \
             > ./build/launch.json.jsonschema
fi
