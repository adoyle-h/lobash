# Changelog

All notable changes to this project will be documented in this file.

The format is inspired by [Keep a Changelog](http://keepachangelog.com/en/1.0.0/).

The versions follow the rules of [Semantic Versioning 2.0.0](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

[Full Changes](https://github.com/adoyle-h/lobash/compare/v0.7.0...HEAD)


<a name="v0.7.0"></a>
## v0.7.0 (2024-09-06 21:38:01 +08:00)

[Full Changes](https://github.com/adoyle-h/lobash/compare/v0.6.0...v0.7.0)

### New Features

- add module l.array_size ([2b4f2a1](https://github.com/adoyle-h/lobash/commit/2b4f2a1ee2e8854665fc527243004bbc78d74085))
- add module l.parse_args. And l.parse_params is deprecated. ([b506bf5](https://github.com/adoyle-h/lobash/commit/b506bf5f8aa2da8e38f031d484b533d1c0db4e16))
  > User should use l.parse_args instead of l.parse_params.
  > The l.parse_params has some limitations on use. So it is deprecated and
  > will be removed in soon.
- add module l.array_has_key ([00013b0](https://github.com/adoyle-h/lobash/commit/00013b0ddb927902c5069cfa89548f351f602a22))
- add module: is_associative_array ([80f3153](https://github.com/adoyle-h/lobash/commit/80f31539e1360b91132d02db9fe610dad5cef7c8))
- add modules: var_attrs ([b5455e4](https://github.com/adoyle-h/lobash/commit/b5455e45abb7764f742d218700d283423f4d2e07))

### Document Changes

- update docs ([e723a75](https://github.com/adoyle-h/lobash/commit/e723a75f9842a8f2f9f32e996a0e41bb1e56794a))
- update README ([0ab8056](https://github.com/adoyle-h/lobash/commit/0ab8056872f21ec8252a46d517d9a0d6bb6c9be0))
- improve CONTRIBUTING ([784aa24](https://github.com/adoyle-h/lobash/commit/784aa24f4ceafd44e48a0a45ef3110ba506b8018))
- renew license && add CONTRIBUTING in Chinese ([dbd4e6d](https://github.com/adoyle-h/lobash/commit/dbd4e6d15fc649af036b40d57591eca1a6419d33))
- update version in README ([cf8883e](https://github.com/adoyle-h/lobash/commit/cf8883ecb29b7309ec722d327b3ca1d3bd8c4bdc))

<a name="v0.6.0"></a>
## v0.6.0 (2022-12-15 02:35:30 +08:00)

[Full Changes](https://github.com/adoyle-h/lobash/compare/v0.5.1...v0.6.0)

### Breaking Changes

Have 1 breaking changes. Check below logs with ⚠️ .

### New Features

- add l.head ([24f2dad](https://github.com/adoyle-h/lobash/commit/24f2dad1f5f412b41e8a4cceaecc52fade49fc00))
- add l.seq ([06bb8f3](https://github.com/adoyle-h/lobash/commit/06bb8f3c9e465aa2618bab3a44344455d944303e))
- add l.echo.p ([331b97b](https://github.com/adoyle-h/lobash/commit/331b97b016114baf66afff53cd01b0f7fcc820a6))
- add l.extract ([5a0f7fb](https://github.com/adoyle-h/lobash/commit/5a0f7fb839dddb9102e4ae7c9dd61b8886498b9f))
- l.last support "`<count>`" parameter, which defaults to 1 ([4be3317](https://github.com/adoyle-h/lobash/commit/4be3317bb20d17eada54cd5cdece0614b4e42c9e))
- l.first support "`<count>`" parameter, which defaults to 1 ([ded7bb8](https://github.com/adoyle-h/lobash/commit/ded7bb8ca156719f50fc41d07107422be58a66f7))
- add l.term_size ([9d2518a](https://github.com/adoyle-h/lobash/commit/9d2518aab6379cca5cd5afc12f1814807b31852e))
- add l.each.p ([afbed00](https://github.com/adoyle-h/lobash/commit/afbed00304d702b7ba3e0fd4ab72ee8979627fa9))
- add l.sedi ([46b7910](https://github.com/adoyle-h/lobash/commit/46b7910031262a01770ee4cf9fccf48603fc1b53))
- add l.each ([d3338cc](https://github.com/adoyle-h/lobash/commit/d3338cc7db270b354c42cb8512693c72af4fa9bc))
- add l.is_empty_dir ([cfa1474](https://github.com/adoyle-h/lobash/commit/cfa1474e6e38476f7faeff114a46982befe0632c))
- add l.array_reverse ([dee8361](https://github.com/adoyle-h/lobash/commit/dee836173bf4b2a3713ecba2ecea3cffc72f6ff7))
- add l.read_array ([2ac330b](https://github.com/adoyle-h/lobash/commit/2ac330bdd67d81806a0f85c591da4783b09eb65b))
- **l.cursor_pos**: support variable parameter ([019aa5c](https://github.com/adoyle-h/lobash/commit/019aa5c1002b8a81123b81bae317de173b711a68))
  > now it supports `l.cursor_pos <array_name>`
- **l.split**: support "l.split `<string>` -" for subshell ([3852be5](https://github.com/adoyle-h/lobash/commit/3852be51262321d9b37e74e8168ccd917e1f2177))
  > `l.split <string> <output_array_name>` not works in subshell.
  > So use `l.split <string> -` to print results to stdout in subshell.

### Bug Fixes

- l.first and l.last, when array is emtpy, do not echo '' ([7d4874e](https://github.com/adoyle-h/lobash/commit/7d4874e298e01971bd1b2b6e7f0bf3eac84b6d32))
- If refer array name outside function, the local variable names should prevent duplicates ([37c38fe](https://github.com/adoyle-h/lobash/commit/37c38fee8d6c7d9358e620bfb6ccdaa8680820ea))
- variables defined in "for" and "while" should be local ([0b5c1de](https://github.com/adoyle-h/lobash/commit/0b5c1de512c8e8ccaddbfdcdf513ffd11f5920cb))
  > Fix modules: benchmark, compose, keys, parse_params, trace_stack
- ⚠️  **l.cursor_pos**: Change the output format of l.cursor_pos ([9ed1ae5](https://github.com/adoyle-h/lobash/commit/9ed1ae56abc010f5b09fb3031180da76f8477a48))
  > Breaking Change:
  > 
  > Change the output format of l.cursor_pos from `row;column` to `$row\n$column\n`

### Document Changes

- update module descriptions for l.hex_to_rgb and l.rgb_to_hex ([6e3983b](https://github.com/adoyle-h/lobash/commit/6e3983bb6a24338ffe87741675f784ab2d48bac8))
- add how to write test case ([96b6ac2](https://github.com/adoyle-h/lobash/commit/96b6ac26c722056ecfd352fb1fff5f78611d6169))
- fix dead and wrong links ([28ae283](https://github.com/adoyle-h/lobash/commit/28ae283e3ac6ca8aef226cbf03a6d8938ee096e9) [#6](https://github.com/adoyle-h/lobash/issues/6))
  > - add "make check-links" to check daed links
  > - Remove non-existed Test Cases links
  > 
  > Fix [#6](https://github.com/adoyle-h/lobash/issues/6)
- update git-message rules ([133f9a3](https://github.com/adoyle-h/lobash/commit/133f9a3196f258376c51fbd51e8424149b24c33c))
- **l.date**: update description ([3668155](https://github.com/adoyle-h/lobash/commit/3668155eae82be344c54cc3992aaa42ddb0fd154))

<a name="v0.5.1"></a>
## v0.5.1 (2022-11-26 00:30:46 +08:00)

[Full Changes](https://github.com/adoyle-h/lobash/compare/v0.5.0...v0.5.1)

### Bug Fixes

- **is_array**: exported array should be true
  - Only with bash 4.3, this function return 1 when the variable declared without initialization. Because `declare -p a` shows `declare: a: not found` when `declare -a a`. It's a bug in bash 4.3.
- **is_exported**: it should be false if local variable is associate array but its name contains x
  - In bash 4.0~4.3, when `export <var>` without initialization, is_exported will return false. Because `declare -p <var>` will print "not found". It's a bug in Bash.
  - ([-a-z]+) not matches attribution `-A`, so the sed will print whole line. If the variable name contains "x", the `[[ $s == *x* ]]` will be true. That will cause a bug. See the last [test case](./tests/modules/is_exported.bats).

### Document Changes

- update module usages
- improve documents
- add Chinese documents

<a name="v0.5.0"></a>
## v0.5.0 (2022-11-24 00:56:00 +0800)

[Full Changes](https://github.com/adoyle-h/lobash/compare/v0.4.0...v0.5.0)

### New Features

- add [l.str_replace](./docs/module-usages/string.md#str_replace)
- add [l.str_replace_all](./docs/module-usages/string.md#str_replace_all)
- add [l.str_replace_last](./docs/module-usages/string.md#str_replace_last)
- add [l.relative](./docs/module-usages/path.md#relative)
- add [l.is_gnu_sed](./docs/module-usages/condition.md#is_gnu_sed)
- add [l.is_tty_available](./docs/module-usages/condition.md#is_tty_available)
- add [l.is_function](./docs/module-usages/condition.md#is_function)
- add [l.is_exported](./docs/module-usages/condition.md#is_exported)
- add [l.is_undefined](./docs/module-usages/condition.md#is_undefined)
- add [l.is_ubuntu](./docs/module-usages/condition.md#is_ubuntu)
- add [l.trap_error](./docs/module-usages/util.md#trap_error)
- add [l.ask_with_cancel](./docs/module-usages/prompt.md#ask_with_cancel)
- **build**: support -m <BASHVER>, --min <BASHVER> option to instead of BASHVER
- **build**: support to set PREFIX with config
- **build**: reuse the last UNIQ_KEY if found
- **build**: Add Command and UNIQ_KEY labels
- **tool**: add tools/module-metadata

### Bug Fixes

- **build**: Add options "-h", "-y" and "-p". env PREFIX and OVERWRITE are still compatible, but should not used any more.
- **build**: add git commit into built verion annotation && fix version in doc
- **build**: support symbol link to ./build file
- **build**: failed with linux sed
- **build**: OVERWRITE should be false by default
- **build**: remove public method wrappers && internal variables should be replaced when building
- **ci**: mkdir ./dist when test-in-docker
- **ci**: test-in-docker should have tty
- **ci**: load_module should load dist/lobash.bash
- **l.ask**: no longer return "Invalid Answer"
- **l.str_include**: with empty string should return true
- **l.keys**: test failed in linux
- **l.is_array**: uninitialized (declare -a arr) should be an array
- **l.random**: l.random hangs up in Github Action
- **l.sleep**: do not create _L_SLEEP_TEMP when loading lobash
- **l.with_ifs**: eval "$@" -> eval "$*"
- **l.is_array**: it should return true when test associative array && it returns false with uninitialized array in bash 4.3

### Document Changes

- update module usages && add Notice
- rename /doc to /docs for github issue template
- improve documents && remove TOC to use the Github builtin TOC
- fix metadata since && update changelog
- **l.sort**: update description && add examples

### BREAKING CHANGE

- **l.ask**:
  - no longer return "Invalid Answer"
  - default value of l.ask use "" instead of "Y"
- **l.is_array**
  - There is a bug in bash 4.3 with `declare -p`. It may be a breaking change.
  - With associative array, it returns true now. But it returns false in previous version.

<a name="v0.4.0"></a>
## [v0.4.0] - 2019-07-12 21:36:00 +0800

Now most modules support bash 4.0+!

[Full Changes](https://github.com/adoyle-h/lobash/compare/v0.3.1...v0.4.0)

### Add

- add [l.match_list](./docs/module-usages/string.md#match_list)
- add [l.parse_params](./docs/module-usages/util.md#parse_params)
- support export user specific modules/categories with config by `./build -c <config>`

### Fix

- union_array: each value of return array should be unique && union_array only accept one or two parameters
- Use eval instead of nameref. All commands using nameref feature now support 4.0+. Effect commands:
  - array_include
  - array_include.s
  - echo_array
  - first
  - inc
  - join
  - last
  - match_list
  - parse_params
  - sort
  - sub
  - union_array

### Change

- refactor: reduce exported internal codes in built file.
- refactor: remove comments in built file

### Doc

- Modules usages document shows what modules not compatible with Bash 4.0.

<a name="v0.3.1"></a>
## [v0.3.1] - 2019-07-08 02:22:00 +0800

[Full Changes](https://github.com/adoyle-h/lobash/compare/v0.3.0...v0.3.1)

### Add

- add l.array_include.s, l.str_include.s, l.end_with.s, l.start_with.s

### Breaking Change

- l.str_include return 0/1 instead of echo true/false
- l.end_with return 0/1 instead of echo true/false
- l.start_with return 0/1 instead of echo true/false
- l.array_include return 0/1 instead of echo true/false
- str_include, end_with, start_with move to Condition Category

<a name="v0.3.0"></a>
## [v0.3.0] - 2019-07-08 01:16:00 +0800

[Full Changes](https://github.com/adoyle-h/lobash/compare/v0.2.0...v0.3.0)

### Breaking Change

All Condition modules should provide two implements. Like `is_file` and `is_file.s`,
'.s' suffix means "strict mode".

- All Condition functions renamed from l.xxx to l.xxx.s.
- Current Condition functions l.xxx return 0/1 instead of echo true/false
- rename l.is_writeable => l.is_writable.s
- rename l.true => l.is_truthy.s
- rename l.false => l.is_falsy.s
- l.has not support l.has not <command>, use l.has_not instead
- rename l.strict_has => l.has.s
- rename l.strict_has_not => l.has_not.s
- rename l.not => l.not.s
- rename l.not.p => l.not.s.p

<a name="v0.2.0"></a>
## [v0.2.0] - 2019-07-07 15:26:01 +0800

[Full Changes](https://github.com/adoyle-h/lobash/compare/v0.1.0...v0.2.0)

### Fix

- l.array_include should return false when get empty array.
- `l.split 'abc' target 'abc'` not work as expected.
- l.cur_function_name: wrong function name in dist.
- l.trace_stack should not show self function in stack in dist.
- Only active inherit_errexit when it is supported in Bash.
- l.count_files: wrong counts when spaces in file paths

### Add

- Add new modules: ask_input, echo_screen, with_ifs
- bin/lobash add new sub-commands: mods, meta, help, github
- Add colored output and interactive prompts for build script

### Change

- Support Bash 4.0+. The shell option inherit_errexit is not required. Some modules are not supported in lower version Bash.

### Doc

- Change file structure of "module usages" and show more metadatas. Now you can see what Bash version each module supported.

<a name="v0.1.0"></a>
## [v0.1.0] - 2019-07-01 23:46:15 +0800

First release! It works in Bash 4.4+.

[Full Changes](https://github.com/adoyle-h/lobash/compare/c8826ac...v0.1.0)

<!-- links -->

[v0.4.0]: https://github.com/adoyle-h/lobash/tree/v0.4.0
[v0.3.1]: https://github.com/adoyle-h/lobash/tree/v0.3.1
[v0.3.0]: https://github.com/adoyle-h/lobash/tree/v0.3.0
[v0.2.0]: https://github.com/adoyle-h/lobash/tree/v0.2.0
[v0.1.0]: https://github.com/adoyle-h/lobash/tree/v0.1.0
