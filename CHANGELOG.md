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

## [v0.4.0] - 2019-07-12 21:36:00 +0800

Now most modules support bash 4.0+!

### Add

- add [l.match_list](./doc/module-usages/string.md#match_list)
- add [l.parse_params](./doc/module-usages/util.md#parse_params)
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

## [v0.3.1] - 2019-07-08 02:22:00 +0800

### Add

- add l.array_include.s, l.str_include.s, l.end_with.s, l.start_with.s

### Breaking Change

- l.str_include return 0/1 instead of echo true/false
- l.end_with return 0/1 instead of echo true/false
- l.start_with return 0/1 instead of echo true/false
- l.array_include return 0/1 instead of echo true/false
- str_include, end_with, start_with move to Condition Category

[Full Changes](https://github.com/adoyle-h/lobash/compare/v0.3.0...v0.3.1)

## [v0.3.0] - 2019-07-08 01:16:00 +0800

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

[Full Changes](https://github.com/adoyle-h/lobash/compare/v0.2.0...v0.3.0)

## [v0.2.0] - 2019-07-07 15:26:01 +0800

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

[Full Changes](https://github.com/adoyle-h/lobash/compare/v0.1.0...v0.2.0)

## [v0.1.0] - 2019-07-01 23:46:15 +0800

First release! It works in Bash 4.4+.

[Full Changes](https://github.com/adoyle-h/lobash/compare/c8826ac...v0.1.0)

<!-- links -->

[v0.4.0]: https://github.com/adoyle-h/lobash/tree/v0.4.0
[v0.3.1]: https://github.com/adoyle-h/lobash/tree/v0.3.1
[v0.3.0]: https://github.com/adoyle-h/lobash/tree/v0.3.0
[v0.2.0]: https://github.com/adoyle-h/lobash/tree/v0.2.0
[v0.1.0]: https://github.com/adoyle-h/lobash/tree/v0.1.0
