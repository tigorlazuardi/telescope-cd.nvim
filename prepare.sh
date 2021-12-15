#!/bin/bash
set -e

if ! command -v lefthook &>/dev/null; then
	go install github.com/evilmartians/lefthook@latest
fi

if ! command -v mockery &>/dev/null; then
	go install github.com/vektra/mockery/v2@latest
fi

if ! command -v git-chglog &>/dev/null; then
	go install github.com/git-chglog/git-chglog/cmd/git-chglog@latest
fi

if ! command -v golangci-lint &>/dev/null; then
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.43.0
fi

lefthook install

# remove CHANGELOG.md from gitignore
sed -i '' -e 's#CHANGELOG.md##' .gitignore
git add .gitignore
LEFTHOOK=0 git commit -m "prepared repository"
