#!/usr/bin/env -S jq -sf
# Given a sequence of schemas from package-json2schema.jq, generates a
# launch.json schema suitable for all debuggers from all the packages passed to
# package-json2schema.jq.
{
    "oneOf": ([
        {
            "type": "object",
            "properties": {
                "version": {
                    "type": "string",
                    "pattern": "[0-9]+\\.[0-9]+\\.[0-9]+"
                },
                "configurations": {
                    "type": "array",
                    "items": { "oneOf": . }
                }
            }
        }
    ] + (if $ENABLE_ROOT_OBJECT then [.[] | .properties.configurations = false] else [] end))
}