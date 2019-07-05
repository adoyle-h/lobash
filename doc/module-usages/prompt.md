# Category: Prompt

[⬅️ Back to previous page](./README.md)

## TOC

- [ask](#ask)
- [ask_input](#ask_input)
- [choose](#choose)

## Modules

### ask

- Usage: `l.ask <message> [<default>=Y]`
- Description:
  - Print a message and read Yes/No answer from stdin.
  - It prints 'YES' when get answer y/Y/ye/Ye/yE/YE/yes/yES/yeS/YeS/Yes/YEs/YES.
  - It prints 'NO' when get answer n/N/no/No/nO/NO.
  - It prints default value when get empty answer.
  - It prints 'Invalid Answer' when get other answers.
  - When default=Y, if will return YES by default.
  - When default=N, if will return NO by default.
- Dependent: [`lower_case`](./string.md#lower_case)
- Since: 0.1.0
- Test Cases: [tests/modules/ask.bats](../../tests/modules/ask.bats)
- Source Code: [src/modules/ask.bash](../../src/modules/ask.bash)
- Executable Example: [example/modules/ask](../../example/modules/ask)

### ask_input

- Usage: `l.ask_input [<message>='Ask Input:'] [<default>]`
- Description:
  - Print a message and read user input from stdin.
  - If `<default>` provided, return it when user type empty.
- Since: 0.1.0
- Test Cases: [tests/modules/ask_input.bats](../../tests/modules/ask_input.bats)
- Source Code: [src/modules/ask_input.bash](../../src/modules/ask_input.bash)

### choose

- Usage: `l.choose <item>...`
- Description: Prompt user to choose one item from options. The function will return the value of chosen item.
- Dependent: [`is_integer`](./condition.md#is_integer)
- Since: 0.1.0
- Test Cases: [tests/modules/choose.bats](../../tests/modules/choose.bats)
- Source Code: [src/modules/choose.bash](../../src/modules/choose.bash)
- Executable Example: [example/modules/choose](../../example/modules/choose)

[⬆️ Back up to TOC](#toc)
