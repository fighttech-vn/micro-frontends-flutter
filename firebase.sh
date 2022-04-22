#!/bin/bash
set -e

FILE=pubspec.lock
if test -f "$FILE"; then
    rm $FILE
fi

flutter pub get

flutter build web --release --dart-define=FLUTTER_WEB_USE_SKIA=true
# flutter build web --web-renderer=html
firebase deploy

cd modules/storybook

if test -f "$FILE"; then
    rm $FILE
fi

flutter pub get

flutter build web --release --dart-define=FLUTTER_WEB_USE_SKIA=true
firebase deploy
cd ../..
echo "Deoloy firebase Done !!!"
