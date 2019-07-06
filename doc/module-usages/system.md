# Category: System

[⬅️ Back to previous page](./README.md)

## TOC

- [detect_os](#detect_os)
- [hostname](#hostname)
- [sleep](#sleep)

## Modules

### detect_os

- Usage: `l.detect_os`
- Description: Return the name of current operator system.
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/detect_os.bats](../../tests/modules/detect_os.bats)
- Source Code: [src/modules/detect_os.bash](../../src/modules/detect_os.bash)

### hostname

- Usage: `l.hostname`
- Description: Return current hostname.
- Since: 0.1.0
- Bash: 4.0+
- Status: tested
- Test Cases: [tests/modules/hostname.bats](../../tests/modules/hostname.bats)
- Source Code: [src/modules/hostname.bash](../../src/modules/hostname.bash)

### sleep

- Usage: `l.sleep <number_or_float>`
- Description:
  - Same to sleep command but support float.
  - When run it in Linux/Unix System, the precision of sleep time is 1ms. The deviation of sleep time is 1~2ms by actual measurement.
  - When run it in MacOS, the precision of sleep time is 100ms. The deviation of sleep time is 30~40ms by actual measurement.
- Since: 0.1.0
- Bash: 4.1+
- Status: tested
- Test Cases: [tests/modules/sleep.bats](../../tests/modules/sleep.bats)
- Source Code: [src/modules/sleep.bash](../../src/modules/sleep.bash)

[⬆️ Back up to TOC](#toc)
