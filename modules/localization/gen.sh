#!/bin/bash
set -e

# flutter pun add intl_utils

dart pub global run intl_utils:generate

echo "Build Data Done !!!"