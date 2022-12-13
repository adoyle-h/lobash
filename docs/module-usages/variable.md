# Category: Variable

[⬅️ Back to previous page](./README.md)

## TOC

- [cur_function_name](#cur_function_name)
- [random](#random)
- [xdg_config_home](#xdg_config_home)

## Modules

### cur_function_name

- Usage: `l.cur_function_name`
- Description: Return the name of current function where the l.cur_function_name called in.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/cur_function_name.bats](../../tests/modules/cur_function_name.bats)
- Source Code: [src/modules/cur_function_name.bash](../../src/modules/cur_function_name.bash)
- Example: [example/modules/cur_function_name](../../example/modules/cur_function_name)

### random

- Usage: `l.random [<length>=10] [<pattern>=a-zA-Z0-9@#*=[]]`
- Description:
  - Return a random string in specific length. It must be a positive integer.
  - The `<pattern>` is allowed characters in range.
  - This function requires `dd` command available in system.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/random.bats](../../tests/modules/random.bats)
- Source Code: [src/modules/random.bash](../../src/modules/random.bash)

### xdg_config_home

- Usage: `l.xdg_config_home`
- Description: Return XDG_CONFIG_HOME. Return `${HOME}/.config` if XDG_CONFIG_HOME not set.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/xdg_config_home.bats](../../tests/modules/xdg_config_home.bats)
- Source Code: [src/modules/xdg_config_home.bash](../../src/modules/xdg_config_home.bash)

[⬆️ Back up to TOC](#toc)
