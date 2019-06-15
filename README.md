<p align="center">
  <img alt="Lobash Logo" src="./doc/imgs/lobash.svg">
</p>
<p align="center">
  A modern, safe, powerful utility library for Bash script development.
</p>

**Current project is under development, most APIs are unstable. It will get done soon. Welcome to make contributions.**

[![Build Status](https://travis-ci.org/adoyle-h/lobash.svg?branch=master)](https://travis-ci.org/adoyle-h/lobash)

## TOC

<!-- MarkdownTOC GFM -->

- [What is Lobash?](#what-is-lobash)
- [Installation](#installation)
- [Prerequisites](#prerequisites)
    - [Supported Platform](#supported-platform)
    - [Supported Shells](#supported-shells)
    - [Dependencies](#dependencies)
- [Usage](#usage)
    - [Module Usages](#module-usages)
    - [Import specific modules](#import-specific-modules)
    - [Import modules by categories](#import-modules-by-categories)
    - [Import all modules](#import-all-modules)
    - [Custom import function prefix](#custom-import-function-prefix)
    - [Use Command](#use-command)
- [Debug](#debug)
- [FAQ](#faq)
- [Contributions](#contributions)
- [Versioning](#versioning)
- [Copyright and License](#copyright-and-license)
- [References](#references)

<!-- /MarkdownTOC -->

## What is Lobash?

Javascript has a powerful library [Lodash](https://github.com/lodash/lodash).
Bash script development is complex and fallible.
So I write Lobash with pure Bash script for enhancing development efficiency.

Lobash is a library not command. You should `source ./src/import.bash` to use Lobash.
It provides a `import` function to import Lobash modules (functions) .

Lobash Features:

- Modular
- Easy to use
- Rich Functions
- Robustness and Safe

## Installation

```sh
# Download source codes
git clone --depth 1 https://github.com/adoyle-h/lobash.git
# This step is optional. Clone submodules only if you want to run test cases.
git submodule update --init --recursive
```

## Prerequisites

1. All modules are written and tested with the shell options: `set -o errexit`, `set -o pipefail` and `shopt -s inherit_errexit`. Lobash not enable these options. Make sure the same shell options enabled by yourself, otherwise there may be unexpected behaviors with Lobash.
2. Run Lobash modules in the shell from [Supported Shells List](#supported-shells).
3. Make sure [dependencies](#dependencies) installed.

### Supported Platform

| Supported | Platform | Version | Main Reasons                       |
|:---------:|:---------|:--------|:-----------------------------------|
|     ✅    | MacOS    | *       | -                                  |
|     ✅    | Linux    | *       | -                                  |
|     ❔    | BSD      | -       | Not tested yet. Maybe not support. |
|     🚫    | Windows  | -       | Never and ever supported.          |

### Supported Shells

| Supported | Shell    | Version          | Main Reasons                                       |
|:---------:|:---------|:-----------------|:---------------------------------------------------|
|     ❔    | Zsh      | v5 and higher    | Coming soon. Under compatible testing.             |
|     ❔    | Bash     | v5 and higher    | Not tested yet.                                    |
|     ✅    | Bash     | v4.4             | -                                                  |
|     🚫    | Bash     | v4.3             | `shopt -s inherit_errexit` not supported util v4.4 |
|     🚫    | Bash     | v4.0, v4.1, v4.2 | Nameref not support util v4.3                      |
|     🚫    | Bash     | v3               | Associative array not supported  until v4.0        |
|     🚫    | POSIX sh |                  | `local` keyword not supported                      |

There is [a list](http://mywiki.wooledge.org/BashFAQ/061) of which features were added to specific releases (versions) of Bash.

Ash/Ksh/Fish/Xiki and other shells are not supported because there are so many [differences](http://hyperpolyglot.org/unix-shells).

### Dependencies

- Perl 5.8.8 and higher.
  - No need install it by yourself. Almost Unix/Linux operating systems have included Perl 5. See the [Perl Binaries](https://www.cpan.org/ports/binaries.html)
  - Alpine not include Perl. Install it by `apk add perl`.
  - Busybox not include Perl. Install it by .
- Linux commands: grep/awk/sed/mktemp/dirname/basename/cd/printf/echo/wc

## Usage

### Module Usages

See [examples](./example/) and [./doc/module-usages.md](./doc/module-usages.md).

### Import specific modules

```sh
source ./src/import.bash

# Usage: import [-f|--force] <module_name>... [prefix=l.]
# The prefix must end with `_` or `-` or `.`, defaults to 'l.'
import ask first last

l.ask hello world
l.first a b c
l.last a b c
```

### Import modules by categories

```sh
source ./src/import.bash

# Usage: import_category <category_name>... [prefix=l.]
# The prefix must end with `_` or `-` or `.`, defaults to 'l.'
import_category string prompt

l.ask hello world
l.choose a b c
printf 'a\nb\nc\n' | l.count_lines
```

Available categories see [here](./src/internals/categories).

### Import all modules

```sh
source ./src/import.bash

# Usage: import_all [prefix=l.]
# The prefix must end with `_` or `-` or `.`, defaults to 'l.'
import_all

l.ask hello world
```

Attention: import_all is slow.

```sh
time import_all

real    0m2.034s
user    0m1.048s
sys     0m2.535s
```

### Custom import function prefix

`import` and `import_all` may be conflicting with your shell environment.
So you can custom import function prefix can like that,

```sh
source ./src/import.bash a_

# you get `a_import_all` and `a_import` functions
a_import_all

# no differences
ask hello world
```

### Use Command

Many modules not work as command.
This command is only used for certain scenarios.

```sh
./bin/lobash <module_name> <module_args>
```

## Debug

Set environment variable `LOBASH_DEBUG=true` to print verbose logs.

## [FAQ](./doc/faq.md)

## Contributions

Contributions are welcomed. Please read [this document](./doc/contribution.md).

## Versioning

The versioning follows the rules of SemVer 2.0.0.

**Attentions**: anything may have **BREAKING CHANGES** at **ANY TIME** when major version is zero (0.y.z), which is for initial development and the public API should be considered unstable.

For more information on SemVer, please visit http://semver.org/.


## Copyright and License

Copyright (c) 2019 ADoyle. The project is licensed under the **Apache License Version 2.0**.

See the [LICENSE][] file for the specific language governing permissions and limitations under the License.

See the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.

## References

- [pure-bash-bible](https://github.com/dylanaraps/pure-bash-bible)

<!-- Links -->

[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE
