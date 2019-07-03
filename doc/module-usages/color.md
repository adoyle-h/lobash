# Category: Color

[⬅️ Back to previous page](./README.md)

## TOC

- [hex_to_rgb](#hex_to_rgb)
- [rgb_to_hex](#rgb_to_hex)

## Modules

### hex_to_rgb

- Usage: `l.hex_to_rgb <HEX>`
- Description: Return a list contains `<R> <G> <B>`.
- Since: 0.1.0
- Test Cases: [tests/modules/hex_to_rgb.bats](../../tests/modules/hex_to_rgb.bats)
- Source Code: [src/modules/hex_to_rgb.bash](../../src/modules/hex_to_rgb.bash)

### rgb_to_hex

- Usage: `l.rgb_to_hex <R> <G> <B>`
- Description: Return hex string. Like '#ffffff'
- Dependent: [`is_number`](./condition.md#is_number)
- Since: 0.1.0
- Test Cases: [tests/modules/rgb_to_hex.bats](../../tests/modules/rgb_to_hex.bats)
- Source Code: [src/modules/rgb_to_hex.bash](../../src/modules/rgb_to_hex.bash)

[⬆️ Back up to TOC](#toc)
