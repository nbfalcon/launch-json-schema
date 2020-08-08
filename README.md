# About
This repository implements a launch.json schema generator that can convert
multiple package.json files from VSCode debug extensions into one launch.json
schema.

# Usage
The main entry point is ./gen-schema.sh. Just run:
```console
$ ./gen-schema.sh ${MY_PACKAGE_JSON1} ${MY_PACKAGE_JSON2}...
```
A file "launch.json.jsonschema" will then appear in the ./build directory of the
repository, containing the generated JSON schema suitable for launch.json files.
