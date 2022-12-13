# Publish

1. Run `./tools/gen`. Commit and push to github.
2. Run the CI. Check the results. If failed, fix it.
3. Run `./tools/bump <major|minor|patch>`. Edit changelog. Commit and push to github.
4. `git tag v$(cat ./version)` and `git push --tags`.
