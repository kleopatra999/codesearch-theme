#!/bin/bash
./build.sh || exit 1
version=$(python reversion.py manifest.json)
git add less js && git add -u &&
  git commit && \
  git tag v"$version" -m "Release version: $version" && \
	git push origin master && \
  zip codesearch-theme.zip *.json *.html js/*.js css/*.css themes-icon.png
echo "Release v. $version is ready"
exit 0
