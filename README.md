<p align="center">
  <img alt="Lobash Logo" src="./docs/imgs/lobash.svg">
</p>
<p align="center">
  A modern, safe, powerful utility/library for Bash script development.
</p>

中文文档 [./README.zh.md](./README.zh.md)

## What is Lobash?

Due to its complex syntaxes and symbols, and Unix commands different options and behaviors in same name (such like GNU `sed` and BSD `sed` are different),
Bash script development is complex and fallible.

Javascript has a powerful library [Lodash](https://github.com/lodash/lodash) for simplifying development.
So I build Lobash to do similar works for shell development.

Lobash provides collections of functions to improve efficiency of shell development.
It is compatible with Bash 4.0+ and MacOS/Linux/Alpine/Busybox systems.

It is implemented with pure bash script. (Except [l.now](src/modules/now.bash) function. It uses perl functions.)

## Features

- Modular and easy to use. One module one Function.
- Semantic functions instead of recondite bash expressions, substitutions, expansions.
- Rich Functions. Over [120+ modules][module-usages] provided.
  - 15 Categories: Arithmetic, Array, Color, Condition, Console, Debug, File, Path, Prompt, String, System, Terminal, Time, Util, Variable.
  - Each function is [documented][module-usages].
- Robust and Safe. Over [700+ test cases](./tests/modules/) passed in [Github Actions](https://github.com/adoyle-h/lobash/actions).
- Fast. 0.058s to load Lobash completely.
- Compatible with MacOS/Linux/Alpine/Busybox systems.
- Compatible with Bash 4.0 and higher versions.

## CI Status

- [develop branch](https://github.com/adoyle-h/lobash/tree/develop): [![CI Status](https://github.com/adoyle-h/lobash/actions/workflows/ci.yaml/badge.svg?branch=develop)](https://github.com/adoyle-h/lobash/actions/workflows/ci.yaml?query=branch%3Adevelop)
- [v0.5.0](https://github.com/adoyle-h/lobash/tree/v0.5.0): [![CI Status](https://github.com/adoyle-h/lobash/actions/workflows/ci.yaml/badge.svg?tag=v0.5.0)](https://github.com/adoyle-h/lobash/actions/workflows/ci.yaml?query=tag%3Av0.5.0)
- [v0.4.0](https://github.com/adoyle-h/lobash/tree/v0.4.0): [![CI Status](https://github.com/adoyle-h/lobash/actions/workflows/ci.yaml/badge.svg?tag=v0.4.0)](https://github.com/adoyle-h/lobash/actions/workflows/ci.yaml?query=tag%3Av0.4.0)

## [ChangeLog](./CHANGELOG.md)

## [FAQ](./docs/faq.md)

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

| Supported | Shell    | Version       | Descriptions                                  |
|:---------:|:---------|:--------------|:----------------------------------------------|
|     ✅    | Bash     | v5 and higher | Completely supported                          |
|     ✅    | Bash     | v4.4          | Completely supported                          |
|    ✅💬   | Bash     | v4.3          | -                                             |
|    ✅💬   | Bash     | v4.2          | -                                             |
|    ✅💬   | Bash     | v4.1          | -                                             |
|    ✅💬   | Bash     | v4.0          | -                                             |
|     🚫    | Bash     | v3            | Associative array is not supported until v4.0 |
|     🚫    | POSIX sh | *             | `local` keyword not supported                 |
|     🚫    | Zsh      | *             | -                                             |
|     🚫    | Fish     | *             | -                                             |

Most Lobash modules support Bash 4.0 and higher versions. Some modules are not compatible with Bash version earlier than 4.4. See the [list](./docs/module-usages/README.md#not-compatible).
Each module annotates a `Bash` label in [module usages][module-usages].
`Bash: 4.2+` means compatible with Bash 4.2 and higher versions.

✅💬 means Lobash is compatible but not all modules supported in shell.
It will print notes to show what modules is not supported and ignored when building Lobash.

**If you use Lobash with Bash 4.0~4.3. Please read [./docs/with-lower-version-bash.md](./docs/with-lower-version-bash.md) first.**

**Lobash not test with Bash 4.0 in MacOS. It seems a bug of Bash 4.0 in MacOS. Please contact me if you solved this problem.** Read [this document](./docs/with-lower-version-bash.md#not-test-with-bash-40-in-macos).

Although most Linux distributions use Bash v4.3 at the least, and MacOS installed Bash v3.2 by default,
it is easily to upgrade Bash 4.4+ in most systems.

### Dependencies

Make sure below dependencies have been installed in your system.

- Linux commands:
  - sed/grep/mktemp/dirname/basename/cd/printf/echo/wc
  - sed: BSD and GNU are both compatible with Lobash

## Installation

Available Lobash versions refer to [Git Tags](https://github.com/adoyle-h/lobash/tags) which named like "vX.Y.Z".

```sh
VERSION=v0.5.0  # or VERSION=develop
# Download source codes
git clone --depth 1 --branch $VERSION https://github.com/adoyle-h/lobash.git
cd lobash
# This step is optional. Clone submodules only if you want to run test cases.
git submodule update --init --recursive --progress

# Copy it to somewhere in your path
sudo ln -s "$PWD/build" /usr/local/bin/lobash-gen
```

## Usage

`lobash-gen -h` show help.

### Build your lobash.bash

First, build your own `lobash.bash` file by `lobash-gen`.

```sh
# Interactive build process, import all Lobash modules
lobash-gen
# Generated file: <lobash-dir>/lobash.bash

# Or build Lobash to specific path
lobash-gen <target-path>
# Generated file: <target-path>
```

**Read [./docs/build.md](./docs/build.md) for more details.**

### Edit your scripts and set shell options

All Lobash modules are written and tested with the shell options:

- `set -o errexit`
- `set -o nounset`
- `set -o pipefail`
- `shopt -s inherit_errexit` (`inherit_errexit` is a new feature in Bash v4.4)

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
set -o errtrace  # You can remove this line if you do not use l.trap_error.
(shopt -p inherit_errexit &>/dev/null) && shopt -s inherit_errexit

# It will load all Lobash modules
source <path-to-lobash.bash>
# Call l.<module_name> when "lobash-gen"
l.ask 'Hello Lobash?'

# Call lobash.<module_name> when "lobash-gen -p lobash_"
# lobash_ask 'Hello Lobash?'
```

Load `lobash.bash` is fast, nearly 0.058s in fact.

```sh
time source ./dist/lobash.bash

real    0m0.058s
user    0m0.022s
sys     0m0.036s
```

### Module Usages and Documents

Read all module usages in [./docs/module-usages/][module-usages].

Read all module examples in [./example/modules](./example/modules) and [test cases](./tests/modules).

Available modules list in [config.example](./config.example).

## Advanced Usages

### lobash-gen -c config

`lobash-gen` will export all modules by default. You can export specific modules with `-c <config>` option.

You can also set `PREFIX`, `BASH_MIN_VERSION` in config.

```sh
cp config.example config
# The "config" file is ignored by git

# Edit config
lobash-gen -c ./config
```

### [Command](./docs/lobash-command.md)

## Who use Lobash

- [adoyle-h/one.bash](https://github.com/adoyle-h/one.bash)
- Contact me to add your project to list.

## Related Projects

- [shell-general-colors](https://github.com/adoyle-h/shell-general-colors): shell colors
- [bats-core](https://github.com/bats-core/bats-core): test framework
- [Other shell projects](https://github.com/adoyle-h?tab=repositories&q=&type=source&language=shell&sort=stargazers) created by me.

## References

- [pure-bash-bible](https://github.com/dylanaraps/pure-bash-bible)
- https://www.gnu.org/software/bash/manual/
- http://mywiki.wooledge.org/BashFAQ

## [Test](./docs/test.md)

## Suggestion, Bug Reporting, Contributing

Any comments and suggestions are always welcome.

**Before open an issue/discussion/PR, You should search related issues/discussions/PRs first** for avoiding to create duplicated links.

- For new feature request, open a [discussion][], describe your demand concisely and clearly.
- For new feature submit, open a [PR][], describe your demand and design concisely and clearly.
- For bug report, open an [issue][], describe the bug concisely and clearly.
- For bug fix, open a [PR][], concisely and clearly describe what you fixed.
- For question and suggestion, open a [discussion][].
- For anything not mentioned above, open a [discussion][].

Do not post duplicated and useless contents like `+1`, `LOL`. React to comments with emoji instead of.

你可以使用中文反馈意见。但希望你尽可能使用英文，不要中英文混杂，而是写下完整的英文语句。
因为我们处于国际社区，英文更通用，方便外国人阅读理解你的意见。
(Please communicate in English as much as possible)

Please read [./docs/CONTRIBUTING.md](./docs/CONTRIBUTING.md) before make a Pull Request.

## Versions

Read [tags][].
The versions follows the rules of [SemVer 2.0.0](http://semver.org/).

## Copyright and License

Copyright 2019-2022 ADoyle (adoyle.h@gmail.com) Some Rights Reserved.
The project is licensed under the **Apache License Version 2.0**.

Read the [LICENSE][] file for the specific language governing permissions and limitations under the License.

Read the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.


<!-- Links -->

[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE
[tags]: https://github.com/adoyle-h/lobash/tags
[issue]: https://github.com/adoyle-h/lobash/issues
[discussion]: https://github.com/adoyle-h/lobash/discussions
[PR]: https://github.com/adoyle-h/lobash/pulls

[Master Branch]: https://github.com/adoyle-h/lobash/tree/master
[Develop Branch]: https://github.com/adoyle-h/lobash/tree/develop
[travis repo]: https://travis-ci.com/adoyle-h/lobash
[module-usages]: ./docs/module-usages/README.md
