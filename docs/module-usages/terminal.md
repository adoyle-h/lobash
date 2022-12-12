# Category: Terminal

[⬅️ Back to previous page](./README.md)

## TOC

- [cursor_col](#cursor_col)
- [cursor_pos](#cursor_pos)
- [cursor_row](#cursor_row)

## Modules

### cursor_col

- Usage: `l.cursor_col`
- Description: Get column number of current cursor position.
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Source Code: [src/modules/cursor_col.bash](../../src/modules/cursor_col.bash)

### cursor_pos

- Usage:
  - `l.cursor_pos [<array_name>]`
  - `{ IFS=';'; pos=( $(l.cursor_pos) ); }`
- Description:
  - Get current cursor position.
  - If `[<array_name>]` passed, it will assign row to `${array_name[0]}`, and col to `${array_name[1]}`.
  - If `[<array_name>]` not passed, it will print "row;column".
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Source Code: [src/modules/cursor_pos.bash](../../src/modules/cursor_pos.bash)
- Example: [example/modules/cursor_pos](../../example/modules/cursor_pos)

### cursor_row

- Usage: `l.cursor_row`
- Description: Get row number of current cursor position.
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Source Code: [src/modules/cursor_row.bash](../../src/modules/cursor_row.bash)

[⬆️ Back up to TOC](#toc)
