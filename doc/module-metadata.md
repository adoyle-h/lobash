# Module Metadata

Each module must have these comments which called Metadata at top.

Like this:

```sh
# ---
# Category: XXX
# Deprecated: false
# Since: <version>
# Dependent: a,b,c
# Usage: l.public_function arguments [options]
# Description: function description
# ---
```

**Attention**: Exactly `# ---`. No more or less spaces and `-`.

## Category

It is required.

The value of `Category` must be upper camel case.

Available values:

- Collection
- Color
- Condition
- Core
- File
- Float
- Number
- Path
- Prompt
- String
- System

## Deprecated

It is optional. Defaults to `false`.

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

Follow the http://docopt.org/

## Description
