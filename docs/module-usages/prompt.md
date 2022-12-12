# Category: Prompt

[⬅️ Back to previous page](./README.md)

## TOC

- [ask](#ask)
- [ask_input](#ask_input)
- [ask_with_cancel](#ask_with_cancel)
- [choose](#choose)

## Modules

### ask

- Usage: `l.ask <message> [<default>='']`
- Description:
  - Print the message to tty and wait for user typing from stdin.
  - It will print 'YES' when user types y/Y/ye/Ye/yE/YE/yes/yES/yeS/YeS/Yes/YEs/YES.
  - It will print 'NO' when user types n/N/no/No/nO/NO.
  - It will print the default value when get empty answer if default is not empty.
  - When default=Y, it prints 'YES' by default.
  - When default=N, it prints 'NO' by default.
  - When default='', there is no default value. It will keep asking until user typed right answer.
  - **Attention: "echo invalid_string | l.ask message" will fall into a infinite loop.**
  - "echo y | l.ask message" and "echo n | l.ask message" are valid.
- Dependent: [`start_with`](./condition.md#start_with) [`join`](./string.md#join)
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/ask.bats](../../tests/modules/ask.bats)
- Source Code: [src/modules/ask.bash](../../src/modules/ask.bash)
- Example: [example/modules/ask](../../example/modules/ask)

### ask_input

- Usage: `l.ask_input [<message>='Ask Input:'] [<default>]`
- Description:
  - Print a message and read user input from stdin.
  - If `<default>` provided, return it when user type empty.
- Since: 0.2.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/ask_input.bats](../../tests/modules/ask_input.bats)
- Source Code: [src/modules/ask_input.bash](../../src/modules/ask_input.bash)

### ask_with_cancel

- Usage: `l.ask_with_cancel <message> [<default>='']`
- Description:
  - Print the message to tty and wait for user typing from stdin.
  - It will print 'YES' when user types y/Y/ye/Ye/yE/YE/yes/yES/yeS/YeS/Yes/YEs/YES.
  - It will print 'NO' when user types n/N/no/No/nO/NO.
  - It will print 'CANCEL' when user types c/C/cancel/CANCEL.
  - It prints default value when get empty answer.
  - When default=Y, it prints 'YES' by default.
  - When default=N, it prints 'NO' by default.
  - When default='', there is no default value. It will keep asking until user typed right answer.
  - **Attention: "echo invalid_string | l.ask message" will fall into a infinite loop.**
  - "echo y | l.ask message" and "echo n | l.ask message" are valid.
- Dependent: [`ask`](./prompt.md#ask)
- Since: 0.5.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/ask_with_cancel.bats](../../tests/modules/ask_with_cancel.bats)
- Source Code: [src/modules/ask_with_cancel.bash](../../src/modules/ask_with_cancel.bash)
- Example: [example/modules/ask_with_cancel](../../example/modules/ask_with_cancel)

### choose

- Usage: `l.choose <item>...`
- Description: Prompt user to choose one item from options. The function will return the value of chosen item.
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/choose.bats](../../tests/modules/choose.bats)
- Source Code: [src/modules/choose.bash](../../src/modules/choose.bash)
- Example: [example/modules/choose](../../example/modules/choose)

[⬆️ Back up to TOC](#toc)
