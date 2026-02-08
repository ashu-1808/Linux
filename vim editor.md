## VI Editor (Linux)
```
VI (Visual Editor) is a standard text editor available on almost all Linux and Unix systems.
It is commonly used to edit configuration files and scripts directly from the terminal.
```
## Vim Editor (Linux)
```
Vim (Vi Improved) is a powerful, terminal-based text editor used widely in Linux for editing configuration files, scripts, and source code.
```

## Vim Modes

Vim works in different modes:

| Mode             | Purpose                                        |
| ---------------- | ---------------------------------------------- |
| **Normal Mode**  | Default mode; used for navigation and commands |
| **Insert Mode**  | Used to insert or edit text                    |
| **Visual Mode**  | Used to select text                            |
| **Command Mode** | Used to save, quit, and execute commands       |

## Open a File in Vim
```
vim filename.txt
```
| Command | Action            |
| ------- | ----------------- |
| `Esc`   | Go to Normal mode |
| `i`     | Insert mode       |
| `v`     | Visual mode       |
| `:`     | Command mode      |

## 1.Normal Mode


Normal Mode – Navigation

| Key        | Action                |
| ---------- | --------------------- |
| `h j k l`  | Left, Down, Up, Right |
| `w` / `b`  | Next / Previous word  |
| `0` / `$`  | Start / End of line   |
| `gg` / `G` | First / Last line     |
| `:n`       | Go to line number     |


Normal Mode – Edit:

| Command    | Action               |
| ---------- | -------------------- |
| `x`        | Delete character     |
| `dd`       | Delete line          |
| `dw`       | Delete word          |
| `yy`       | Copy line            |
| `p` / `P`  | Paste after / before |
| `u`        | Undo                 |
| `Ctrl + r` | Redo                 |



## 2.Insert Mode
| Command   | Action                 |
| --------- | ---------------------- |
| `i`       | Insert before cursor   |
| `a`       | Insert after cursor    |
| `o` / `O` | New line below / above |
| `I` / `A` | Line start / end       |
| `Esc`     | Exit insert mode       |



## 3.Visual Mode
| Command    | Action           |
| ---------- | ---------------- |
| `v`        | Character select |
| `V`        | Line select      |
| `Ctrl + v` | Block select     |
| `y`        | Copy             |
| `d`        | Delete           |
| `>` / `<`  | Indent           |


Visual Mode Actions:

| Command | Action               |
| ------- | -------------------- |
| `y`     | Copy selected text   |
| `d`     | Delete selected text |
| `c`     | Change selected text |
| `>`     | Indent right         |
| `<`     | Indent left          |




## 4.Command Mode
Used for saving, quitting, searching, replacing
(Press Esc then :)

| Command | Action              |
| ------- | ------------------- |
| `:w`    | Save                |
| `:q`    | Quit                |
| `:wq`   | Save & quit         |
| `:q!`   | Quit without saving |
| `ZZ`    | Save & exit         |


Replace Commands:

| Command          | Action                      |
| ---------------- | --------------------------- |
| `:s/old/new`     | Replace first match in line |
| `:s/old/new/g`   | Replace all matches in line |
| `:%s/old/new/g`  | Replace all matches in file |
| `:%s/old/new/gc` | Replace with confirmation   |


File & Utility Commands:

| Command     | Action            |
| ----------- | ----------------- |
| `:set nu`   | Show line numbers |
| `:set nonu` | Hide line numbers |
| `:!ls`      | Run shell command |
| `:help`     | Open Vim help     |



Search Commands:

| Command | Action          |
| ------- | --------------- |
| `/word` | Search forward  |
| `?word` | Search backward |
| `n`     | Next match      |
| `N`     | Previous match  |















