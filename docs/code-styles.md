# Code Styles

## First of all

- Your IDE must support [editorconfig](http://editorconfig.org/) and recognize the `.editorconfig` file in project.
- [Shellcheck](https://github.com/koalaman/shellcheck) must be installed, and your IDE supports it.

## Indentation

- `.bats`, `.bash` files: Indent 2 spaces. No tabs.
- Dockerfile: Indent 4 spaces. No tabs.

## File naming

All file names must match the regex `[a-z0-9-_]`, except `Dockerfile` and other particular files.

## File Header

### module

No file header.

### .bats

```bats
#!/usr/bin/env bats
```

## Shell script code styles

- `[[ ... ]]` is preferred over `[ ... ]`, `test` and `/usr/bin/[`.
- Function declaration `func() {...}` is preferred over `function func() {...}`.
- Read-only Variables. Use `readonly` or `declare -r` to ensure they're read only.
- Local Variables. Declare function-specific variables with `local`. Declaration and assignment should be on different lines.
- Use `$(command)` instead of backticks.
- `eval` should be avoided in most scenarios.
- Constants and environment variable names must be all caps, separated with underscores.
