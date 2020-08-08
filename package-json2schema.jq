#!/usr/bin/env -S jq -f
# Given a list of package.json files from VSCode debugger plugins, generate a
# sequence of JSON-schema objects that can be used as an array in an "oneOf"
# block.
.contributes.debuggers[] | . as $debugger | .configurationAttributes
    | to_entries[] | {
    "type": "object",
    "required": .value.required,
    "properties": ({
        "type": { "type": "string", "pattern": ("^" + $debugger.type + "$") },
        "request": { "type": "string", "pattern": ("^" + .key + "$") }
    } + .value.properties)
}
