## scp vs rsync

| Feature            | scp                   | rsync                |
| ------------------ | --------------------- | -------------------- |
| Purpose            | File copy             | File synchronization |
| Transfer method    | Copies full file      | Copies only changes  |
| Speed              | Slower for large data | Faster & efficient   |
| Resume support     | ❌ No                  | ✅ Yes                |
| Compression        | ❌ No                  | ✅ Yes (`-z`)         |
| Delete extra files | ❌ No                  | ✅ Yes (`--delete`)   |
| Best for           | One-time copy         | Backups, syncing     |
| Uses SSH           | ✅ Yes                 | ✅ Yes                |



## What is scp?

scp (Secure Copy) is a Linux command used to securely transfer files and directories  between local and remote systems over SSH.
Data is encrypted, so it’s safe for network transfer.

Basic Syntax
```
scp [options] source destination
```
## Common scp Examples
1 Copy file from local → remote
```scp file.txt user@remote_ip:/home/user/
```
2 Copy file from remote → local
```
scp user@remote_ip:/home/user/file.txt /local/path/
```
3 Copy directory (recursive)
```
scp -r /data user@remote_ip:/backup/
```
4 Copy using a specific SSH port
```
scp -P 2222 file.txt user@remote_ip:/home/user/
```
5 Copy with verbose output
```
scp -v file.txt user@remote_ip:/home/user/
```
scp Options
| Option | Description                            |
| ------ | -------------------------------------- |
| `-r`   | Copy directories recursively           |
| `-P`   | Specify SSH port                       |
| `-v`   | Verbose output                         |
| `-C`   | Enable compression                     |
| `-p`   | Preserve file timestamps & permissions |

## What is rsync?
rsync is a Linux command used to efficiently synchronize files and directories between a local and
a remote system or between two local directories.
It transfers only changed data, making it faster and bandwidth-efficient.

Basic Syntax
```
rsync [options] source destination
```
## Common rsync Examples
1 Sync directory (local → remote)
```
rsync -avz /data/ user@remote_ip:/backup/
```
2 Sync directory (remote → local)
```
rsync -avz user@remote_ip:/backup/ /data/
```
3 Sync between local directories
```
rsync -av /source/ /destination/
```
4 Delete extra files at destination
```rsync -avz --delete /data/ user@remote_ip:/backup/
```
5 Dry run (test before actual sync)
```rsync -avz --dry-run /data/ user@remote_ip:/backup/
```
6 Use a specific SSH port
```
rsync -avz -e "ssh -p 2222" /data/ user@remote_ip:/backup/
```
rsync Options
| Option      | Meaning                                      |
| ----------- | -------------------------------------------- |
| `-a`        | Archive mode (permissions, ownership, links) |
| `-v`        | Verbose                                      |
| `-z`        | Compression                                  |
| `--delete`  | Delete extra files                           |
| `--dry-run` | Simulation mode                              |
| `-e ssh`    | Use SSH                                      |
