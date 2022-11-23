# Lobash Command

While Lobash is a library for development, it also provides a command `./bin/lobash`.

Enter `./bin/lobash` show help.

```sh
> ./bin/lobash

Usage:
  lobash [help|-h|--help]
  lobash mod <module_name> [<sub_command_args>]...
  lobash meta <module_name>

Sub-Command:
  help       Show help
  mod        Invoke a Lobash module
  mods       Show available module names
  meta       Query metadatas of Lobash module
  github     Open Lobash github page in your browser

Description:
The "lobash mod" command is only used for certain scenarios. Many modules not work as command.
```

## lobash meta

```sh
> ./bin/lobash meta normalize
Module: normalize
Usage: l.normalize <path>
Description:
  - Normalize the given path which can be an unexisted path.
  - Trailing `/` always be removed.
Dependent: split, join
Deprecated: false
Since: 0.1.0
Bash: 4.0
Status: tested
```

## lobash mod

Note: The "lobash mod" command is only used for certain scenarios. Many modules not work as command.

```sh
> ./bin/lobash mod ask 'Is it OK?'
Is it OK? ([Y]es/No)
YES
```
