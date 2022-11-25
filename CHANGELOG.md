# Changelog

All notable changes to this project will be documented in this file.

The format is inspired by [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## Change Types

- Add: New features.
- Fix: Bug fixes.
- Change: Changes in existing functionality.
- Breaking Change: Changes which incompatible with previous version in existing functionality
- Deprecate: Features soon-to-be removed.
- Remove: Features removed now.
- Security: In case of vulnerabilities.
- Doc: Documentation changes.

## [Unreleased]

[Full Changes](https://github.com/adoyle-h/lobash/compare/master...develop)

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
