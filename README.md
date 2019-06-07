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

- [Supported Shells](#supported-shells)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
    - [Import specific modules](#import-specific-modules)
    - [Import all modules](#import-all-modules)
    - [Custom import function prefix](#custom-import-function-prefix)
    - [Module Usages](#module-usages)
    - [Use Command](#use-command)
- [Examples and Modules](#examples-and-modules)
- [Debug](#debug)
- [FAQ](#faq)
- [Contributions](#contributions)
- [Versioning](#versioning)
- [Copyright and License](#copyright-and-license)
- [References](#references)

<!-- /MarkdownTOC -->

## Supported Shells

| Supported | Shell    | Version          | Main Reasons                                       |
|:---------:|:---------|:-----------------|:---------------------------------------------------|
|     ❔    | Zsh      | v5 and higher    | Plan to be compatible later                        |
|     ❔    | Bash     | v5 and higher    | Not tested yet                                     |
|     ✅    | Bash     | v4.4             | -                                                  |
|     🚫    | Bash     | v4.3             | `shopt -s inherit_errexit` not supported util v4.4 |
|     🚫    | Bash     | v4.0, v4.1, v4.2 | Nameref not support util v4.3                      |
|     🚫    | Bash     | v3               | Associative array not supported  until v4.0        |
|     🚫    | POSIX sh |                  | `local` keyword not supported                      |

Ash/Ksh/Fish/Xiki and other shells are not supported because there are so many [differences](http://hyperpolyglot.org/unix-shells).

## Dependencies

- Perl 5.8.8 and higher.
  - No need install it by yourself. Almost Unix/Linux operating systems have included Perl 5. See the [Perl Binaries](https://www.cpan.org/ports/binaries.html)
  - Alpine not include Perl. Install it by `apk add perl`.
  - Busybox not include Perl. Install it by .
- Linux commands: grep/awk/sed/wc/mktemp/dirname/basename/cd/pwd/printf/echo/

## Installation

```sh
git clone --depth 1 https://github.com/adoyle-h/lobash.git
# Clone submodules only when you want to run test cases.
git submodule update --init --recursive
```

## Prerequisites

1. The command which invokes Lobash should set `set -o errexit` and `set -o pipefail`. Otherwise, there are no guarantees that Lobash will execute right behaviors.


## Usage

### Import specific modules

```sh
source ./src/import.bash

# Usage: import <module_name1> <module_name2> <prefix>
# The prefix must end with `_` or `-` or `.`
import ask first last l.

l.ask hello world
l.first a b c
l.last a b c
```

### Import all modules

```sh
source ./src/import.bash

# Usage: import <prefix>
# The prefix must end with `_` or `-` or `.`
import_all l.

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

### Module Usages

See [./doc/module-usages.md](./doc/module-usages.md).

### Use Command

```sh
./bin/lobash <module_name> <module_args>
```

Some modules not work in command.

## Examples and Modules

See the files in [example/](./example) and [test/modules/](./test/modules) to understand how to use Lobash modules.

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
