#!/usr/bin/env -S jq -sf
# Given a sequence of schemas from package-json2schema.jq, generates a
# launch.json schema suitable for all debuggers from all the packages passed to
# package-json2schema.jq. The root object can also contain a launch
# configuration with this script, and the launch configurations need not be
# stored exclusively in a "configurations" block.
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
    ] + [.[] | .properties.configurations = false])
}