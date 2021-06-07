#!/bin/sh

# Generate Project
mint run xcodegen generate
bundle exec pod install --repo-update

echo "🏁 \033[32mBootstrap Completed!\033[m 🏁"