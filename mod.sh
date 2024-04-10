#!/bin/bash
# # Copyright (C) Flominator
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

patchelf  --add-needed "libb-impl.so" "build/bin/app"
echo "patch build/bin/app: adding libb-impl.so"

# symbol has to be same length
sed -i 's|bxxx|bold|g' "build/lib/libab-impl.so"
echo "patch build/lib/libab-impl.so: replace bxxx symbols to bold"
