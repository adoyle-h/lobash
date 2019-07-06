# Category: Console

[⬅️ Back to previous page](./README.md)

## TOC

- [echo](#echo)
- [echo_array](#echo_array)
- [echo_screen](#echo_screen)

## Modules

### echo

- Usage: `l.echo <string>...`
- Description:
  - A easy and safe way to print string. Not support any options.
  - The builtin echo will get unexpected result while execute `b=( -n 123 ); echo "${b[@]}"`.
  - See https://github.com/anordal/shellharden/blob/master/how_to_do_things_safely_in_bash.md#echo--printf
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/echo.bats](../../tests/modules/echo.bats)
- Source Code: [src/modules/echo.bash](../../src/modules/echo.bash)

### echo_array

- Usage: `l.echo_array <array_name>`
- Description: Print each values of array with newline.
- Since: 0.1.0
- Bash: 4.3+
- Status: tested
- Test Cases: [tests/modules/echo_array.bats](../../tests/modules/echo_array.bats)
- Source Code: [src/modules/echo_array.bash](../../src/modules/echo_array.bash)

### echo_screen

- Usage: `l.echo_screen <string>...`
- Description:
  - Similar to l.echo, but always print text to screen no matter redirection.
  - If no screen, it will print nothing.
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/echo_screen.bats](../../tests/modules/echo_screen.bats)
- Source Code: [src/modules/echo_screen.bash](../../src/modules/echo_screen.bash)

[⬆️ Back up to TOC](#toc)
