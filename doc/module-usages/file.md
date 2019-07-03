# Category: File

[⬅️ Back to previous page](./README.md)

## TOC

- [count_file_lines](#count_file_lines)
- [count_files](#count_files)
- [extname](#extname)
- [extname.p](#extname.p)

## Modules

### count_file_lines

- Usage: `l.count_file_lines <filepath>`
- Description: Count lines of file. Similar to `wc -l`.
- Since: 0.1.0
- Test Cases: [tests/modules/count_file_lines.bats](../../tests/modules/count_file_lines.bats)
- Source Code: [src/modules/count_file_lines.bash](../../src/modules/count_file_lines.bash)

### count_files

- Usage: `l.count_files <directory_path>`
- Description: Count the sum of files under `<directory_path>`.
- Since: 0.1.0
- Test Cases: [tests/modules/count_files.bats](../../tests/modules/count_files.bats)
- Source Code: [src/modules/count_files.bash](../../src/modules/count_files.bash)

### extname

- Usage: `l.extname <path>`
- Description: Returns the extension of the path, from the last occurrence of the . (period) character to end of string in the last portion of the path. If there is no . in the last portion of the path, or if the first character of the basename of path (see path.basename()) is ., then an empty string is returned.
- Since: 0.1.0
- Test Cases: [tests/modules/extname.bats](../../tests/modules/extname.bats)
- Source Code: [src/modules/extname.bash](../../src/modules/extname.bash)

### extname.p

- Usage: `echo <path> | l.extname.p`
- Description: The pipeline of l.extname
- Dependent: [`extname`](./file.md#extname)
- Since: 0.1.0
- Test Cases: [tests/modules/extname.p.bats](../../tests/modules/extname.p.bats)
- Source Code: [src/modules/extname.p.bash](../../src/modules/extname.p.bash)

[⬆️ Back up to TOC](#toc)
