# Module Usages

15 Categories, 91 Modules, 494 Test Cases.

## TOC

- [Arithmetic](#arithmetic)
  - [inc](#inc)
  - [sub](#sub)
- [Array](#array)
  - [array_include](#array_include)
  - [first](#first)
  - [last](#last)
  - [sort](#sort)
  - [union_array](#union_array)
- [Color](#color)
  - [hex_to_rgb](#hex_to_rgb)
  - [rgb_to_hex](#rgb_to_hex)
- [Condition](#condition)
  - [has](#has)
  - [if](#if)
  - [is_array](#is_array)
  - [is_bash](#is_bash)
  - [is_dir](#is_dir)
  - [is_executable](#is_executable)
  - [is_executable_file](#is_executable_file)
  - [is_false](#is_false)
  - [is_file](#is_file)
  - [is_float](#is_float)
  - [is_integer](#is_integer)
  - [is_link](#is_link)
  - [is_number](#is_number)
  - [is_readable](#is_readable)
  - [is_true](#is_true)
  - [is_writeable](#is_writeable)
  - [is_zsh](#is_zsh)
  - [not](#not)
  - [not.p](#not.p)
  - [strict_has](#strict_has)
  - [strict_has_not](#strict_has_not)
- [Console](#console)
  - [echo](#echo)
  - [echo_array](#echo_array)
- [Debug](#debug)
  - [trace_count](#trace_count)
  - [trace_end](#trace_end)
  - [trace_stack](#trace_stack)
  - [trace_start](#trace_start)
  - [trace_time](#trace_time)
- [File](#file)
  - [count_file_lines](#count_file_lines)
  - [count_files](#count_files)
  - [extname](#extname)
  - [extname.p](#extname.p)
- [Path](#path)
  - [basename](#basename)
  - [basename.p](#basename.p)
  - [dirname](#dirname)
  - [dirname.p](#dirname.p)
  - [normalize](#normalize)
  - [normalize.p](#normalize.p)
  - [pwd](#pwd)
- [Prompt](#prompt)
  - [ask](#ask)
  - [choose](#choose)
- [String](#string)
  - [count_lines](#count_lines)
  - [count_lines.p](#count_lines.p)
  - [end_with](#end_with)
  - [join](#join)
  - [lower_case](#lower_case)
  - [lower_case.p](#lower_case.p)
  - [lower_first](#lower_first)
  - [lower_first.p](#lower_first.p)
  - [match](#match)
  - [split](#split)
  - [start_with](#start_with)
  - [str_include](#str_include)
  - [str_len](#str_len)
  - [str_size](#str_size)
  - [trim](#trim)
  - [trim.p](#trim.p)
  - [trim_color](#trim_color)
  - [trim_color.p](#trim_color.p)
  - [trim_end](#trim_end)
  - [trim_end.p](#trim_end.p)
  - [trim_start](#trim_start)
  - [trim_start.p](#trim_start.p)
  - [upper_case](#upper_case)
  - [upper_case.p](#upper_case.p)
  - [upper_first](#upper_first)
  - [upper_first.p](#upper_first.p)
- [System](#system)
  - [detect_os](#detect_os)
  - [hostname](#hostname)
  - [sleep](#sleep)
- [Terminal](#terminal)
  - [cursor_col](#cursor_col)
  - [cursor_pos](#cursor_pos)
  - [cursor_row](#cursor_row)
- [Time](#time)
  - [date](#date)
  - [now](#now)
  - [now_s](#now_s)
- [Util](#util)
  - [benchmark](#benchmark)
  - [compose](#compose)
  - [repeat](#repeat)
- [Variable](#variable)
  - [cur_function_name](#cur_function_name)
  - [random](#random)
  - [xdg_config_home](#xdg_config_home)

## Arithmetic

### inc

- Usage: `l.inc <var_name> [<addend>=1]`
- Description: Increase number with addend.
- Since: 0.1.0
- More Examples: [../tests/modules/inc.bats](../tests/modules/inc.bats)

### sub

- Usage: `l.sub <var_name> [<subtrahend>=1]`
- Description: Subtract number with subtrahend.
- Since: 0.1.0
- More Examples: [../tests/modules/sub.bats](../tests/modules/sub.bats)

## Array

### array_include

- Usage: `l.array_include <array_name> <match>`
- Since: 0.1.0
- More Examples: [../tests/modules/array_include.bats](../tests/modules/array_include.bats)

### first

- Usage: `l.first <array_name>`
- Description: Return the first value of array.
- Since: 0.1.0
- More Examples: [../tests/modules/first.bats](../tests/modules/first.bats)

### last

- Usage: `l.last <array_name>`
- Description: Return the last value of array.
- Since: 0.1.0
- More Examples: [../tests/modules/last.bats](../tests/modules/last.bats)

### sort

- Usage: `l.sort <array_name> [<sort-opts>]...`
- Description: Sort an array. The `<sort-opts>` are options of sort command.
- Since: 0.1.0
- More Examples: [../tests/modules/sort.bats](../tests/modules/sort.bats)

### union_array

- Usage: `l.union_array <array_name>...`
- Description: Create an array of unique values from all given arrays.
- Dependent: [`echo_array`](#echo_array)
- Since: 0.1.0
- More Examples: [../tests/modules/union_array.bats](../tests/modules/union_array.bats)

## Color

### hex_to_rgb

- Usage: `l.hex_to_rgb <HEX>`
- Description: Return a list contains `<R> <G> <B>`.
- Since: 0.1.0
- More Examples: [../tests/modules/hex_to_rgb.bats](../tests/modules/hex_to_rgb.bats)

### rgb_to_hex

- Usage: `l.rgb_to_hex <R> <G> <B>`
- Description: Return hex string. Like '#ffffff'
- Dependent: [`is_number`](#is_number)
- Since: 0.1.0
- More Examples: [../tests/modules/rgb_to_hex.bats](../tests/modules/rgb_to_hex.bats)

## Condition

### has

- Usage:
  - `l.has <condition> <what>`
  - `l.has not <condition> <what>`
- Description:
  - Exit with 0 or 1. Check if command/function/alias/keyword/builtin or anything existed.
  - `<condition>` Valid value: `command`, `function`, `alias`, `keyword`, `builtin`, `the`
  - This method is not recommended. Use strict_has instead.
- Since: 0.1.0
- More Examples: [../tests/modules/has.bats](../tests/modules/has.bats)

### if

- Usage: `l.if <condition> <then> [<else>]`
- Description:
  - The difference from shell builtin `if` is when condition function throw exception it will ended immediately.
  - `<condition>` can be function name, string and number. The function should return `true`/`0` or `false`/`1`.
  - `<then>` and `<else>` must be function name. And `<else>` is optional.
  - When `<condition>` is true, `<then>` function will be invoked. Otherwise `<else>` will be invoked if it passed.
- Since: 0.1.0
- More Examples: [../tests/modules/if.bats](../tests/modules/if.bats)

### is_array

- Usage: `l.is_array <var_name>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- More Examples: [../tests/modules/is_array.bats](../tests/modules/is_array.bats)

### is_bash

- Usage: `l.is_bash`
- Description: Return `true` or `false`.
- Since: 0.1.0
- More Examples: [../tests/modules/is_bash.bats](../tests/modules/is_bash.bats)

### is_dir

- Usage: `l.is_dir <path>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- More Examples: [../tests/modules/is_dir.bats](../tests/modules/is_dir.bats)

### is_executable

- Usage: `l.is_executable <path>`
- Description: Similar to `[[ -x ]]`. Return `true` or `false`.
- Since: 0.1.0
- More Examples: [../tests/modules/is_executable.bats](../tests/modules/is_executable.bats)

### is_executable_file

- Usage: `l.is_executable_file <path>`
- Description: Similar to `l.is_executable`. But if `<path>` is directory it will return false.
- Dependent: [`is_dir`](#is_dir)
- Since: 0.1.0
- More Examples: [../tests/modules/is_executable_file.bats](../tests/modules/is_executable_file.bats)

### is_false

- Usage: `l.is_false <var>`
- Description: Return `true` or `false`.
- Dependent: [`is_integer`](#is_integer)
- Since: 0.1.0
- More Examples: [../tests/modules/is_false.bats](../tests/modules/is_false.bats)

### is_file

- Usage: `l.is_file <path>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- More Examples: [../tests/modules/is_file.bats](../tests/modules/is_file.bats)

### is_float

- Usage: `l.is_float <str>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- More Examples: [../tests/modules/is_float.bats](../tests/modules/is_float.bats)

### is_integer

- Usage: `l.is_integer <str>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- More Examples: [../tests/modules/is_integer.bats](../tests/modules/is_integer.bats)

### is_link

- Usage: `l.is_link <path>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- More Examples: [../tests/modules/is_link.bats](../tests/modules/is_link.bats)

### is_number

- Usage: `l.is_number <str>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- More Examples: [../tests/modules/is_number.bats](../tests/modules/is_number.bats)

### is_readable

- Usage: `l.is_readable <path>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- More Examples: [../tests/modules/is_readable.bats](../tests/modules/is_readable.bats)

### is_true

- Usage: `l.is_true <str>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- More Examples: [../tests/modules/is_true.bats](../tests/modules/is_true.bats)

### is_writeable

- Usage: `l.is_writeable <path>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- More Examples: [../tests/modules/is_writeable.bats](../tests/modules/is_writeable.bats)

### is_zsh

- Usage: `l.is_zsh`
- Description: Return `true` or `false`.
- Since: 0.1.0
- More Examples: [../tests/modules/is_zsh.bats](../tests/modules/is_zsh.bats)

### not

- Usage: `l.not <condition>`
- Description: `<condition>` must be `true` or `false`. This function returns the opposite value.
- Since: 0.1.0
- More Examples: [../tests/modules/not.bats](../tests/modules/not.bats)

### not.p

- Usage: `echo <condition> | l.not.p`
- Description: The pipeline version of l.not
- Dependent: [`not`](#not)
- Since: 0.1.0
- More Examples: [../tests/modules/not.p.bats](../tests/modules/not.p.bats)

### strict_has

- Usage: `l.strict_has <condition> <what>`
- Description:
  - Return `true` or `false`. Check if command/function/alias/keyword/builtin or anything existed.
  - `<condition>` Valid value: `command`, `function`, `alias`, `keyword`, `builtin`, `the`
- Since: 0.1.0
- More Examples: [../tests/modules/strict_has.bats](../tests/modules/strict_has.bats)

### strict_has_not

- Usage: `strict_has_not <condition> <what>`
- Description: Opposite to strict_has.
- Dependent: [`strict_has`](#strict_has) [`not`](#not)
- Since: 0.1.0
- More Examples: [../tests/modules/strict_has_not.bats](../tests/modules/strict_has_not.bats)

## Console

### echo

- Usage: `l.echo <string>...`
- Description:
  - A easy and safe way to print string. Not support any options.
  - The builtin echo will get unexpected result while execute `b=( -n 123 ); echo "${b[@]}"`.
  - See https://github.com/anordal/shellharden/blob/master/how_to_do_things_safely_in_bash.md#echo--printf
- Since: 0.1.0
- More Examples: [../tests/modules/echo.bats](../tests/modules/echo.bats)

### echo_array

- Usage: `l.echo_array <array_name>`
- Description: Print each values of array with newline.
- Since: 0.1.0
- More Examples: [../tests/modules/echo_array.bats](../tests/modules/echo_array.bats)

## Debug

### trace_count

- Usage: `l.trace_count [<label>=trace]`
- Description:
  - It prints a count which increased after each called.
  - Attention: l.trace_count should run in same process. It will not work in subprocess such as $(l.trace_count)
- Since: 0.1.0
- More Examples: [../tests/modules/trace_count.bats](../tests/modules/trace_count.bats)

### trace_end

- Usage: `l.trace_end`
- Description: Close xtrace mode and reset PS4. Cooperated with trace_start.
- Since: 0.1.0
- More Examples: [../tests/modules/trace_end.bats](../tests/modules/trace_end.bats)

### trace_stack

- Usage: `l.trace_stack [label]`
- Description: Print current function stack for debug.
- Since: 0.1.0
- Executable Example: [../example/modules/trace_stack](../example/modules/trace_stack)
- More Examples: [../tests/modules/trace_stack.bats](../tests/modules/trace_stack.bats)

### trace_start

- Usage: `l.trace_start [<PS4_level>=2] [<label>]`
- Description:
  - PS4_level  Valid Values: `1`, `2`, `3`. Different level changes different prompt message format.
  - Open xtrace mode and set PS4. It will print each script line with nice prompt for debug.
- Since: 0.1.0
- More Examples: [../tests/modules/trace_start.bats](../tests/modules/trace_start.bats)

### trace_time

- Usage: `l.trace_time [label]`
- Description: Print current timestamp, last timestamp and the elapsed time in millisecond.
- Dependent: [`now`](#now)
- Since: 0.1.0
- More Examples: [../tests/modules/trace_time.bats](../tests/modules/trace_time.bats)

## File

### count_file_lines

- Usage: `l.count_file_lines <filepath>`
- Description: Count lines of file. Similar to `wc -l`.
- Since: 0.1.0
- More Examples: [../tests/modules/count_file_lines.bats](../tests/modules/count_file_lines.bats)

### count_files

- Usage: `l.count_files <directory_path>`
- Description: Count the sum of files under `<directory_path>`.
- Since: 0.1.0
- More Examples: [../tests/modules/count_files.bats](../tests/modules/count_files.bats)

### extname

- Usage: `l.extname <path>`
- Description: Returns the extension of the path, from the last occurrence of the . (period) character to end of string in the last portion of the path. If there is no . in the last portion of the path, or if the first character of the basename of path (see path.basename()) is ., then an empty string is returned.
- Since: 0.1.0
- More Examples: [../tests/modules/extname.bats](../tests/modules/extname.bats)

### extname.p

- Usage: `echo <path> | l.extname.p`
- Description: The pipeline of l.extname
- Dependent: [`extname`](#extname)
- Since: 0.1.0
- More Examples: [../tests/modules/extname.p.bats](../tests/modules/extname.p.bats)

## Path

### basename

- Usage: `l.basename <path>`
- Description: Alternative to basename command. It much faster because using shell parameter expansion.
- Since: 0.1.0
- More Examples: [../tests/modules/basename.bats](../tests/modules/basename.bats)

### basename.p

- Usage: `echo <path> | l.basename.p`
- Description: The pipeline version of l.basename
- Dependent: [`basename`](#basename)
- Since: 0.1.0
- More Examples: [../tests/modules/basename.p.bats](../tests/modules/basename.p.bats)

### dirname

- Usage: `l.dirname <path>`
- Description: Alternative to dirname command. It much faster because using shell parameter expansion.
- Since: 0.1.0
- More Examples: [../tests/modules/dirname.bats](../tests/modules/dirname.bats)

### dirname.p

- Usage: `echo <path> | l.dirname.p`
- Description: The pipeline version of l.dirname
- Since: 0.1.0
- More Examples: [../tests/modules/dirname.p.bats](../tests/modules/dirname.p.bats)

### normalize

- Usage: `l.normalize <path>`
- Description:
  - Normalize the given path which can be an unexisted path.
  - Trailing `/` always be removed.
- Dependent: [`split`](#split) [`join`](#join)
- Since: 0.1.0
- More Examples: [../tests/modules/normalize.bats](../tests/modules/normalize.bats)

### normalize.p

- Usage: `echo <path> | l.normalize.p`
- Description: The pipeline version of l.normalize
- Dependent: [`normalize`](#normalize)
- Since: 0.1.0
- More Examples: [../tests/modules/normalize.p.bats](../tests/modules/normalize.p.bats)

### pwd

- Usage: `l.pwd`
- Description: Return the current working directory as set by the `cd` builtin command.
- Since: 0.1.0
- More Examples: [../tests/modules/pwd.bats](../tests/modules/pwd.bats)

## Prompt

### ask

- Usage: `l.ask <message> [<default>=Y]`
- Description:
  - Print a message and read Yes/No answer from stdin.
  - when default=Y, if will return YES by default.
  - when default=N, if will return NO by default.
- Dependent: [`lower_case`](#lower_case)
- Since: 0.1.0
- Executable Example: [../example/modules/ask](../example/modules/ask)
- More Examples: [../tests/modules/ask.bats](../tests/modules/ask.bats)

### choose

- Usage: `l.choose <item>...`
- Description: Prompt user to choose one item from options. The function will return the value of chosen item.
- Dependent: [`is_integer`](#is_integer)
- Since: 0.1.0
- Executable Example: [../example/modules/choose](../example/modules/choose)
- More Examples: [../tests/modules/choose.bats](../tests/modules/choose.bats)

## String

### count_lines

- Usage: `l.count_lines <string>`
- Description:
  - Count lints of string like `wc -l`.
  - The Bash command substitution always trim blank line. So l.count_lines do not accept normal parameter passing.
  - Refer to https://stackoverflow.com/a/37706905
- Since: 0.1.0
- Executable Example: [../example/modules/count_lines](../example/modules/count_lines)
- More Examples: [../tests/modules/count_lines.bats](../tests/modules/count_lines.bats)

### count_lines.p

- Usage: `echo <string> | l.count_lines.p`
- Description: The pipeline version of l.count_lines
- Since: 0.1.0
- Executable Example: [../example/modules/count_lines](../example/modules/count_lines)
- More Examples: [../tests/modules/count_lines.p.bats](../tests/modules/count_lines.p.bats)

### end_with

- Usage: `l.end_with <string> <match>`
- Description: Return `true` or `false`.
- Since: 0.1.0
- More Examples: [../tests/modules/end_with.bats](../tests/modules/end_with.bats)

### join

- Usage: `l.join <array_name> [<delimiter>=,]`
- Description: Convert all elements in array into a string separated by delimiter.
- Since: 0.1.0
- More Examples: [../tests/modules/join.bats](../tests/modules/join.bats)

### lower_case

- Usage: `l.lower_case <string>`
- Description: Convert all characters of string to lower case.
- Since: 0.1.0
- More Examples: [../tests/modules/lower_case.bats](../tests/modules/lower_case.bats)

### lower_case.p

- Usage: `echo <string> | l.lower_case.p`
- Description: The pipeline version of l.lower_case
- Dependent: [`lower_case`](#lower_case)
- Since: 0.1.0
- More Examples: [../tests/modules/lower_case.p.bats](../tests/modules/lower_case.p.bats)

### lower_first

- Usage:
  - `l.lower_first <string>`
  - `echo <string> | l.lower_first`
- Description: Convert the first character of string to lower case.
- Since: 0.1.0
- More Examples: [../tests/modules/lower_first.bats](../tests/modules/lower_first.bats)

### lower_first.p

- Usage: `echo <string> | l.lower_first.p`
- Description: The pipeline version of l.lower_first
- Dependent: [`lower_first`](#lower_first)
- Since: 0.1.0
- More Examples: [../tests/modules/lower_first.p.bats](../tests/modules/lower_first.p.bats)

### match

- Usage: `l.match "string" "regex" [index=1]`
- Description: Return matched part of string. Return empty string if no matched. Support capturing groups.
- Since: 0.1.0
- More Examples: [../tests/modules/match.bats](../tests/modules/match.bats)

### split

- Usage: `l.split <string> <output_array_name> [<delimiter>=' ']`
- Description: Splits string by delimiter. The result will be assigned to `<output_array_name>`.
- Since: 0.1.0
- More Examples: [../tests/modules/split.bats](../tests/modules/split.bats)

### start_with

- Usage: `l.start_with <string> <match>`
- Description: Return `true` or `false`. Check if a string starts with given match string.
- Since: 0.1.0
- More Examples: [../tests/modules/start_with.bats](../tests/modules/start_with.bats)

### str_include

- Usage: `str_include <string> <sub-string>`
- Description: Return `true` or `false`. Check if a string includes given match string.
- Since: 0.1.0
- More Examples: [../tests/modules/str_include.bats](../tests/modules/str_include.bats)

### str_len

- Usage: `l.str_len <string>`
- Description: Return the byte length of string.
- Since: 0.1.0
- More Examples: [../tests/modules/str_len.bats](../tests/modules/str_len.bats)

### str_size

- Usage: `l.str_size <string>`
- Description: Return the sum of string letters.
- Since: 0.1.0
- More Examples: [../tests/modules/str_size.bats](../tests/modules/str_size.bats)

### trim

- Usage: `l.trim <string>`
- Description: Remove leading and trailing whitespace from string.
- Dependent: [`trim_start`](#trim_start) [`trim_end`](#trim_end)
- Since: 0.1.0
- Executable Example: [../example/modules/trim](../example/modules/trim)
- More Examples: [../tests/modules/trim.bats](../tests/modules/trim.bats)

### trim.p

- Usage: `echo <string> | l.trim.p`
- Description: The pipeline version of l.trim
- Dependent: [`trim`](#trim)
- Since: 0.1.0
- Executable Example: [../example/modules/trim](../example/modules/trim)
- More Examples: [../tests/modules/trim.p.bats](../tests/modules/trim.p.bats)

### trim_color

- Usage: `l.trim_color <string>`
- Description: Remove color escape code in string
- Since: 0.1.0
- More Examples: [../tests/modules/trim_color.bats](../tests/modules/trim_color.bats)

### trim_color.p

- Usage: `echo <string> | l.trim_color.p`
- Description: The pipeline version of l.trim_color
- Dependent: [`trim_color`](#trim_color)
- Since: 0.1.0
- More Examples: [../tests/modules/trim_color.p.bats](../tests/modules/trim_color.p.bats)

### trim_end

- Usage: `l.trim_end <string> [chars=[[:space:]]]`
- Description: Remove trailing whitespace or specified characters from string.
- Since: 0.1.0
- More Examples: [../tests/modules/trim_end.bats](../tests/modules/trim_end.bats)

### trim_end.p

- Usage: `echo <string> | l.trim_end.p [chars=[[:space:]]]`
- Description: The pipeline version l.trim_end
- Dependent: [`trim_end`](#trim_end)
- Since: 0.1.0
- More Examples: [../tests/modules/trim_end.p.bats](../tests/modules/trim_end.p.bats)

### trim_start

- Usage: `l.trim_start <string> [<chars>=[[:space:]]]`
- Description: Remove leading whitespace or specified characters from string.
- Since: 0.1.0
- More Examples: [../tests/modules/trim_start.bats](../tests/modules/trim_start.bats)

### trim_start.p

- Usage: `echo <string> | l.trim_start.p [<chars>=[[:space:]]]`
- Description: The pipeline version of l.trim_start
- Dependent: [`trim_start`](#trim_start)
- Since: 0.1.0
- More Examples: [../tests/modules/trim_start.p.bats](../tests/modules/trim_start.p.bats)

### upper_case

- Usage: `l.upper_case <string>`
- Description: Convert all characters of string to upper case.
- Since: 0.1.0
- More Examples: [../tests/modules/upper_case.bats](../tests/modules/upper_case.bats)

### upper_case.p

- Usage: `echo <string> | l.upper_case.p`
- Description: The pipeline version of l.upper_case
- Dependent: [`upper_case`](#upper_case)
- Since: 0.1.0
- More Examples: [../tests/modules/upper_case.p.bats](../tests/modules/upper_case.p.bats)

### upper_first

- Usage: `l.upper_first <string>`
- Description: Convert the first character of string to upper case.
- Since: 0.1.0
- More Examples: [../tests/modules/upper_first.bats](../tests/modules/upper_first.bats)

### upper_first.p

- Usage: `echo <string> | l.upper_first.p`
- Description: The pipeline version of l.upper_first
- Dependent: [`upper_first`](#upper_first)
- Since: 0.1.0
- More Examples: [../tests/modules/upper_first.p.bats](../tests/modules/upper_first.p.bats)

## System

### detect_os

- Usage: `l.detect_os`
- Description: Return the name of current operator system.
- Since: 0.1.0
- More Examples: [../tests/modules/detect_os.bats](../tests/modules/detect_os.bats)

### hostname

- Usage: `l.hostname`
- Description: Return current hostname.
- Since: 0.1.0
- More Examples: [../tests/modules/hostname.bats](../tests/modules/hostname.bats)

### sleep

- Usage: `l.sleep <number_or_float>`
- Description:
  - Same to sleep command but support float.
  - When run it in Linux/Unix System, the precision of sleep time is 1ms. The deviation of sleep time is 1~2ms by actual measurement.
  - When run it in MacOS, the precision of sleep time is 100ms. The deviation of sleep time is 30~40ms by actual measurement.
- Since: 0.1.0
- More Examples: [../tests/modules/sleep.bats](../tests/modules/sleep.bats)

## Terminal

### cursor_col

- Usage: `l.cursor_col`
- Description: Get column number of current cursor position.
- Since: 0.1.0
- More Examples: [../tests/modules/cursor_col.bats](../tests/modules/cursor_col.bats)

### cursor_pos

- Usage:
  - `l.cursor_pos`
  - `IFS=';' c_pos=( $(l.cursor_pos) )`
- Description: Get current cursor position. It will print "row;column" with default IFS.
- Since: 0.1.0
- More Examples: [../tests/modules/cursor_pos.bats](../tests/modules/cursor_pos.bats)

### cursor_row

- Usage: `l.cursor_row`
- Description: Get row number of current cursor position.
- Since: 0.1.0
- More Examples: [../tests/modules/cursor_row.bats](../tests/modules/cursor_row.bats)

## Time

### date

- Usage: `l.date [<format>=]`
- Description: Refer to 'man strftime' for `<format>`.
- Since: 0.1.0
- More Examples: [../tests/modules/date.bats](../tests/modules/date.bats)

### now

- Usage: `l.now`
- Description:
  - Print the timestamp of the number of milliseconds that have elapsed since the Unix epoch (1 January 1970 00:00:00 UTC).
  - Require Perl 5.8.8 and higher install if run in Alpine/Busybox systems. And most Unix/Linux operating systems have included Perl 5. See the [Perl Binaries](https://www.cpan.org/ports/binaries.html).
- Since: 0.1.0
- More Examples: [../tests/modules/now.bats](../tests/modules/now.bats)

### now_s

- Usage: `l.now_s`
- Description: Print the timestamp of the number of seconds that have elapsed since the Unix epoch (1 January 1970 00:00:00 UTC).
- Dependent: [`date`](#date)
- Since: 0.1.0
- More Examples: [../tests/modules/now_s.bats](../tests/modules/now_s.bats)

## Util

### benchmark

- Usage: `l.benchmark <command> [<repeats>=10]`
- Description: Run command in repeats to get benchmarks.
- Since: 0.1.0
- More Examples: [../tests/modules/benchmark.bats](../tests/modules/benchmark.bats)

### compose

- Usage: `l.compose [<function_name_or_string>]...`
- Description: Function composition
- Since: 0.1.0
- More Examples: [../tests/modules/compose.bats](../tests/modules/compose.bats)

### repeat

- Usage: `l.repeat <N> <command_name> [<command_args>]...`
- Description: Execute command in N times.
- Since: 0.1.0
- More Examples: [../tests/modules/repeat.bats](../tests/modules/repeat.bats)

## Variable

### cur_function_name

- Usage: `l.cur_function_name`
- Description: Return the name of current function where the l.cur_function_name called in.
- Since: 0.1.0
- More Examples: [../tests/modules/cur_function_name.bats](../tests/modules/cur_function_name.bats)

### random

- Usage: `l.random [<length>=10] [<pattern>=a-zA-Z0-9@#*=[]]`
- Description:
  - Return a random string in specific length.
  - The `<pattern>` is allowed characters in range.
- Since: 0.1.0
- More Examples: [../tests/modules/random.bats](../tests/modules/random.bats)

### xdg_config_home

- Usage: `l.xdg_config_home`
- Description: Return XDG_CONFIG_HOME. Return `${HOME}/.config` if XDG_CONFIG_HOME not set.
- Since: 0.1.0
- More Examples: [../tests/modules/xdg_config_home.bats](../tests/modules/xdg_config_home.bats)
