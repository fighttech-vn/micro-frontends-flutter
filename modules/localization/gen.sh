#!/bin/bash
set -e

# flutter pun add intl_utils

flutter pub global run intl_utils:generate

echo "Build Data Done !!!"