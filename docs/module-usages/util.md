# Category: Util

[⬅️ Back to previous page](./README.md)

## TOC

- [benchmark](#benchmark)
- [compose](#compose)
- [parse_args](#parse_args)
- [parse_params](#parse_params)
- [repeat](#repeat)
- [sedi](#sedi)
- [trap_error](#trap_error)
- [with_ifs](#with_ifs)

## Modules

### benchmark

- Usage: `l.benchmark <command> [<repeats>=10]`
- Description: Run command in repeats to get benchmarks.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/benchmark.bats](../../tests/modules/benchmark.bats)
- Source Code: [src/modules/benchmark.bash](../../src/modules/benchmark.bash)

### compose

- Usage: `l.compose [<function_name_or_string>]...`
- Description: Function composition
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/compose.bats](../../tests/modules/compose.bats)
- Source Code: [src/modules/compose.bash](../../src/modules/compose.bash)

### parse_args

- Usage: `l.parse_args <definition> "$@"`
- Description:
  - This function provides a simple way to parse options and arguments.
  - The `<definition>` is an associative array, which likes `{[opts]=opts_name [args]=args_name ['-f --flag']='bool'}`.
  - The `[opts]` and `[args]` are required for `<definition>`.
  - It parses all parameters "$@". Put arguments to the `args_name` and options to `opts_name`.
  - The `opts_name` must be an associative array or `_`. If set `_`, the options will be ignored.
  - The `args_name` must be an array or `_`. If set `_`, the arguments will be ignored.
  - The option has tree types:
  -   - "bool": For example, `-f`, `--flag` means `${f}` and `${flag}` equal to `"true"` and `--no-f` and `--no-flag` equal to `"false"`.
  -   - "count": the value of option defaults to 0. And increasing count by times. For example: `-v` `-vv` `-vvv`.
  -   - "kv": key/value. It means the option must has an argument. If user not pass argument to "kv" option. It will print error and stop.
  - All options are default to "kv". So only the bool and count options should defined in `<definition>`. The "kv" option definition is not required.
  - See Test Cases and Example for details.
- Dependent: [`each`](./array.md#each) [`match_list`](./string.md#match_list) [`var_attrs`](./variable.md#var_attrs) [`array_has_key`](./array.md#array_has_key)
- Since: 0.7.0
- Bash: 4.0+
- **Notice**: **Only with bash 4.3, there may be something wrong if opts and args are not array.**
- Test Cases: [tests/modules/parse_args.bats](../../tests/modules/parse_args.bats)
- Source Code: [src/modules/parse_args.bash](../../src/modules/parse_args.bash)
- Example: [example/modules/parse_args](../../example/modules/parse_args)

### parse_params

- Usage:
  - `l.parse_params <opts_name> <args_name> "$@"`
  - `l.parse_params _ <args_name> "$@"`
  - `l.parse_params <opts_name> _ "$@"`
- Description:
  - It parses all parameters "$@" and put arguments to `args_name` and
  - `opts_name` must be an associative array or `_`. If `_`, no options will be parsed.
  - `args_name` must be an array or `_`. If `_`, no arguments will be parsed.
  - See test cases for details.
- Dependent: [`start_with`](./condition.md#start_with) [`match`](./string.md#match) [`match_list`](./string.md#match_list)
- Deprecated: true
- Since: 0.4.0
- Bash: 4.0+
- Test Cases: [tests/modules/parse_params.bats](../../tests/modules/parse_params.bats)
- Source Code: [src/modules/parse_params.bash](../../src/modules/parse_params.bash)
- Example: [example/modules/parse_params](../../example/modules/parse_params)

### repeat

- Usage: `l.repeat <N> <command_name> [<command_args>]...`
- Description: Execute command in N times.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/repeat.bats](../../tests/modules/repeat.bats)
- Source Code: [src/modules/repeat.bash](../../src/modules/repeat.bash)

### sedi

- Usage: `l.sedi <sed-command>... <file>`
- Description:
  - Wrap "sed -i". Compatible with GNU sed and BSD sed.
  - The usage refer to `man sed`.
- Since: 0.6.0
- Bash: 4.0+
- Test Cases: [tests/modules/sedi.bats](../../tests/modules/sedi.bats)
- Source Code: [src/modules/sedi.bash](../../src/modules/sedi.bash)

### trap_error

- Usage: `l.trap_error [trap_handler=_l.trap_error]`
- Description:
  - Show error line number of file when program exited by error.
  - Make sure `set -o errtrace` and `set -o errexit` before using l.trap_error.
  - You can change trap handler to your own function.
- Since: 0.5.0
- Bash: 4.0+
- Test Cases: [tests/modules/trap_error.bats](../../tests/modules/trap_error.bats)
- Source Code: [src/modules/trap_error.bash](../../src/modules/trap_error.bash)
- Example: [example/modules/trap_error](../../example/modules/trap_error)

### with_ifs

- Usage: `l.with_IFS <IFS> <command_string>`
- Description: run `<command_string>` with `<IFS>` effects
- Since: 0.2.0
- Bash: 4.0+
- Test Cases: [tests/modules/with_ifs.bats](../../tests/modules/with_ifs.bats)
- Source Code: [src/modules/with_ifs.bash](../../src/modules/with_ifs.bash)

[⬆️ Back up to TOC](#toc)
