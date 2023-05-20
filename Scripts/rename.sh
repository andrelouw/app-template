#!/usr/bin/env bash

BUNDLE_IDENTIFIER=""
APP_NAME=""

# Make sed command compatible in both Mac and Linux environments
# Reference: https://stackoverflow.com/a/38595160/8696958
sedi () {
  sed --version >/dev/null 2>&1 && sed -i -- "$@" || sed -i "" "$@"
}

# Rename app bundle
echo "✏️  Please provide the following details:"
if [[ $BUNDLE_IDENTIFIER == "" ]]; then 
	read -p "- Bundle identifier name (e.g. com.acme):  " BUNDLE_IDENTIFIER
fi

if [[ $APP_NAME == "" ]]; then 
	read -p "- The app's name (e.g. MyApp):  " APP_NAME
fi

# Rename default bundle identifier
sedi -E 's/(let bundleID = ")(.*)(")/\1'"$BUNDLE_IDENTIFIER"'\3/g' Tuist/ProjectDescriptionHelpers/ProjectConfiguration.swift
sedi -E 's/(let appName = ")(.*)(")/\1'"$APP_NAME"'\3/g' Tuist/ProjectDescriptionHelpers/ProjectConfiguration.swift

echo "✅ Bundle identifier and app name successfully replaced."





