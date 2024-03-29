# Category: Path

[⬅️ Back to previous page](./README.md)

## TOC

- [basename](#basename)
- [basename.p](#basenamep)
- [dirname](#dirname)
- [dirname.p](#dirnamep)
- [normalize](#normalize)
- [normalize.p](#normalizep)
- [pwd](#pwd)
- [relative](#relative)

## Modules

### basename

- Usage: `l.basename <path>`
- Description: Alternative to basename command. It much faster because using shell parameter expansion.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/basename.bats](../../tests/modules/basename.bats)
- Source Code: [src/modules/basename.bash](../../src/modules/basename.bash)

### basename.p

- Usage: `echo <path> | l.basename.p`
- Description: The pipeline version of l.basename
- Dependent: [`basename`](./path.md#basename)
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/basename.p.bats](../../tests/modules/basename.p.bats)
- Source Code: [src/modules/basename.p.bash](../../src/modules/basename.p.bash)

### dirname

- Usage: `l.dirname <path>`
- Description: Alternative to dirname command. It much faster because using shell parameter expansion.
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/dirname.bats](../../tests/modules/dirname.bats)
- Source Code: [src/modules/dirname.bash](../../src/modules/dirname.bash)

### dirname.p

- Usage: `echo <path> | l.dirname.p`
- Description: The pipeline version of l.dirname
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/dirname.p.bats](../../tests/modules/dirname.p.bats)
- Source Code: [src/modules/dirname.p.bash](../../src/modules/dirname.p.bash)

### normalize

- Usage: `l.normalize <path>`
- Description:
  - Normalize the given path which can be an unexisted path.
  - Trailing `/` always be removed.
- Dependent: [`split`](./string.md#split) [`join`](./string.md#join)
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/normalize.bats](../../tests/modules/normalize.bats)
- Source Code: [src/modules/normalize.bash](../../src/modules/normalize.bash)

### normalize.p

- Usage: `echo <path> | l.normalize.p`
- Description: The pipeline version of l.normalize
- Dependent: [`normalize`](./path.md#normalize)
- Since: 0.1.0
- Bash: 4.0+
- Test Cases: [tests/modules/normalize.p.bats](../../tests/modules/normalize.p.bats)
- Source Code: [src/modules/normalize.p.bash](../../src/modules/normalize.p.bash)

### pwd

- Usage: `l.pwd`
- Description: Return the current working directory as set by the `cd` builtin command.
- Since: 0.1.0
- Bash: 4.0+
- Source Code: [src/modules/pwd.bash](../../src/modules/pwd.bash)

### relative

- Usage: `l.relative <from> <to>`
- Description: Output the relative path.
- Dependent: [`normalize`](./path.md#normalize)
- Since: 0.5.0
- Bash: 4.0+
- Test Cases: [tests/modules/relative.bats](../../tests/modules/relative.bats)
- Source Code: [src/modules/relative.bash](../../src/modules/relative.bash)

[⬆️ Back up to TOC](#toc)
