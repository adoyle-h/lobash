<p align="center">
  <img alt="Lobash Logo" src="./doc/imgs/lobash.svg">
</p>
<p align="center">
  A modern, safe, powerful utility library for Bash script development.
</p>

## TOC

<!-- MarkdownTOC GFM -->

- [What is Lobash?](#what-is-lobash)
- [Lobash Features](#lobash-features)
- [Build Status](#build-status)
- [ChangeLog](#changelog)
- [Installation](#installation)
- [Prerequisites](#prerequisites)
    - [Supported Platform](#supported-platform)
    - [Supported Shells](#supported-shells)
    - [Dependencies](#dependencies)
- [Usage](#usage)
    - [Build your lobash.bash](#build-your-lobashbash)
    - [Edit your scripts and set shell options](#edit-your-scripts-and-set-shell-options)
    - [Load lobash.bash in your scripts](#load-lobashbash-in-your-scripts)
    - [Module Usages](#module-usages)
- [Command](#command)
    - [lobash meta](#lobash-meta)
    - [lobash mod](#lobash-mod)
- [FAQ](#faq)
- [Who use Lobash](#who-use-lobash)
- [Related Projects](#related-projects)
- [References](#references)
- [Test](#test)
- [Contributions](#contributions)
- [Versioning](#versioning)
- [Copyright and License](#copyright-and-license)

<!-- /MarkdownTOC -->

## What is Lobash?

Due to its complex syntaxes with symbols, and Unix commands are different in platforms such like BSD and GNU utilities
have different options and behaviors with same command name,
Bash script development is complex and fallible.

Javascript has a powerful library [Lodash](https://github.com/lodash/lodash) for simplifying development.
So I build Lobash to do similar works for shell development.

Lobash is a library not a command. It provides collections of functions to improve efficiency of shell development,
and make it compatible with Bash 4.0+ and MacOS/Linux/Alpine/Busybox systems.

## Lobash Features

- Modular and easy to use. One module one Function.
- Rich Functions. Over 90+ modules provided.
- Robust and Safe. Over 500+ test cases tested.
- Fast. 0.058s to load Lobash completely.
- Compatible with MacOS/Linux/Alpine/Busybox systems.
- Compatible with Bash 4.0 and higher versions.

## Build Status

- [Test Branch](https://github.com/adoyle-h/lobash/tree/test): [![Build Status](https://travis-ci.com/adoyle-h/lobash.svg?branch=test)][travis repo]
- [v0.1.0](https://github.com/adoyle-h/lobash/tree/v0.1.0): [![Build Status](https://travis-ci.com/adoyle-h/lobash.svg?tag=v0.1.0)][travis repo]

## [ChangeLog](./CHANGELOG.md)

## Installation

```sh
VERSION=v0.1.0
# Download source codes
git clone --depth 1 --branch $VERSION https://github.com/adoyle-h/lobash.git
cd lobash
# This step is optional. Clone submodules only if you want to run test cases.
git submodule update --init --recursive
```

## Prerequisites

### Supported Platform

| Supported | Platform | Version | Main Reasons                       |
|:---------:|:---------|:--------|:-----------------------------------|
|     ✅    | MacOS    | *       | -                                  |
|     ✅    | Linux    | *       | -                                  |
|     ✅    | Busybox  | *       | -                                  |
|     ✅    | Alpine   | *       | -                                  |
|     ❔    | BSD      | -       | Not tested yet. Maybe not support. |
|     🚫    | Windows  | -       | Never and ever supported.          |

### Supported Shells

| Supported | Shell    | Version       | Main Reasons                                            |
|:---------:|:---------|:--------------|:--------------------------------------------------------|
|     ✅    | Bash     | v5 and higher | Completely Supported                                    |
|     ✅    | Bash     | v4.4          | Completely Supported                                    |
|    ✅💬   | Bash     | v4.3          | `shopt -s inherit_errexit` is not supported util v4.4   |
|    ✅💬   | Bash     | v4.2          | `Nameref` is not supported util v4.3                    |
|    ✅💬   | Bash     | v4.1          | `declare -g` not support util v4.2                      |
|    ✅💬   | Bash     | v4.0          | `exec {_sleep_fd}<> <(true)` is not supported util v4.1 |
|     🚫    | Bash     | v3            | Associative array is not supported until v4.0           |
|     🚫    | POSIX sh | *             | `local` keyword not supported                           |
|     🚫    | Zsh      | *             | Plan to implement it in another project                 |
|     ❔    | Ksh      | *             | No tested                                               |

✅💬 means Lobash can be used but not all features supported in shell.
**If you want use Lobash with Bash 4.3 and lower versions.**
**Please read [./doc/with-lower-version-bash.md](./doc/with-lower-version-bash.md) for details.**

There is [a list](http://mywiki.wooledge.org/BashFAQ/061) of which features were added to specific releases (versions) of Bash.

Although most Linux distributions use Bash v4.3, and MacOS not installed Bash v4 by default,
it is easily to upgrade Bash 4.4+ in most systems.

### Dependencies

Make sure below dependencies have been installed.

- Linux commands:
  - sed/grep/mktemp/dirname/basename/cd/printf/echo/wc
  - sed: BSD and GNU are both supported

## Usage

### Build your lobash.bash

First, build your own `lobash.bash` file by `./build`.

```sh
# Interactive build process
./build
# Generated Lobash file: <lobash-dir>/dist/lobash.bash

# Or build Lobash to specific path
./build <target-path>
```

See [./doc/build.md](./doc/build.md) for more details.

### Edit your scripts and set shell options

All Lobash modules are written and tested with the shell options:

- `set -o errexit`
- `set -o nounset`
- `set -o pipefail`
- `shopt -s inherit_errexit`

If you do not understand the meanings of these shell options,
please read [this article](https://dougrichardson.org/2018/08/03/fail-fast-bash-scripting.html).

**Lobash not enable these options by default. Make sure the same shell options enabled before call Lobash functions in your scripts. Otherwise there may be unexpected behaviors with it.**

### Load lobash.bash in your scripts

Second, load your own `lobash.bash` file in your scripts and all Lobash functions will be imported to current shell environment.

```sh
#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
(shopt -p inherit_errexit &>/dev/null) && shopt -s inherit_errexit

# It will load all Lobash modules
source <path-to-lobash.bash>
# Call l.<module_name> when PREFIX not set when building.
l.ask 'Hello Lobash?'

# Call <PREFIX>.<module_name> when PREFIX=lobash_ set
# lobash_ask 'Hello Lobash?'
```

Load `lobash.bash` is fast, nearly 0.058s in fact.

```sh
time source ./dist/lobash.bash

real    0m0.058s
user    0m0.022s
sys     0m0.036s
```

### Module Usages

See all module usages in [./doc/module-usages/](./doc/module-usages/README.md)

## Command

While Lobash is a library for development, it also provides a command `./bin/lobash`.

Enter `./bin/lobash` show help.

```sh
> ./bin/lobash

Usage:
  lobash [help|-h|--help]
  lobash mod <module_name> [<sub_command_args>]...
  lobash meta

Sub-Command:
  help       Show help
  mod        Invoke a Lobash module
  mods       Show available module names
  meta       Query metadatas of Lobash module
  github     Open Lobash github page in your browser

Description:
The "lobash mod" command is only used for certain scenarios. Many modules not work as command.
```

### lobash meta

```sh
> ./bin/lobash meta ask
Module: ask
Category: Prompt
Since: 0.1.0
Usage: l.ask <message> [<default>=Y]
Description: When default=N, if will return NO by default.
Dependent: lower_case
Deprecated: false
Bash: 4.0
Status: tested

> ./bin/lobash meta normalize
Module: normalize
Category: Path
Since: 0.1.0
Usage: l.normalize <path>
Description: Trailing `/` always be removed.
Dependent: split, join
Deprecated: false
Bash: 4.3
Status: tested
```

### lobash mod

Note: The "lobash mod" command is only used for certain scenarios. Many modules not work as command.

```sh
> ./bin/lobash mod ask 'Is it OK?'
Is it OK? ([Y]es/No)
YES
```

## [FAQ](./doc/faq.md)

## Who use Lobash

- [adoyle-h/dotfiles](https://github.com/adoyle-h/dotfiles)
- Contact me to add your project to list.

## Related Projects

- [shell-general-colors](https://github.com/adoyle-h/shell-general-colors): shell colors
- [bats-core](https://github.com/bats-core/bats-core): test framework

## References

- [pure-bash-bible](https://github.com/dylanaraps/pure-bash-bible)
- https://www.gnu.org/software/bash/manual/
- http://mywiki.wooledge.org/BashFAQ

## Test

See [./doc/test.md](./doc/test.md) more details.

## Contributions

Any suggestions and contributions are always welcome. Please open an [issue][] to talk with me.

Please read [./doc/contribution.md](./doc/contribution.md) before make a Pull Request.

## Versioning

The versioning follows the rules of SemVer 2.0.0.

For more information on SemVer, please visit http://semver.org/ .

## Copyright and License

Copyright 2019 ADoyle (adoyle.h@gmail.com) Some Rights Reserved.

The project is licensed under the **Apache License Version 2.0**.

See the [LICENSE][] file for the specific language governing permissions and limitations under the License.

See the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.


<!-- Links -->

[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE
[issue]: https://github.com/adoyle-h/dotfiles/issues
[Master Branch]: https://github.com/adoyle-h/lobash/tree/master
[Develop Branch]: https://github.com/adoyle-h/lobash/tree/develop
[travis repo]: https://travis-ci.com/adoyle-h/lobash
