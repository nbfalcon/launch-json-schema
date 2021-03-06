#!/usr/bin/env -S jq -sf
# Given a sequence of schemas from package-json2schema.jq, generates a
# launch.json schema suitable for all debuggers from all the packages passed to
# package-json2schema.jq. Strictly speaking the schema generated by this script
# is not correct, as the root object cannot store a configuration with a schema
# generated by this script. However, storing a configuration in the root object
# makes for inflexible launch.json files, which is why not allowing that is
# better. If you need that feature, use
# json-schemas2-schema-with-root-object.jq.
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