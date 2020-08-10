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

By default, the generated schema does not allow storing launch configurations in
the root object, even though that is explicitly allowed by VSCode. If you need
to support that, set the environment variable `ENABLE_ROOT_OBJECT`. That is,
instead of the above, run:
```console
$ ENABLE_ROOT_OBJECT=1 ./gen-schema.sh ${MY_PACKAGE_JSON1} ${MY_PACKAGE_JSON2}...
```
