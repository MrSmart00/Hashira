#!/bin/sh

ROOT=$(git rev-parse --show-toplevel)

if test -z "${CI:-}"; then
  # Bitrise CLI
  if test ! $(which bitrise); then
    echo "  + Installing Bitrise CLI..."
    brew install bitrise
  else 
    echo "  + Bitrise found."
  fi
fi

# Mint
if test ! $(which mint); then
  echo "  + Installing Mint..."
  brew install mint
else
  echo "  + Mint found."
fi

echo "  + bootstrap Mint."
mint bootstrap

# echo "  + Create Secret via Sourcery."
# # Fetch Secrets with Sourcery
# git clone YOUR_SECRET_PROJECT_GIT "$ROOT"/secret
# cp "$ROOT"/secret/.secret.sourcery.yml "$ROOT"
# rm -rf "$ROOT"/secret
# mint run sourcery --config .secret.sourcery.yml
# rm -rf "$ROOT"/.secret.sourcery.yml

# Bundler
if test ! $(which bundle); then
  echo "  + Installing bundler..."
  gem install bundler
else
  echo "  + Bundler found."
fi

# Gem
echo "  + Installing gems."
bundle config set --local path 'vendor/bundle'
bundle install --quiet

swift run komondor install

echo "🏁 \033[32mSetup Completed!\033[m 🏁"