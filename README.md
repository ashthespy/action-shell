# ShellLint

Github action to check (and format) shell scripts. 
Utilise [`shellcheck`](https://github.com/koalaman/shellcheck) and [`shfmt`](https://github.com/mvdan/sh) to maintain a consistent codebase.

## Inputs

```yaml
  only_changed:
    description: Flag to only test changed files
    default: 'false'
    required: false
    # Note Requires `GITHUB_BEFORE_SHA`, See workflow example
  path:
    description: "See `[path]` of `find`."
    default: '.'
    required: false
  pattern:
    description: "See `-name [pattern]` of `find`."
    default: ''
    required: false
  exclude:
    description: "See `-not -path [exclude]` of `find`."
    required: false
  shellcheck_flags:
    description: "Flags for shellcheck."
    default: '--color=always --external-sources --format=tty'
    required: false
  shfmt_flags:
    description: "Flags for shfmt."
    default: '-d'
    required: false
  enable_annotations:
    description: "Annotations using problem_matcher"
    default: 'true'
    required: false
```

## Example configuration

```yaml
# Required to run formatting only on changed files
env:
  GITHUB_BEFORE_SHA: ${{ github.event.before }}

jobs:
  check:
    runs-on: ubuntu-20.04
    steps:
      - uses: actions/checkout@v2
      # Run our action
      - name: Checker and formatter 
        uses: ashthespy/action-shell@v1
        with:
         only_changed: 'true'
```