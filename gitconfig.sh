#!/bin/sh
git config --local commit.gpgsign true # sign all commits
git config --local tag.gpgsign true # sign all tags
git config --local gpg.x509.program gitsign # use gitsign for signing
git config --local gpg.format x509 # gitsign expects x509 args

# git commit -S
# git verify-commit HEAD #verify the lastcommit
# Check your signed commits in: https://rekor.tlog.dev/
