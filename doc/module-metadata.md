# Module Metadata

These comments wrapped between `# ---` are called Metadata.
Each module must have Metadata at top.

```sh
# ---
# Category: XXX
# Deprecated: false
# Since: <version>
# Dependent: a,b,c
# Usage: l.public_function arguments [options]
# Description: function description
# Bash: 4.0
# Status: tested
# ---
```

The Metadata is order insensitive.

**Attention**: Exactly `# ---`. No more or less spaces and `-`.

## TOC


<!-- MarkdownTOC GFM -->

- [Category](#category)
- [Deprecated](#deprecated)
- [Dependent](#dependent)
- [Since](#since)
- [Usage](#usage)
- [Description](#description)
- [Bash](#bash)
- [Status](#status)
- [Module](#module)

<!-- /MarkdownTOC -->


## Category

It is required.

Available values:

- Arithmetic
- Array
- Condition
- Console
- Debug
- File
- Path
- Prompt
- String
- System
- Terminal
- Time
- Util
- Lobash

These values must be upper camel case.

## Deprecated

It is optional. Default to `false`.

Available values:

- `false`
- `true`

If true, shell will print a warning log to stderr when load this module.

## Dependent

It is optional.

An array of module names which current module dependents on.
Dependencies must be separated with `,`.

## Since

It is required.

It indicates this module added since what version.

Available values: The Lobash release version.

## Usage

The usage format must follow the http://docopt.org/ .

And public_function must start with `l.`.

## Description

It is optional.

Any descriptions of module.
It can be multiple.

## Bash

It is optional. Default to `4.0`.

The minimum version of Bash which Lobash supports.

## Status

It is optional. Default to `tested`.

Available values:

- `tested`

## Module

It is hidden.

The module name, based on module filename.

Currently, only be shown in `./bin/lobash meta`.
