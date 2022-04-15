#!/bin/bash
set -e

flutter build web --release --dart-define=FLUTTER_WEB_USE_SKIA=true
# flutter build web --web-renderer=html
firebase deploy

echo "Deoloy firebase Done !!!"
