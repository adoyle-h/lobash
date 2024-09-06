# Category: Variable

[⬅️ Back to previous page](./README.md)

## TOC

- [cur_function_name](#cur_function_name)
- [random](#random)
- [var_attrs](#var_attrs)
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

### var_attrs

- Usage: `l.var_attrs <var_name>`
- Description:
  - Return the attributions of variable.
  - If variable undefined, return ''.
- Since: 0.7.0
- Bash: 4.0+
- **Notice**:
  - **Only with bash 4.3, this function return 1 when the variable declared without initialization.**
  - **Because `declare -p a` shows `declare: a: not found` when `declare -a a`. It's a bug in bash 4.3.**
- Test Cases: [tests/modules/var_attrs.bats](../../tests/modules/var_attrs.bats)
- Source Code: [src/modules/var_attrs.bash](../../src/modules/var_attrs.bash)

### xdg_config_home

- Usage: `l.xdg_config_home`
- Description: Return XDG_CONFIG_HOME. Return `${HOME}/.config` if XDG_CONFIG_HOME not set.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/xdg_config_home.bats](../../tests/modules/xdg_config_home.bats)
- Source Code: [src/modules/xdg_config_home.bash](../../src/modules/xdg_config_home.bash)

[⬆️ Back up to TOC](#toc)
