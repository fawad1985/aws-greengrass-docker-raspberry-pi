#!/bin/bash
# Start greengrass
/greengrass/ggc/core/greengrassd start

# Tail runtime logs
# Note: ingnore initial "No such file" as it takes some time...
tail -F /greengrass/ggc/var/log/system/runtime.log