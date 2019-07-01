# Differences between Bash and Zsh

## export -f is not supported in Zsh

There is no equivalent for `export -f` in Zsh.

## path is interrelated to PATH in Zsh

```zsh
path=123
echo $PATH
# => 123
```

Do not use `path` variable in Zsh.

## read -a is not supported in Zsh

The equivalent of `read -a var <<<'string'` is `read -A var <<<'string'` in Zsh.

## read -p is not supported in Zsh

https://superuser.com/a/556006

## ${!var} is not supported in Zsh

The equivalent of `${!var}` is `${(P)var}` in Zsh.

## The array index starts from 1 in Zsh, and 0 in Bash

> Virtually all shell arrays (Bourne, csh, tcsh, fish, rc, es, yash) start at 1. ksh is the only exception that I know (bash just copied ksh).

https://unix.stackexchange.com/questions/252368/is-there-a-reason-why-the-first-element-of-a-zsh-array-is-indexed-by-1-instead-o

## local -n not supported in Zsh

The equivalent of `local -n var=$1` is `local var=${(e)1}` in Zsh.
