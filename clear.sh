#!/bin/bash
set -e

FILE=pubspec.lock
if test -f "$FILE"; then
    rm $FILE
fi

flutter pub get

