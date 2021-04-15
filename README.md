# pre-commit configuration

Base configuration for [pre-commit](https://pre-commit.com/) to support the following project types:

* Ansible (yaml)
* Shell
* Python
* Markdown
* Home Assistant (yaml)
  
## Ansible Linting

.ansible-lint

```yml
---
exclude_paths:
  - ./vscode/
parseable: true
quiet: true
skip_list:
  - '204'
  - '301'
  - '303'
  - '403'
use_default_rules: true
verbosity: 1
```
