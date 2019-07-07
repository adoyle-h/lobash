# How to write functions

## TOC

<!-- MarkdownTOC GFM -->

- [Function Name](#function-name)
- [How to return a Boolean value](#how-to-return-a-boolean-value)
- [Use external command](#use-external-command)
    - [Notice the differences between BSD sed and GNU sed.](#notice-the-differences-between-bsd-sed-and-gnu-sed)
- [Prefer printf than echo](#prefer-printf-than-echo)

<!-- /MarkdownTOC -->

## Function Name

Must match the regexp `[_a-zA-Z0-9]+\.bash`

## How to return a Boolean value

There are two ways:

1. Indicate `true` or `false` by `echo true` or `false`.
2. Indicate `true` or `false` by `return 0` or `return 1`.

The meaning of return code from shell function or command is defined in [Bash Manual](https://www.gnu.org/software/bash/manual/bash.html#index-return):

> return [n]
>
> Cause a shell function to stop executing and return the value n to its caller. If n is not supplied, the return value is the exit status of the last command executed in the function.

The way 2 cannot distinguish the `false` and the exception occurs in function (it will return other codes if your shell has `set -o errexit` and `set -o pipefail`).
So the choice 1 is better.

References:

- https://stackoverflow.com/a/43840545/4622308

## Use external command

### Notice the differences between BSD sed and GNU sed.

- Group capturing is different. `\0` in GNU and `&` in BSD.
- `\w` in GNU and [`[[:alnum:]]`](https://www.freebsd.org/cgi/man.cgi?query=re_format&sektion=7&apropos=0&manpath=FreeBSD+12.0-RELEASE+and+Ports) in BSD.
- sed command options are different.

## Prefer printf than echo

Use `printf '%s\n' 'hello world'` not `echo 'hello world'`
