# FAQ

## TOC

<!-- MarkdownTOC GFM -->

- [Why not support other shells?](#why-not-support-other-shells)
    - [Why not support Zsh?](#why-not-support-zsh)
- [Why not support Windows system?](#why-not-support-windows-system)
- [Why ./bin/lobash mod not always work?](#why-binlobash-mod-not-always-work)
- [Why source script, not execute command?](#why-source-script-not-execute-command)
- [Bash is outdated!](#bash-is-outdated)
- [What is the different between echo true/false and return 0/1?](#what-is-the-different-between-echo-truefalse-and-return-01)

<!-- /MarkdownTOC -->


## Why not support other shells?

Ash/Dash/Fish/Tcsh/Xiki and other shells are not supported because there are so many differences with Bash.
It is too complex to be compatible with other shells, and benefit limited.

References:

- http://hyperpolyglot.org/unix-shells

### Why not support Zsh?

Although Bash and Zsh are the most prevalent shells in the world
and they have similar shell script syntaxes,
their builtin commands have many differences.
See [Differences between Bash and Zsh](./differences-between-bash-and-zsh.md).

So I think it is better to implement Zsh library in another project.

## Why not support Windows system?

It is too complex to be compatible with it, and benefit limited.

## Why ./bin/lobash mod not always work?

Many Lobash modules are dependent on variables in current shell environment which are not shareable in sub-shell environments.
And the `nameref` feature not work as command arguments.

It creates new sub-shell when invoke `./bin/lobash`. So many Lobash modules will not work.

## Why source script, not execute command?

Read [this answer](https://superuser.com/q/176783) to know the difference between executing and sourcing of scripts.

## Bash is outdated!

No. I have found that most Linux distributions still use Bash as default/login shells.

- Alpine/Busybox uses **Ash**.
- FreeBSD uses **Tcsh 6**.
  - https://www.freebsd.org/doc/en_US.ISO8859-1/articles/linux-users/shells.html
- PfSense uses **Tcsh 6**
- MacOS (since MacOS Catalina) uses **Zsh**.
- MacOS (before MacOS Catalina) uses **Bash 3**.
- Fedora uses **Bash 4**.
  - https://fedoramagazine.org/set-zsh-fedora-system/
- Solaris uses **Bash 4**.
  - https://docs.oracle.com/cd/E19455-01/805-6331/6j5vgg67n/index.html
- Debian (Ubuntu and Linux Mint) uses **Bash 4** as login shell.
  - https://wiki.ubuntu.com/ChangingShells
  - > Bash continues to be used as the default interactive/login shell for users, but Dash is the one at /bin/sh and the one which is executed for system scripts such as init scripts.
  - See these interesting stories about Bash and Dash: https://askubuntu.com/a/976504 and https://askubuntu.com/a/976499
- Red Hat uses **Bash 4**.
- CentOS 7 uses **Bash 4**.
- Opensuse 13 uses **Bash 4**.

Although most Linux distributions use Bash v4.3, you can upgrade Bash easily and it is backward compatible.

## What is the different between echo true/false and return 0/1?

Read this document: [How to return a Boolean value](https://github.com/adoyle-h/lobash/blob/develop/doc/how-to-write-functions.md#how-to-return-a-boolean-value).

Because we set the `set -o errexit` and `shopt -s inherit_errexit`, `l.is_*` will lead to process exit. For example,

```sh
#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
shopt -s inherit_errexit

local r
# l.is_file will return 1 and lead to process exit
r=$(l.is_file wow)
echo "r=$r"
```

All Lobash Condition modules are robust enough. It provides two implements for different usages.

So use l.is_file.s instead.

```sh
#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
shopt -s inherit_errexit

local r
r=$(l.is_file.s wow)
# process will go on
echo "r=$r"
```

The right way to use `l.is_*` is in if condition.

```sh
#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
shopt -s inherit_errexit

if l.is_file wow; then
  echo "Is file"
else
  echo "Not file"
fi
```
