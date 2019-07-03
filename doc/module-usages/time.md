# Category: Time

[⬅️ Back to previous page](./README.md)

## TOC

- [date](#date)
- [now](#now)
- [now_s](#now_s)

## Modules

### date

- Usage: `l.date [<format>=]`
- Description: Refer to 'man strftime' for `<format>`.
- Since: 0.1.0
- Test Cases: [tests/modules/date.bats](../../tests/modules/date.bats)
- Source Code: [src/modules/date.bash](../../src/modules/date.bash)

### now

- Usage: `l.now`
- Description:
  - Print the timestamp of the number of milliseconds that have elapsed since the Unix epoch (1 January 1970 00:00:00 UTC).
  - Require Perl 5.8.8 and higher install if run in Alpine/Busybox systems. And most Unix/Linux operating systems have included Perl 5. See the [Perl Binaries](https://www.cpan.org/ports/binaries.html).
- Since: 0.1.0
- Test Cases: [tests/modules/now.bats](../../tests/modules/now.bats)
- Source Code: [src/modules/now.bash](../../src/modules/now.bash)

### now_s

- Usage: `l.now_s`
- Description: Print the timestamp of the number of seconds that have elapsed since the Unix epoch (1 January 1970 00:00:00 UTC).
- Dependent: [`date`](./time.md#date)
- Since: 0.1.0
- Test Cases: [tests/modules/now_s.bats](../../tests/modules/now_s.bats)
- Source Code: [src/modules/now_s.bash](../../src/modules/now_s.bash)

[⬆️ Back up to TOC](#toc)
