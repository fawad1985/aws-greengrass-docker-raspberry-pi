#!/bin/bash
# Start greengrass core
/greengrass/ggc/core/greengrassd start

# Ingonre initial "No such file" as it takes some time...
tail -F /greengrass/ggc/var/log/system/runtime.log