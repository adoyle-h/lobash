# Category: Terminal

[⬅️ Back to previous page](./README.md)

## TOC

- [cursor_col](#cursor_col)
- [cursor_pos](#cursor_pos)
- [cursor_row](#cursor_row)
- [term_size](#term_size)

## Modules

### cursor_col

- Usage: `l.cursor_col`
- Description: Get column number of current cursor position.
- Since: 0.1.0
- Bash: 4.0+
- Source Code: [src/modules/cursor_col.bash](../../src/modules/cursor_col.bash)

### cursor_pos

- Usage: `l.cursor_pos [<array_name>]`
- Description:
  - Get current cursor position.
  - If `<array_name>` passed, it will assign row to `${array_name[0]}`, and col to `${array_name[1]}`.
  - Otherwise, it prints `$row\n$column\n`.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/cursor_pos.bats](../../tests/modules/cursor_pos.bats)
- Source Code: [src/modules/cursor_pos.bash](../../src/modules/cursor_pos.bash)
- Example: [example/modules/cursor_pos](../../example/modules/cursor_pos)

### cursor_row

- Usage: `l.cursor_row`
- Description: Get row number of current cursor position.
- Since: 0.1.0
- Bash: 4.0+
- Source Code: [src/modules/cursor_row.bash](../../src/modules/cursor_row.bash)

### term_size

- Usage: `l.term_size`
- Description:
  - Print the terminal size. Format: `$lines\n$columns\n`
  - You can use `l.read_array term < <(l.term_size)` to create an array.
- Since: 0.6.0
- Bash: 4.0+
- Test Cases: [tests/modules/term_size.bats](../../tests/modules/term_size.bats)
- Source Code: [src/modules/term_size.bash](../../src/modules/term_size.bash)

[⬆️ Back up to TOC](#toc)
