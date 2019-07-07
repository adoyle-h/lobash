# Category: Util

[⬅️ Back to previous page](./README.md)

## TOC

- [benchmark](#benchmark)
- [compose](#compose)
- [repeat](#repeat)
- [with_ifs](#with_ifs)

## Modules

### benchmark

- Usage: `l.benchmark <command> [<repeats>=10]`
- Description: Run command in repeats to get benchmarks.
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/benchmark.bats](../../tests/modules/benchmark.bats)
- Source Code: [src/modules/benchmark.bash](../../src/modules/benchmark.bash)

### compose

- Usage: `l.compose [<function_name_or_string>]...`
- Description: Function composition
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/compose.bats](../../tests/modules/compose.bats)
- Source Code: [src/modules/compose.bash](../../src/modules/compose.bash)

### repeat

- Usage: `l.repeat <N> <command_name> [<command_args>]...`
- Description: Execute command in N times.
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/repeat.bats](../../tests/modules/repeat.bats)
- Source Code: [src/modules/repeat.bash](../../src/modules/repeat.bash)

### with_ifs

- Usage: `l.with_IFS <IFS> <command_string>`
- Description: run `<command_string>` with `<IFS>` effects
- Since: 0.2.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/with_ifs.bats](../../tests/modules/with_ifs.bats)
- Source Code: [src/modules/with_ifs.bash](../../src/modules/with_ifs.bash)

[⬆️ Back up to TOC](#toc)
