<p align="center">
  <img alt="Lobash Logo" src="./doc/imgs/lobash.svg">
</p>
<p align="center">
  A modern, pure, powerful utility library for shell script development.
</p>

**Current project is under development, most APIs are unstable. It will get done soon. Welcome to make contributions.**

## TOC

<!-- MarkdownTOC GFM -->

- [Supported Shells](#supported-shells)
- [Installation](#installation)
- [Usage](#usage)
    - [Import specific modules](#import-specific-modules)
    - [Import specific modules with prefix naming](#import-specific-modules-with-prefix-naming)
    - [Import all modules](#import-all-modules)
    - [Import all modules with prefix naming](#import-all-modules-with-prefix-naming)
    - [Custom import function prefix](#custom-import-function-prefix)
- [Examples and Modules](#examples-and-modules)
- [Debug](#debug)
- [Contributions](#contributions)
- [Versioning](#versioning)
- [Copyright and License](#copyright-and-license)
- [References](#references)

<!-- /MarkdownTOC -->

## Supported Shells

| Supported | Shell    | Version       | Reason                                     |
|:---------:|:---------|:--------------|:-------------------------------------------|
|     ✅    | Bash     | v3 and higher | -                                          |
|     ❔    | Zsh      |               | No tested                                  |
|     ❔    | Ash      |               | No tested                                  |
|     ❔    | Fish     |               | No tested                                  |
|     ❔    | Ksh      |               | `read -A` is different from bash `read -a` |
|     ❔    | Xiki     |               | No tested                                  |
|     🚫    | POSIX sh |               | not supported `local` keyword              |

## Installation

```
git clone --depth 1 https://github.com/adoyle-h/lobash.git
git submodule update --init --recursive
```

## Usage

### Import specific modules

```sh
source ./src/import.bash

# import <module_name1> <module_name2>
import ask first last

ask hello world
first a b c
last a b c
```

### Import specific modules with prefix naming

```sh
source ./src/import.bash

# import <module_name1> <module_name2> <prefix>
import ask first last l.

l.ask hello world
l.first a b c
l.last a b c
```

The prefix must end with `_` or `-` or `.`

### Import all modules

`import_all` without prefix naming is not recommended. Because Lobash modules will override the shell commands, builtin, alias and function while the name may be same.

`import_all l.` is recommended.


```sh
source ./src/import.bash

import_all

ask hello world
hash content
```

### Import all modules with prefix naming

```sh
source ./src/import.bash

# import <prefix>
import_all l.

l.ask hello world
```

The prefix must end with `_` or `-` or `.`

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

## Examples and Modules

See the files in [example/](./example) and [test/modules/](./test/modules) to understand how to use Lobash modules.

## Debug

Set environment variable `LOBASH_DEBUG=true` to print verbose logs.

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
