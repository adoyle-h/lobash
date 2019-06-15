# Module Usages

16 Categories, 73 Modules, 441 Test Cases.

## TOC

- [Collection](#collection)
  - [array_include](#array_include)
  - [first](#first)
  - [last](#last)
- [Prompt](#prompt)
  - [ask](#ask)
  - [choose](#choose)
- [Path](#path)
  - [basename](#basename)
  - [dirname](#dirname)
  - [normalize](#normalize)
  - [pwd](#pwd)
  - [relative](#relative)
- [Util](#util)
  - [benchmark](#benchmark)
  - [compose](#compose)
- [File](#file)
  - [count_file_lines](#count_file_lines)
  - [count_files](#count_files)
  - [extname](#extname)
- [String](#string)
  - [count_lines](#count_lines)
  - [end_with](#end_with)
  - [join](#join)
  - [lower_case](#lower_case)
  - [lower_first](#lower_first)
  - [match](#match)
  - [split](#split)
  - [start_with](#start_with)
  - [str_include](#str_include)
  - [str_len](#str_len)
  - [str_size](#str_size)
  - [trim](#trim)
  - [trim_color](#trim_color)
  - [trim_end](#trim_end)
  - [trim_start](#trim_start)
  - [upper_case](#upper_case)
  - [upper_first](#upper_first)
- [Variable](#variable)
  - [cur_function_name](#cur_function_name)
- [Terminal](#terminal)
  - [cursor_col](#cursor_col)
  - [cursor_pos](#cursor_pos)
  - [cursor_row](#cursor_row)
- [System](#system)
  - [detect_os](#detect_os)
  - [hostname](#hostname)
  - [sleep](#sleep)
  - [xdg](#xdg)
- [Console](#console)
  - [echo](#echo)
- [Condition](#condition)
  - [has](#has)
  - [if](#if)
  - [is_array](#is_array)
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
  - [is_sourced](#is_sourced)
  - [is_true](#is_true)
  - [is_writeable](#is_writeable)
  - [not](#not)
  - [strict_has](#strict_has)
  - [strict_has_not](#strict_has_not)
- [Lobash](#lobash)
  - [import](#import)
  - [import_all](#import_all)
  - [import_category](#import_category)
- [Arithmetic](#arithmetic)
  - [inc](#inc)
  - [sub](#sub)
- [Time](#time)
  - [now](#now)
  - [now_s](#now_s)
- [Debug](#debug)
  - [trace_count](#trace_count)
  - [trace_end](#trace_end)
  - [trace_stack](#trace_stack)
  - [trace_start](#trace_start)
  - [trace_time](#trace_time)
- [Array](#array)
  - [union_array](#union_array)

## Collection

### array_include

- Usage: `l.array_include <array_name> <match>`
- Since: 0.1.0
- More Examples: [../test/modules/array_include.bats](../test/modules/array_include.bats)

### first

- Usage: `l.first <array_name>`
- Description: It will return the value of arg1.
- Since: 0.1.0
- More Examples: [../test/modules/first.bats](../test/modules/first.bats)

### last

- Usage: `l.last <array_name>`
- Description: It will return the value of argN.
- Since: 0.1.0
- More Examples: [../test/modules/last.bats](../test/modules/last.bats)

## Prompt

### ask

- Usage: `l.ask <message> [<default>=Y]`
- Description:
  - Print a message and read Yes/No answer from stdin.
  - when default=Y, if will return YES by default.
  - when default=N, if will return NO by default.
- Since: 0.1.0
- More Examples: [../test/modules/ask.bats](../test/modules/ask.bats)

### choose

- Usage: `l.choose <item>...`
- Description: Prompt user to choose one item from options. The function will return the value of chosen item.
- Dependent: [`is_integer`](#is_integer)
- Since: 0.1.0
- More Examples: [../test/modules/choose.bats](../test/modules/choose.bats)

## Path

### basename

- Usage:
  - `l.basename <path>`
  - `echo <path> | l.basename`
- Description: Alternative to basename command. It much faster because using shell parameter expansion.
- Since: 0.1.0
- More Examples: [../test/modules/basename.bats](../test/modules/basename.bats)

### dirname

- Usage:
  - `l.dirname <path>`
  - `echo <path> | l.dirname`
- Description: Alternative to dirname command. It much faster because using shell parameter expansion.
- Since: 0.1.0
- More Examples: [../test/modules/dirname.bats](../test/modules/dirname.bats)

### normalize

- Usage:
  - `l.normalize <path>`
  - `echo <path> | l.normalize`
- Description:
  - Normalize the given path which can be an unexisted path.
  - Trailing `/` always be removed.
- Dependent: [`split`](#split) [`join`](#join)
- Since: 0.1.0
- More Examples: [../test/modules/normalize.bats](../test/modules/normalize.bats)

### pwd

- Usage: `l.pwd`
- Description: Return the current working directory as set by the cd builtin.
- Since: 0.1.0
- More Examples: [../test/modules/pwd.bats](../test/modules/pwd.bats)

### relative

- Usage: `l.relative <path1> <path2>`
- Dependent: [`normalize`](#normalize)
- Since: 0.1.0
- More Examples: [../test/modules/relative.bats](../test/modules/relative.bats)

## Util

### benchmark

- Usage: `l.benchmark <command> [<repeats>=10]`
- Description: Run command in repeats to get benchmarks.
- Since: 0.1.0
- More Examples: [../test/modules/benchmark.bats](../test/modules/benchmark.bats)

### compose

- Usage: `l.compose [<function_name_or_string>]...`
- Description: Function composition
- Since: 0.1.0
- More Examples: [../test/modules/compose.bats](../test/modules/compose.bats)

## File

### count_file_lines

- Usage: `l.count_file_lines <filepath>`
- Since: 0.1.0
- More Examples: [../test/modules/count_file_lines.bats](../test/modules/count_file_lines.bats)

### count_files

- Usage: `l.count_files <directory_path>`
- Since: 0.1.0
- More Examples: [../test/modules/count_files.bats](../test/modules/count_files.bats)

### extname

- Usage:
  - `l.extname <string>`
  - `echo <string> | l.extname`
- Since: 0.1.0
- More Examples: [../test/modules/extname.bats](../test/modules/extname.bats)

## String

### count_lines

- Usage:
  - `l.count_lines <string>`
  - `echo <string> | l.count_lines`
- Description:
  - The command and process substitution always trim blank line. So l.count_lines do not accept normal parameter passing.
  - Refer to https://stackoverflow.com/a/37706905
- Since: 0.1.0
- More Examples: [../test/modules/count_lines.bats](../test/modules/count_lines.bats)

### end_with

- Usage: `l.end_with <string> <match>`
- Since: 0.1.0
- More Examples: [../test/modules/end_with.bats](../test/modules/end_with.bats)

### join

- Usage: `l.join <array_name> [<delimiter>=,]`
- Description: Convert all elements in array into a string separated by delimiter.
- Since: 0.1.0
- More Examples: [../test/modules/join.bats](../test/modules/join.bats)

### lower_case

- Usage:
  - `l.lower_case <string>`
  - `echo <string> | l.lower_case`
- Description: Convert all characters of string to lower case.
- Since: 0.1.0
- More Examples: [../test/modules/lower_case.bats](../test/modules/lower_case.bats)

### lower_first

- Usage:
  - `l.lower_first <string>`
  - `echo <string> | l.lower_first`
- Description: Convert the first character of string to lower case.
- Since: 0.1.0
- More Examples: [../test/modules/lower_first.bats](../test/modules/lower_first.bats)

### match

- Usage: `l.match "string" "regex" [index=1]`
- Description: Return matched part of string. Return empty string if no matched. Support capturing groups.
- Since: 0.1.0
- More Examples: [../test/modules/match.bats](../test/modules/match.bats)

### split

- Usage: `l.split <string> [delimiter=' ']`
- Description: Splits string by delimiter.
- Since: 0.1.0
- More Examples: [../test/modules/split.bats](../test/modules/split.bats)

### start_with

- Usage: `l.start_with <string> <match>`
- Description: Return `true` or `false`. Check if a string starts with given match string.
- Since: 0.1.0
- More Examples: [../test/modules/start_with.bats](../test/modules/start_with.bats)

### str_include

- Usage: `str_include <string> <match>`
- Description: Return `true` or `false`. Check if a string includes given match string.
- Since: 0.1.0
- More Examples: [../test/modules/str_include.bats](../test/modules/str_include.bats)

### str_len

- Usage: `l.str_len <string>`
- Description: Return the byte length of string.
- Since: 0.1.0
- More Examples: [../test/modules/str_len.bats](../test/modules/str_len.bats)

### str_size

- Usage: `l.str_size <string>`
- Description: Return the sum of string letters.
- Since: 0.1.0
- More Examples: [../test/modules/str_size.bats](../test/modules/str_size.bats)

### trim

- Usage:
  - `l.trim <string>`
  - `echo <string> | l.trim`
- Description: Remove leading and trailing whitespace from string.
- Dependent: [`trim_start`](#trim_start) [`trim_end`](#trim_end)
- Since: 0.1.0
- More Examples: [../test/modules/trim.bats](../test/modules/trim.bats)

### trim_color

- Usage:
  - `l.trim_color <string>`
  - `echo <string> | l.trim_color`
- Description: Remove color escape code in string
- Since: 0.1.0
- More Examples: [../test/modules/trim_color.bats](../test/modules/trim_color.bats)

### trim_end

- Usage:
  - `l.trim_end <string> [chars=[[:space:]]]`
  - `echo <string> | l.trim_end [chars=[[:space:]]]`
- Description: Remove trailing whitespace or specified characters from string.
- Since: 0.1.0
- More Examples: [../test/modules/trim_end.bats](../test/modules/trim_end.bats)

### trim_start

- Usage:
  - `l.trim_start <string>`
  - `echo <string> | l.trim_start`
- Description: Remove leading whitespace or specified characters from string.
- Since: 0.1.0
- More Examples: [../test/modules/trim_start.bats](../test/modules/trim_start.bats)

### upper_case

- Usage:
  - `l.upper_case <string>`
  - `echo <string> | l.upper_case`
- Description: Convert all characters of string to upper case.
- Since: 0.1.0
- More Examples: [../test/modules/upper_case.bats](../test/modules/upper_case.bats)

### upper_first

- Usage:
  - `l.upper_first <string>`
  - `echo <string> | l.upper_first`
- Description: Convert the first character of string to upper case.
- Since: 0.1.0
- More Examples: [../test/modules/upper_first.bats](../test/modules/upper_first.bats)

## Variable

### cur_function_name

- Usage: `l.cur_function_name`
- Since: 0.1.0
- More Examples: [../test/modules/cur_function_name.bats](../test/modules/cur_function_name.bats)

## Terminal

### cursor_col

- Usage: `l.cursor_col`
- Description: get column number of current cursor position
- Since: 0.1.0
- More Examples: [../test/modules/cursor_col.bats](../test/modules/cursor_col.bats)

### cursor_pos

- Usage:
  - `l.cursor_pos`
  - `IFS=';' c_pos=( $(l.cursor_pos) )`
- Description: get current cursor position. It will print "row;column" with default IFS.
- Since: 0.1.0
- More Examples: [../test/modules/cursor_pos.bats](../test/modules/cursor_pos.bats)

### cursor_row

- Usage: `l.cursor_row`
- Description: get row number of current cursor position
- Since: 0.1.0
- More Examples: [../test/modules/cursor_row.bats](../test/modules/cursor_row.bats)

## System

### detect_os

- Usage: `l.detect_os`
- Since: 0.1.0
- More Examples: [../test/modules/detect_os.bats](../test/modules/detect_os.bats)

### hostname

- Usage: `l.hostname`
- Since: 0.1.0
- More Examples: [../test/modules/hostname.bats](../test/modules/hostname.bats)

### sleep

- Usage: `l.sleep <number_or_float>`
- Description:
  - Same to sleep command but support float.
  - When run it in Linux/Unix System, the precision of sleep time is 1ms. The deviation of sleep time is 1~2ms by actual measurement.
  - When run it in MacOS, the precision of sleep time is 100ms. The deviation of sleep time is 40~50ms by actual measurement.
- Since: 0.1.0
- More Examples: [../test/modules/sleep.bats](../test/modules/sleep.bats)

### xdg

- Usage: `l.get_xdg_config_home`
- Description: Return XDG_CONFIG_HOME. Return `${HOME}/.config` if XDG_CONFIG_HOME not set.
- Since: 0.1.0
- More Examples: [../test/modules/xdg.bats](../test/modules/xdg.bats)

## Console

### echo

- Usage: `l.echo <string>...`
- Description:
  - A safe way to echo string. Not support any options.
  - The builtin echo will get unexpected result while execute `b=( -n 123 ); echo "${b[@]}"`.
  - See https://github.com/anordal/shellharden/blob/master/how_to_do_things_safely_in_bash.md#echo--printf
- Since: 0.1.0
- More Examples: [../test/modules/echo.bats](../test/modules/echo.bats)

## Condition

### has

- Usage:
  - `l.has <condition> <what>`
  - `l.has not <condition> <what>`
- Description:
  - Exit with 0 or 1. Check if command/function/alias/keyword/builtin or anything existed.
  - <condition>  Valid value: `command`, `function`, `alias`, `keyword`, `builtin`, `the`
  - This method is not recommended. Use strict_has instead.
- Since: 0.1.0
- More Examples: [../test/modules/has.bats](../test/modules/has.bats)

### if

- Usage: `l.if <condition> <then> [<else>]`
- Description:
  - The difference from shell builtin `if` is when condition function throw exception it will ended immediately.
  - <condition> can be function name, string and number. The function should return `true`/`0` or `false`/`1`.
  - <then> and <else> must be function name. And <else> is optional.
  - When <condition> is true, <then> function will be invoked. Otherwise <else> will be invoked if it passed.
- Since: 0.1.0
- More Examples: [../test/modules/if.bats](../test/modules/if.bats)

### is_array

- Usage: `l.is_array <var_name>`
- Since: 0.1.0
- More Examples: [../test/modules/is_array.bats](../test/modules/is_array.bats)

### is_dir

- Usage: `l.is_dir <var>`
- Since: 0.1.0
- More Examples: [../test/modules/is_dir.bats](../test/modules/is_dir.bats)

### is_executable

- Usage: `l.is_executable <var>`
- Description: Similar to `[[ -x ]]`. Return `true` or `false`.
- Since: 0.1.0
- More Examples: [../test/modules/is_executable.bats](../test/modules/is_executable.bats)

### is_executable_file

- Usage: `l.is_executable_file <var>`
- Description: Similar to `l.is_executable`. But directory will return false.
- Dependent: [`is_dir`](#is_dir)
- Since: 0.1.0
- More Examples: [../test/modules/is_executable_file.bats](../test/modules/is_executable_file.bats)

### is_false

- Usage: `l.is_false <var>`
- Dependent: [`is_integer`](#is_integer)
- Since: 0.1.0
- More Examples: [../test/modules/is_false.bats](../test/modules/is_false.bats)

### is_file

- Usage: `l.is_file <var>`
- Since: 0.1.0
- More Examples: [../test/modules/is_file.bats](../test/modules/is_file.bats)

### is_float

- Usage: `l.is_float <str>`
- Since: 0.1.0
- More Examples: [../test/modules/is_float.bats](../test/modules/is_float.bats)

### is_integer

- Usage: `l.is_integer <str>`
- Since: 0.1.0
- More Examples: [../test/modules/is_integer.bats](../test/modules/is_integer.bats)

### is_link

- Usage: `l.is_link <var>`
- Since: 0.1.0
- More Examples: [../test/modules/is_link.bats](../test/modules/is_link.bats)

### is_number

- Usage: `l.is_number <str>`
- Since: 0.1.0
- More Examples: [../test/modules/is_number.bats](../test/modules/is_number.bats)

### is_readable

- Usage: `l.is_readable <var>`
- Since: 0.1.0
- More Examples: [../test/modules/is_readable.bats](../test/modules/is_readable.bats)

### is_sourced

- Description: Detect current file whether is sourced or not.
- Since: 0.1.0
- More Examples: [../test/modules/is_sourced.bats](../test/modules/is_sourced.bats)

### is_true

- Usage: `l.is_true <var>`
- Since: 0.1.0
- More Examples: [../test/modules/is_true.bats](../test/modules/is_true.bats)

### is_writeable

- Usage: `l.is_writeable <var>`
- Since: 0.1.0
- More Examples: [../test/modules/is_writeable.bats](../test/modules/is_writeable.bats)

### not

- Usage: `l.not <condition>`
- Description: <condition> must be `true` or `false`. This function returns the opposite value.
- Since: 0.1.0
- More Examples: [../test/modules/not.bats](../test/modules/not.bats)

### strict_has

- Usage: `l.strict_has <condition> <what>`
- Description:
  - Return `true` or `false`. Check if command/function/alias/keyword/builtin or anything existed.
  - <condition>  Valid value: `command`, `function`, `alias`, `keyword`, `builtin`, `the`
- Since: 0.1.0
- More Examples: [../test/modules/strict_has.bats](../test/modules/strict_has.bats)

### strict_has_not

- Usage: `strict_has_not <condition> <what>`
- Description: Opposite to strict_has.
- Dependent: [`strict_has`](#strict_has) [`not`](#not)
- Since: 0.1.0
- More Examples: [../test/modules/strict_has_not.bats](../test/modules/strict_has_not.bats)

## Lobash

### import

- Usage: `import [-f|--force] <module_name>... [<prefix>=l.]`
- Description:
  - Import Lobash modules.
  - <prefix> must end with `.`, `-`, `_`
  - -f, --force  To force refresh module codes. Because imported modules will be cached by default.
- Since: 0.1.0
- More Examples: [../test/modules/import.bats](../test/modules/import.bats)

### import_all

- Usage: `import_all [prefix=l.]`
- Description:
  - Import all Lobash modules.
  - <prefix> must end with `.`, `-`, `_`
- Dependent: [`import`](#import)
- Since: 0.1.0
- More Examples: [../test/modules/import_all.bats](../test/modules/import_all.bats)

### import_category

- Usage: `import_category <category_name>... [prefix=l.]`
- Description:
  - Import Lobash modules by categories.
  - <prefix> must end with `.`, `-`, `_`
- Dependent: [`import`](#import)
- Since: 0.1.0
- More Examples: [../test/modules/import_category.bats](../test/modules/import_category.bats)

## Arithmetic

### inc

- Usage: `l.inc <var_name> [<addend>=1]`
- Description: Increase number with addend.
- Since: 0.1.0
- More Examples: [../test/modules/inc.bats](../test/modules/inc.bats)

### sub

- Usage: `l.sub <var_name> [<subtrahend>=1]`
- Description: Subtract number with subtrahend.
- Since: 0.1.0
- More Examples: [../test/modules/sub.bats](../test/modules/sub.bats)

## Time

### now

- Usage: `l.now`
- Description: Print the timestamp of the number of milliseconds that have elapsed since the Unix epoch (1 January 1970 00:00:00 UTC).
- Since: 0.1.0
- More Examples: [../test/modules/now.bats](../test/modules/now.bats)

### now_s

- Usage: `l.now_s`
- Description: Print the timestamp of the number of seconds that have elapsed since the Unix epoch (1 January 1970 00:00:00 UTC).
- Since: 0.1.0
- More Examples: [../test/modules/now_s.bats](../test/modules/now_s.bats)

## Debug

### trace_count

- Usage: `l.trace_count [<label>=trace]`
- Description:
  - It prints a count which increased after each called.
  - Attention: l.trace_count should run in same process. It will not work in subprocess such as $(l.trace_count)
- Since: 0.1.0
- More Examples: [../test/modules/trace_count.bats](../test/modules/trace_count.bats)

### trace_end

- Usage: `l.trace_end`
- Description: Close xtrace mode and reset PS4. Cooperated with trace_start.
- Since: 0.1.0
- More Examples: [../test/modules/trace_end.bats](../test/modules/trace_end.bats)

### trace_stack

- Usage: `l.trace_stack [label]`
- Description: Print current function stack for debug.
- Since: 0.1.0
- More Examples: [../test/modules/trace_stack.bats](../test/modules/trace_stack.bats)

### trace_start

- Usage: `l.trace_start [<PS4_level>=2] [<label>]`
- Description:
  - PS4_level  Valid Values: `1`, `2`, `3`. Different level changes different prompt message format.
  - Open xtrace mode and set PS4. It will print each script line with nice prompt for debug.
- Since: 0.1.0
- More Examples: [../test/modules/trace_start.bats](../test/modules/trace_start.bats)

### trace_time

- Usage: `l.trace_time [label]`
- Description: Print current timestamp, last timestamp and the elapsed time in millisecond.
- Dependent: [`now`](#now)
- Since: 0.1.0
- More Examples: [../test/modules/trace_time.bats](../test/modules/trace_time.bats)

## Array

### union_array

- Usage: `l.union_array <var_name>...`
- Description: Create an array of unique values from all given arrays.
- Since: 0.1.0
- More Examples: [../test/modules/union_array.bats](../test/modules/union_array.bats)
