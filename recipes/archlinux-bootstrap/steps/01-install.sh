#!/bin/bash

set -euo pipefail


echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen

echo "LC_ALL=en_US.UTF-8" > /etc/default/locale
