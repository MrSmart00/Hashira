#!/bin/sh

# Generate Project
mint run xcodegen generate
# bundle exec pod install --repo-update

echo "🏁 \033[32mBootstrap Completed!\033[m 🏁"

ROOT=$(git rev-parse --show-toplevel)
PROJECT_NAME=$(basename ${ROOT})

if test -z "${CI:-}"; then
  open $PROJECT_NAME.xcodeproj
fi
