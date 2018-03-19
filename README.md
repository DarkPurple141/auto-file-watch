# Quickstart

## Usage

Calls the watcher to run every second on folder structure specified by PATH.

```bash
./watcher.sh [PATH] [UPDATE_INTERVAL] ./git_push.sh
```

## Example

```bash
# webapp file structure
-base
--js
--css
--templates
```

```bash
# One possibility would be to run with three differnet background workers
./watcher.sh base/js 10 ./git_push.sh &
./watcher.sh base/css 10 ./git_push.sh &
./watcher.sh base/templates 10 ./git_push.sh &
```
