# Category: Debug

[⬅️ Back to previous page](./README.md)

## TOC

- [trace_count](#trace_count)
- [trace_end](#trace_end)
- [trace_stack](#trace_stack)
- [trace_start](#trace_start)
- [trace_time](#trace_time)

## Modules

### trace_count

- Usage: `l.trace_count [<label>=trace]`
- Description:
  - It prints a count which increased after each called.
  - Attention: l.trace_count should run in same process. It will not work in subprocess such as $(l.trace_count)
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/trace_count.bats](../../tests/modules/trace_count.bats)
- Source Code: [src/modules/trace_count.bash](../../src/modules/trace_count.bash)

### trace_end

- Usage: `l.trace_end`
- Description: Close xtrace mode and reset PS4. Cooperated with trace_start.
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/trace_end.bats](../../tests/modules/trace_end.bats)
- Source Code: [src/modules/trace_end.bash](../../src/modules/trace_end.bash)

### trace_stack

- Usage: `l.trace_stack [label]`
- Description: Print current function stack for debug.
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/trace_stack.bats](../../tests/modules/trace_stack.bats)
- Source Code: [src/modules/trace_stack.bash](../../src/modules/trace_stack.bash)
- Executable Example: [example/modules/trace_stack](../../example/modules/trace_stack)

### trace_start

- Usage: `l.trace_start [<PS4_level>=2] [<label>]`
- Description:
  - PS4_level  Valid Values: `1`, `2`, `3`. Different level changes different prompt message format.
  - Open xtrace mode and set PS4. It will print each script line with nice prompt for debug.
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/trace_start.bats](../../tests/modules/trace_start.bats)
- Source Code: [src/modules/trace_start.bash](../../src/modules/trace_start.bash)

### trace_time

- Usage: `l.trace_time [label]`
- Description: Print current timestamp, last timestamp and the elapsed time in millisecond.
- Dependent: [`now`](./time.md#now)
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/trace_time.bats](../../tests/modules/trace_time.bats)
- Source Code: [src/modules/trace_time.bash](../../src/modules/trace_time.bash)

[⬆️ Back up to TOC](#toc)
