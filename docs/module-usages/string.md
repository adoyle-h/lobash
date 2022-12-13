# Category: String

[⬅️ Back to previous page](./README.md)

## TOC

- [count_lines.p](#count_linesp)
- [join](#join)
- [lower_case](#lower_case)
- [lower_case.p](#lower_casep)
- [lower_first](#lower_first)
- [lower_first.p](#lower_firstp)
- [match](#match)
- [match_list](#match_list)
- [split](#split)
- [str_len](#str_len)
- [str_replace](#str_replace)
- [str_replace_all](#str_replace_all)
- [str_replace_last](#str_replace_last)
- [str_size](#str_size)
- [trim](#trim)
- [trim.p](#trimp)
- [trim_color](#trim_color)
- [trim_color.p](#trim_colorp)
- [trim_end](#trim_end)
- [trim_end.p](#trim_endp)
- [trim_start](#trim_start)
- [trim_start.p](#trim_startp)
- [upper_case](#upper_case)
- [upper_case.p](#upper_casep)
- [upper_first](#upper_first)
- [upper_first.p](#upper_firstp)

## Modules

### count_lines.p

- Usage: `echo <string> | l.count_lines.p`
- Description:
  - Count lints of string like `wc -l`.
  - The Bash command substitution always trim blank line. So pass argument in pipeline.
  - Refer to https://stackoverflow.com/a/37706905
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/count_lines.p.bats](../../tests/modules/count_lines.p.bats)
- Source Code: [src/modules/count_lines.p.bash](../../src/modules/count_lines.p.bash)
- Example: [example/modules/count_lines](../../example/modules/count_lines)

### join

- Usage: `l.join <array_name> [<delimiter>=,]`
- Description: Convert all elements in array into a string separated by delimiter.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/join.bats](../../tests/modules/join.bats)
- Source Code: [src/modules/join.bash](../../src/modules/join.bash)

### lower_case

- Usage: `l.lower_case <string>`
- Description: Convert all characters of string to lower case.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/lower_case.bats](../../tests/modules/lower_case.bats)
- Source Code: [src/modules/lower_case.bash](../../src/modules/lower_case.bash)

### lower_case.p

- Usage: `echo <string> | l.lower_case.p`
- Description: The pipeline version of l.lower_case
- Dependent: [`lower_case`](./string.md#lower_case)
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/lower_case.p.bats](../../tests/modules/lower_case.p.bats)
- Source Code: [src/modules/lower_case.p.bash](../../src/modules/lower_case.p.bash)

### lower_first

- Usage: `l.lower_first <string>`
- Description: Convert the first character of string to lower case.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/lower_first.bats](../../tests/modules/lower_first.bats)
- Source Code: [src/modules/lower_first.bash](../../src/modules/lower_first.bash)

### lower_first.p

- Usage: `echo <string> | l.lower_first.p`
- Description: The pipeline version of l.lower_first
- Dependent: [`lower_first`](./string.md#lower_first)
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/lower_first.p.bats](../../tests/modules/lower_first.p.bats)
- Source Code: [src/modules/lower_first.p.bash](../../src/modules/lower_first.p.bash)

### match

- Usage: `l.match "string" "regex" [index=1]`
- Description: Return matched part of string. Return empty string if no matched. Support capturing groups.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/match.bats](../../tests/modules/match.bats)
- Source Code: [src/modules/match.bash](../../src/modules/match.bash)

### match_list

- Usage: `l.match_list <string> <regex> <output_array_name>`
- Description: Match multi strings with Regex Capturing Groups. The matched parts will be put in `<output_array_name>`.
- Since: 0.4.0
- Bash: 4.0+
- Test Cases: [tests/modules/match_list.bats](../../tests/modules/match_list.bats)
- Source Code: [src/modules/match_list.bash](../../src/modules/match_list.bash)

### split

- Usage:
  - `l.split <string> <output_array_name> [<delimiter>=' ']`
  - `l.read_array <output_array_name> < <(l.split <string> - [<delimiter>=' '])`
- Description:
  - Splits string by delimiter. The delimiter defaults to ` `.
  - If `<output_array_name>` equals `-`, the result will be printed to stdout.
  - Otherwise, the result will be assigned to `<output_array_name>`.
- Since: 0.1.0
- Bash: 4.0+
- **Notice**:
  - **When in subshell, you must call `l.split <string> - [<delimiter>=' ']`.**
  - **The `l.split <string> <output_array_name>` not works in subshell.**
- Test Cases: [tests/modules/split.bats](../../tests/modules/split.bats)
- Source Code: [src/modules/split.bash](../../src/modules/split.bash)

### str_len

- Usage: `l.str_len <string>`
- Description: Return the byte length of string.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/str_len.bats](../../tests/modules/str_len.bats)
- Source Code: [src/modules/str_len.bash](../../src/modules/str_len.bash)

### str_replace

- Usage: `l.str_replace <string> <pattern> <replace>`
- Description: The first longest match of `<pattern>` is replaced with `<replace>`.
- Since: 0.5.0
- Bash: 4.0+
- Test Cases: [tests/modules/str_replace.bats](../../tests/modules/str_replace.bats)
- Source Code: [src/modules/str_replace.bash](../../src/modules/str_replace.bash)

### str_replace_all

- Usage: `l.str_replace_all <string> <pattern> <replace>`
- Description: All matches of `<pattern>` are replaced with `<replace>`.
- Since: 0.5.0
- Bash: 4.0+
- Test Cases: [tests/modules/str_replace_all.bats](../../tests/modules/str_replace_all.bats)
- Source Code: [src/modules/str_replace_all.bash](../../src/modules/str_replace_all.bash)

### str_replace_last

- Usage: `l.str_replace_last <string> <pattern> <replace>`
- Description: The first longest match of `<pattern>` is replaced with `<replace>`. But it matches from the end of string to the head.
- Since: 0.5.0
- Bash: 4.0+
- Test Cases: [tests/modules/str_replace_last.bats](../../tests/modules/str_replace_last.bats)
- Source Code: [src/modules/str_replace_last.bash](../../src/modules/str_replace_last.bash)

### str_size

- Usage: `l.str_size <string>`
- Description: Return the sum of string letters.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/str_size.bats](../../tests/modules/str_size.bats)
- Source Code: [src/modules/str_size.bash](../../src/modules/str_size.bash)

### trim

- Usage: `l.trim <string>`
- Description: Remove leading and trailing whitespace from string.
- Dependent: [`trim_start`](./string.md#trim_start) [`trim_end`](./string.md#trim_end)
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/trim.bats](../../tests/modules/trim.bats)
- Source Code: [src/modules/trim.bash](../../src/modules/trim.bash)
- Example: [example/modules/trim](../../example/modules/trim)

### trim.p

- Usage: `echo <string> | l.trim.p`
- Description: The pipeline version of l.trim
- Dependent: [`trim`](./string.md#trim)
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/trim.p.bats](../../tests/modules/trim.p.bats)
- Source Code: [src/modules/trim.p.bash](../../src/modules/trim.p.bash)
- Example: [example/modules/trim](../../example/modules/trim)

### trim_color

- Usage: `l.trim_color <string>`
- Description: Remove color escape code in string
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/trim_color.bats](../../tests/modules/trim_color.bats)
- Source Code: [src/modules/trim_color.bash](../../src/modules/trim_color.bash)

### trim_color.p

- Usage: `echo <string> | l.trim_color.p`
- Description: The pipeline version of l.trim_color
- Dependent: [`trim_color`](./string.md#trim_color)
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/trim_color.p.bats](../../tests/modules/trim_color.p.bats)
- Source Code: [src/modules/trim_color.p.bash](../../src/modules/trim_color.p.bash)

### trim_end

- Usage: `l.trim_end <string> [chars=[[:space:]]]`
- Description: Remove trailing whitespace or specified characters from string.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/trim_end.bats](../../tests/modules/trim_end.bats)
- Source Code: [src/modules/trim_end.bash](../../src/modules/trim_end.bash)

### trim_end.p

- Usage: `echo <string> | l.trim_end.p [chars=[[:space:]]]`
- Description: The pipeline version l.trim_end
- Dependent: [`trim_end`](./string.md#trim_end)
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/trim_end.p.bats](../../tests/modules/trim_end.p.bats)
- Source Code: [src/modules/trim_end.p.bash](../../src/modules/trim_end.p.bash)

### trim_start

- Usage: `l.trim_start <string> [<chars>=[[:space:]]]`
- Description: Remove leading whitespace or specified characters from string.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/trim_start.bats](../../tests/modules/trim_start.bats)
- Source Code: [src/modules/trim_start.bash](../../src/modules/trim_start.bash)

### trim_start.p

- Usage: `echo <string> | l.trim_start.p [<chars>=[[:space:]]]`
- Description: The pipeline version of l.trim_start
- Dependent: [`trim_start`](./string.md#trim_start)
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/trim_start.p.bats](../../tests/modules/trim_start.p.bats)
- Source Code: [src/modules/trim_start.p.bash](../../src/modules/trim_start.p.bash)

### upper_case

- Usage: `l.upper_case <string>`
- Description: Convert all characters of string to upper case.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/upper_case.bats](../../tests/modules/upper_case.bats)
- Source Code: [src/modules/upper_case.bash](../../src/modules/upper_case.bash)

### upper_case.p

- Usage: `echo <string> | l.upper_case.p`
- Description: The pipeline version of l.upper_case
- Dependent: [`upper_case`](./string.md#upper_case)
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/upper_case.p.bats](../../tests/modules/upper_case.p.bats)
- Source Code: [src/modules/upper_case.p.bash](../../src/modules/upper_case.p.bash)

### upper_first

- Usage: `l.upper_first <string>`
- Description: Convert the first character of string to upper case.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/upper_first.bats](../../tests/modules/upper_first.bats)
- Source Code: [src/modules/upper_first.bash](../../src/modules/upper_first.bash)

### upper_first.p

- Usage: `echo <string> | l.upper_first.p`
- Description: The pipeline version of l.upper_first
- Dependent: [`upper_first`](./string.md#upper_first)
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/upper_first.p.bats](../../tests/modules/upper_first.p.bats)
- Source Code: [src/modules/upper_first.p.bash](../../src/modules/upper_first.p.bash)

[⬆️ Back up to TOC](#toc)
