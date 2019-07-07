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
- Test Cases: [tests/modules/cursor_col.bats](../../tests/modules/cursor_col.bats)
- Source Code: [src/modules/cursor_col.bash](../../src/modules/cursor_col.bash)

### cursor_pos

- Usage:
  - `l.cursor_pos`
  - `IFS=';' c_pos=( $(l.cursor_pos) )`
- Description: Get current cursor position. It will print "row;column" with default IFS.
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/cursor_pos.bats](../../tests/modules/cursor_pos.bats)
- Source Code: [src/modules/cursor_pos.bash](../../src/modules/cursor_pos.bash)

### cursor_row

- Usage: `l.cursor_row`
- Description: Get row number of current cursor position.
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/cursor_row.bats](../../tests/modules/cursor_row.bats)
- Source Code: [src/modules/cursor_row.bash](../../src/modules/cursor_row.bash)

[⬆️ Back up to TOC](#toc)
