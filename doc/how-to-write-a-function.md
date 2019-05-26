# How to write a function

## Function Name

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
