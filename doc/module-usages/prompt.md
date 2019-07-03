# Category: Prompt

[⬅️ Back to previous page](./README.md)

## TOC

- [ask](#ask)
- [choose](#choose)

## Modules

### ask

- Usage: `l.ask <message> [<default>=Y]`
- Description:
  - Print a message and read Yes/No answer from stdin.
  - when default=Y, if will return YES by default.
  - when default=N, if will return NO by default.
- Dependent: [`lower_case`](./string.md#lower_case)
- Since: 0.1.0
- Test Cases: [tests/modules/ask.bats](../../tests/modules/ask.bats)
- Source Code: [src/modules/ask.bash](../../src/modules/ask.bash)
- Executable Example: [example/modules/ask](../../example/modules/ask)

### choose

- Usage: `l.choose <item>...`
- Description: Prompt user to choose one item from options. The function will return the value of chosen item.
- Dependent: [`is_integer`](./condition.md#is_integer)
- Since: 0.1.0
- Test Cases: [tests/modules/choose.bats](../../tests/modules/choose.bats)
- Source Code: [src/modules/choose.bash](../../src/modules/choose.bash)
- Executable Example: [example/modules/choose](../../example/modules/choose)

[⬆️ Back up to TOC](#toc)
