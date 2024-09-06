<p align="center">
  <img alt="Lobash Logo" src="./docs/imgs/lobash.svg">
</p>
<p align="center">
  帮助 Bash 脚本开发的现代化、安全、强大的工具库。
</p>

[English](./README.md) | [中文](./README.zh.md)

## Lobash 是什么？

由于 Bash 复杂的语法和符号，以及 Unix 同名命令有不同的选项和行为（例如 BSD sed 与 GNU sed 命令名称相同，其参数选项却不同），
Bash 脚本的开发是复杂和易错的。

Javascript 有一个强大的库 [Lodash](https://github.com/lodash/lodash) 来简化开发。所以我建立了 Lobash 来为 Shell 开发做类似的处理。

Lobash 提供了一系列函数来提高 shell 开发的效率。它兼容 Bash 4.0 以上版本和 MacOS/Linux/Alpine/Busybox 系统。

它是用纯 bash 脚本实现的。（除了 [l.now](src/modules/now.bash) 函数，它使用了 perl）。

## 功能特性

- 模块化，易于使用。一个模块一个函数。
- 语义化，替代晦涩难懂的 bash 表达式 (expression)、变量替换 (substitution)、变量扩展( expansion)。
- 丰富的函数。提供了超过 [140 多个模块][module-usages]。
  - 15 个分类: 算术 (Arithmetic), 数组 (Array), 颜色 (Color), 条件判断 (Condition), 输出 (Console), Debug, 文件 (File), 路径 (Path), 提示 (Prompt), 字符串 (String), 系统 (System), 终端 (Terminal), 颜色 (Time), 工具 (Util), 变量 (Variable)。
  - 每个函数都写了[文档](./docs/module-usages/README.md)。
- 稳健和安全。超过 [700 多个测试案例](./tests/modules/)。并且在 [Github Actions](https://github.com/adoyle-h/lobash/actions) 中执行自动化测试。
- 快速。0.058s 就能加载完 Lobash。
- 兼容 MacOS/Linux/Alpine/Busybox 系统。
- 兼容 Bash 4.0 及以上版本。

## 设计理念

Lobash 追求的是简单、易用。具体分为以下几个方面。

### 一个功能只对应一个函数

如果一个功能需要传递很多参数，组合很多函数来完成，那么就不符合 Lobash 的设计理念。

比如日志库，它可以很简单，比如实现 `l.log() { echo "$1" >> "$2"; }`，调用 `l.log "message" "/var/log/file"` 输出日志。
它也可以变得很复杂。有很多的功能，比如颜色高亮、格式化、调用位置、日志等级、日志文件存储、日志转储。

Lobash 只会提供最简单易用的函数。对于复杂的功能，请搜索其他项目。这里推荐几个项目：

- [ebash](https://github.com/elibs/ebash): 实现了很多复杂的功能。
- 日志: [b-log](https://github.com/idelsink/b-log) 或 [bash-logger](https://github.com/adoyle-h/bash-logger)
- 颜色: [shell-general-colors](https://github.com/adoyle-h/shell-general-colors)

### 没有副作用

一个函数只有输入和输出，没有副作用。若给定相同的输入，它将始终返回相同的结果。

Lobash 不会修改全局变量。不创建内部变量来存储中间状态（理想情况下）。

但 Lobash 会修改用户传入的变量，将计算结果存储在用户传入的变量里，例如 [`l.parse_params`](./example/modules/parse_params) 这样。

### 减少潜在的错误

Bash 的语法设计太怪异了，开发者很容易踩坑。Lobash 提供语义化的函数，实现单一的功能，保持简单。

Lobash 能减少开发者的心智负担。

## CI 状态

- [develop 分支](https://github.com/adoyle-h/lobash/tree/develop): [![CI Status](https://github.com/adoyle-h/lobash/actions/workflows/ci.yaml/badge.svg?branch=develop)](https://github.com/adoyle-h/lobash/actions/workflows/ci.yaml?query=branch%3Adevelop)
- [v0.6.0](https://github.com/adoyle-h/lobash/tree/v0.6.0): [![CI Status](https://github.com/adoyle-h/lobash/actions/workflows/ci.yaml/badge.svg?branch=v0.6.0)](https://github.com/adoyle-h/lobash/actions/workflows/ci.yaml?query=branch%3Av0.6.0)
- [v0.5.0](https://github.com/adoyle-h/lobash/tree/v0.5.0): [![CI Status](https://github.com/adoyle-h/lobash/actions/workflows/ci.yaml/badge.svg?branch=v0.5.0)](https://github.com/adoyle-h/lobash/actions/workflows/ci.yaml?query=branch%3Av0.5.0)
- [v0.4.0](https://github.com/adoyle-h/lobash/tree/v0.4.0): [![CI Status](https://github.com/adoyle-h/lobash/actions/workflows/ci.yaml/badge.svg?branch=v0.4.0)](https://github.com/adoyle-h/lobash/actions/workflows/ci.yaml?query=branch%3Av0.4.0)

## 版本

版本详见 [tags][]。
版本命名遵守 [Semantic Versioning 2.0.0](http://semver.org/spec/v2.0.0.html)。

## [变更日志 ChangeLog](./CHANGELOG.md)

## [常见问题 FAQ](./docs/faq.md)

## 前提

### 支持的平台

| Supported | Platform | Version | Main Reasons                       |
|:---------:|:---------|:--------|:-----------------------------------|
|     ✅    | MacOS    | *       | -                                  |
|     ✅    | Linux    | *       | -                                  |
|     ✅    | Busybox  | *       | -                                  |
|     ✅    | Alpine   | *       | -                                  |
|     ❔    | BSD      | -       | 没测试过，也许不支持               |
|     🚫    | Windows  | -       | 永远不会支持                       |

### 支持的 Shell

| Supported | Shell    | Version       | Descriptions                                  |
|:---------:|:---------|:--------------|:----------------------------------------------|
|     ✅    | Bash     | v5 and higher | 完全支持                                      |
|     ✅    | Bash     | v4.4          | 完全支持                                      |
|    ✅💬   | Bash     | v4.3          | -                                             |
|    ✅💬   | Bash     | v4.2          | -                                             |
|    ✅💬   | Bash     | v4.1          | -                                             |
|    ✅💬   | Bash     | v4.0          | -                                             |
|     🚫    | Bash     | v3            | 关联数组要知道 v4.0 才支持                    |
|     🚫    | POSIX sh | *             | 不支持关键字 `local`                          |
|     🚫    | Zsh      | *             | -                                             |
|     🚫    | Fish     | *             | -                                             |

大多数 Lobash 模块支持 Bash 4.0 及以上版本。有些模块不支持 Bash 4.4 以前的版本。详见[不兼容列表](./docs/module-usages/README.md#not-compatible)。

每个模块都在[文档][module-usages]里标注了 `Bash` 标签。`Bash: 4.2+` 意味着该模块只支持 Bash 4.2 及以上版本。

✅💬 表示 Lobash 是支持的，但是并非所有模块都支持。
在构建 lobash 时会打印提示出不支持的模块。

**如果你在 Bash 4.0~4.3 中使用 Lobash，请先阅读 [./docs/with-lower-version-bash.md](./docs/with-lower-version-bash.md)。这非常重要。**

**Lobash 没有在 MacOS 以及 Linux 中测试 Bash 4.0 版本。因为这似乎有个 [Bug](./docs/with-lower-version-bash.md#not-test-with-bash-40)。如果你解决了这个问题，请告知我。**

尽管大多数 Linux 发行版至少使用 Bash v4.3，并且 MacOS 始终默认安装 Bash v3.2。
在绝大多数系统里，我们依然能轻松升级到 Bash 4.4 以上版本。
Bash 有

Bash 4.4 以下版本都有很多 BUG，强烈建议用户升级到 Bash 4.4 以上版本。

### 依赖

确保以下程序已安装在你的系统里。

- Linux 命令:
  - sed/grep/mktemp/dirname/basename/cd/printf/echo/wc
  - sed: Lobash 兼容 BSD 与 GNU 版本的 sed

## 安装

在 [Git Tags](https://github.com/adoyle-h/lobash/tags) 中查看 Lobash 的可用版本 ("vX.Y.Z")。

```sh
VERSION=v0.6.0  # 或者 VERSION=develop，但是 develop 分支不稳定
# 下载源码
git clone --depth 1 --branch $VERSION https://github.com/adoyle-h/lobash.git
cd lobash
# 下面这一行可选。这是为了运行测试案例用的
git submodule update --init --recursive --progress

# build 文件拷贝到 PATH 路径下
sudo ln -s "$PWD/build" /usr/local/bin/lobash-gen
```

## 用法

`lobash-gen -h` 显示帮助文档。

### 构建你的 lobash.bash

首先，使用 `lobash-gen` 构建你自己的 `lobash.bash` 文件。

```sh
# 交互式构建过程，导入所有 lobash 模块
lobash-gen
# 生成文件: ./lobash.bash

# 或者，指定输出文件路径
lobash-gen <target-path>
# Generated file: <target-path>
```

**阅读 [./docs/build.md](./docs/build.md) 获取详细信息。**

### 编辑你的脚本，并且设置 shell 选项

所有 Lobash 模块都是以下面这几个 shell 选项为基础的。

- `set -o errexit`
- `set -o nounset`
- `set -o pipefail`
- `shopt -s inherit_errexit` (`inherit_errexit` 选项在 Bash v4.4 中才支持)

如果你不明白这些选项的意义，请阅读[这篇文章](https://dougrichardson.us/notes/fail-fast-bash-scripting.html)。

**Lobash 默认不开启这些选项。在执行 Lobash 函数之前，你需要确保它们已开启。否则可能会有未知的错误发生。**

### 在你的脚本中加载 lobash.bash

然后，在你的脚本中加载 `lobash.bash`。所有的 Lobash 函数会被导入当前的 shell 环境里。

```sh
#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail -o errtrace  # You can remove "-o errtrace" if you do not use l.trap_error.
(shopt -p inherit_errexit &>/dev/null) && shopt -s inherit_errexit

# It will load all Lobash modules
source <path-to-lobash.bash>
# Call l.<module_name> when "lobash-gen"
l.ask 'Hello Lobash?'

# Call lobash.<module_name> when "lobash-gen -p lobash_"
# lobash_ask 'Hello Lobash?'
```

加载 `lobash.bash` 非常快，实际上只用了 0.058 秒。

```sh
time source ./dist/lobash.bash

real    0m0.058s
user    0m0.022s
sys     0m0.036s
```

### 模块用法与文档

所用模块用法写在 [./docs/module-usages/][module-usages]。

所用模块用例写在 [./example/modules](./example/modules) 以及[测试案例](./tests/modules)。

可用的模块列在 [config.example](./config.example)。

## 高级用法

### lobash-gen -c config

`lobash-gen` 默认导出所有模块。你可以使用 `-c <config>` 选择指定模块。

你还可以在配置文件中指定 `PREFIX`, `BASH_MIN_VERSION` 选项。

```sh
cp config.example config
# The "config" file is ignored by git

# Edit config
lobash-gen -c ./config
```

### [命令](./docs/lobash-command.md)

## 谁使用 Lobash

- [one.bash](https://github.com/one-bash/one.bash)
- 联系我把你的项目加进这个列表

## 相关项目

- [shell-general-colors](https://github.com/adoyle-h/shell-general-colors): Shell 颜色字符
- [bats-core](https://github.com/bats-core/bats-core): 测试框架
- [我创建的其他 shell 项目](https://github.com/adoyle-h?tab=repositories&q=&type=source&language=shell&sort=stargazers)

## 参考链接

- [pure-bash-bible](https://github.com/dylanaraps/pure-bash-bible)
- https://www.gnu.org/software/bash/manual/
- http://mywiki.wooledge.org/BashFAQ

## [测试](./docs/test.md)

## 提建议，修 Bug，做贡献

**在创建新的 Issue/Discussion/PR，以及发表评论之前**，请先阅读 [./docs/CONTRIBUTING.zh.md](./docs/CONTRIBUTING.zh.md)。

## 版权声明

Copyright 2019-2024 ADoyle (adoyle.h@gmail.com). Some Rights Reserved.
The project is licensed under the **Apache License Version 2.0**.

Read the [LICENSE][] file for the specific language governing permissions and limitations under the License.

Read the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.


<!-- Links -->

[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE
[tags]: https://github.com/adoyle-h/lobash/tags

[module-usages]: ./docs/module-usages/README.md
