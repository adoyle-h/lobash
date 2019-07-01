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
- [FAQ](#faq)
- [Test](#test)
- [Contributions](#contributions)
- [Versioning](#versioning)
- [Copyright and License](#copyright-and-license)
- [References](#references)

<!-- /MarkdownTOC -->

## What is Lobash?

Script script development is complex and fallible. Because the shell script may be interpreted differently with different shells.
And external commands such like BSD and GNU utilities have different options and behaviors although in same command name.

Javascript has a powerful library [Lodash](https://github.com/lodash/lodash) for simplifying development.
So I build Lobash to do similar works for shell development.

Lobash is a library not a command. It provides collections of functions to improve efficiency of shell development,
and make it compatible with Bash 4.4+ and MacOS/Linux/Alpine/Busybox systems.

## Lobash Features

- Modular and easy to use. One module one Function.
- Rich Functions. Over 90+ modules provided.
- Robust and Safe. Over 500+ test cases which tested under MacOS/Linux/Alpine/Busybox systems with Bash.
- Fast. 0.058s to load Lobash completely.

## Build Status

- [Master Branch][]: [![Build Status/master](https://travis-ci.com/adoyle-h/lobash.svg?branch=master)](https://travis-ci.com/adoyle-h/lobash)
- [Develop Branch][]: [![Build Status/test](https://travis-ci.com/adoyle-h/lobash.svg?branch=test)](https://travis-ci.com/adoyle-h/lobash)

## Installation

```sh
# Download source codes
git clone --depth 1 https://github.com/adoyle-h/lobash.git
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

| Supported | Shell    | Version          | Main Reasons                                          |
|:---------:|:---------|:-----------------|:------------------------------------------------------|
|     ✅    | Bash     | v5 and higher    | -                                                     |
|     ✅    | Bash     | v4.4             | -                                                     |
|     🚫    | Zsh      | v5.3 and higher  | Plan to implement it in another project               |
|     🚫    | Bash     | v4.3             | `shopt -s inherit_errexit` is not supported util v4.4 |
|     🚫    | Bash     | v4.0, v4.1, v4.2 | Nameref is not supported util v4.3                    |
|     🚫    | Bash     | v3               | Associative array is not supported until v4.0         |
|     🚫    | POSIX sh | *                | `local` keyword not supported                         |
|     ❔    | Ksh      | *                | No tested                                             |

There is [a list](http://mywiki.wooledge.org/BashFAQ/061) of which features were added to specific releases (versions) of Bash.

Although most Linux distributions use Bash v4.3, you can upgrade Bash easily and it is backward compatible.

### Dependencies

Make sure below dependencies have been installed.

- Linux commands:
  - sed/grep/mktemp/dirname/basename/cd/printf/echo/wc
  - sed: BSD and GNU are both supported

## Usage

### Build your lobash.bash

First, build your own `lobash.bash` file by `./build`.

```sh
./build
# Generated Lobash file: /Users/adoyle/Workspace/Shell/lobash/dist/lobash.bash

# Or build Lobash to specific path
./build <target-path>

# Or build Lobash to specific path and change Lobash function prefix
PREFIX=lobash_ ./build <target-path>
```

When you use Lobash to build a library or framework, it is necessary to set `PREFIX` with unique namespace for avoiding naming collisions.
When you build a command, `PREFIX` is unnecessary.

The `PREFIX` only effect Lobash public functions and variables names.

### Edit your scripts and set shell options

All Lobash modules are written and tested with the shell options:

- `set -o errexit`
- `set -o nounset`
- `set -o pipefail`
- `shopt -s inherit_errexit`

If you do not understand the meanings of these shell options,
please read [this article](https://dougrichardson.org/2018/08/03/fail-fast-bash-scripting.html).

**Lobash not enable these options by default. Make sure the same shell options enabled before call Lobash functions in your scripts. Otherwise there may be unexpected behaviors with it.**

If your develop a Bash script, put below codes in head.

```sh
#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
shopt -s inherit_errexit
```

### Load lobash.bash in your scripts

Second, load your own `lobash.bash` file in your scripts and all Lobash functions will be imported to current shell environment.

```sh
#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
shopt -s inherit_errexit

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

## Module Usages

See [./doc/module-usages.md](./doc/module-usages.md).

## Command

```sh
./bin/lobash mod <module_name> [<module_args>]...
```

The `./bin/lobash` command is only used for certain scenarios.
Many modules not work as command.

## [FAQ](./doc/faq.md)

## Test

Run `./test -d`.

See [./doc/test.md](./doc/test.md) more details.

## Contributions

Contributions are welcomed. Please read [./doc/contribution.md](./doc/contribution.md).

## Versioning

The versioning follows the rules of SemVer 2.0.0.

For more information on SemVer, please visit http://semver.org/ .

## Copyright and License

Copyright 2019 ADoyle (adoyle.h@gmail.com) Some Rights Reserved.

The project is licensed under the **Apache License Version 2.0**.

See the [LICENSE][] file for the specific language governing permissions and limitations under the License.

See the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.

## References

- [pure-bash-bible](https://github.com/dylanaraps/pure-bash-bible)
- https://www.gnu.org/software/bash/manual/
- http://mywiki.wooledge.org/BashFAQ

<!-- Links -->

[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE
[Master Branch]: https://github.com/adoyle-h/lobash/tree/master
[Develop Branch]: https://github.com/adoyle-h/lobash/tree/develop
