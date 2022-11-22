# Pipeline Module

The pipeline module provides function which can be used in pipeline.
Its name must be named suffixed with `.p`.

```
# ---
# Category: Path
# Since: 0.1.0
# Usage: echo <path> | l.basename.p
# Description: The pipeline version of l.basename
# Dependent: basename
# ---

l.basename.p() {
  local str
  IFS='' read -r str

  l.basename "$str"
}
```
