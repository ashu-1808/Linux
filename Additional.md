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
```
scp /local/path/file.txt user@remote_ip:/home/user/
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
```
rsync -avz --delete /data/ user@remote_ip:/backup/
```
5 Dry run (test before actual sync)
```
rsync -avz --dry-run /data/ user@remote_ip:/backup/
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

---
The **`grep`** command in Linux is used to **search for a specific word or pattern inside files or command output**. It scans text and prints the lines that match the pattern.

In simple terms: **grep = search tool for text in Linux.**

**Basic Syntax**

```
grep [options] pattern file
```

* **pattern** → word or text you want to search
* **file** → file where grep will search

---

### 1. Simple Example

```
grep "error" log.txt
```

This will show all lines in `log.txt` that contain the word **error**.

Example `log.txt`

```
Server started
Connection error
Login successful
```

Output:

```
Connection error
```

---

### 2. Case-Insensitive Search

```
grep -i "error" log.txt
```

`-i` ignores uppercase/lowercase.

It will match:

```
error
Error
ERROR
```

---

### 3. Show Line Numbers

```
grep -n "error" log.txt
```

Output example:

```
2:Connection error
```

`2` = line number.

---

### 4. Search in Multiple Files

```
grep "error" *.log
```

Searches the word **error** in all `.log` files.

---

### 5. Recursive Search (Very Common in DevOps)

```
grep -r "database" /var/log
```

Searches the word **database** in all files inside `/var/log` directory.

---

### 6. Invert Match (Show lines NOT matching)

```
grep -v "error" log.txt
```

Shows all lines **except** those containing "error".

---

### 7. Count Matches

```
grep -c "error" log.txt
```

Output example:

```
3
```

Means the word **error** appears **3 times**.

---

### 8. Use grep with pipe (`|`)

Very common in **Linux / DevOps troubleshooting**.

Example:

```
ps -ef | grep java
```

Shows running **Java processes**.

Another example:

```
netstat -tulnp | grep 8080
```

Shows which process is using **port 8080**.

---

### Most Used grep Options

| Option | Meaning          |
| ------ | ---------------- |
| `-i`   | Ignore case      |
| `-n`   | Show line number |
| `-r`   | Recursive search |
| `-v`   | Invert match     |
| `-c`   | Count matches    |
| `-w`   | Match whole word |

---

### DevOps Real-Time Example

Check errors in logs:

```
grep "ERROR" application.log
```

Check running Docker container logs:

```
docker logs container_id | grep error
```

---

The **`sed`** command in Linux stands for **Stream Editor**.
It is used to **search, replace, delete, or modify text in files or command output** without opening the file in an editor.

It is very common in **Linux administration, DevOps, log processing, and automation scripts**.

---

# 1. Basic Syntax

```
sed 'operation' file
```

Example:

```
sed 's/linux/unix/' file.txt
```

* `s` → substitute (replace)
* `linux` → old word
* `unix` → new word

---

# 2. Replace Word in File

```
sed 's/error/fixed/' log.txt
```

Replaces **first occurrence of error** with **fixed** in each line.

Example:

Input

```
error in application
error in server
```

Output

```
fixed in application
fixed in server
```

---

# 3. Replace All Occurrences in Line

```
sed 's/error/fixed/g' log.txt
```

`g` = global (replace all matches).

---

# 4. Case Insensitive Replace

```
sed 's/error/fixed/gi' log.txt
```

Matches:

```
error
ERROR
Error
```

---

# 5. Replace Text in Specific Line

```
sed '2s/error/fixed/' log.txt
```

Replaces text **only in line 2**.

---

# 6. Print Specific Line

```
sed -n '3p' file.txt
```

Prints **only line 3**.

---

# 7. Print Line Range

```
sed -n '2,5p' file.txt
```

Prints **lines 2 to 5**.

---

# 8. Delete Specific Line

```
sed '3d' file.txt
```

Deletes **line 3**.

---

# 9. Delete Line Range

```
sed '2,4d' file.txt
```

Deletes **lines 2 to 4**.

---

# 10. Replace Text in File Permanently

```
sed -i 's/error/fixed/g' file.txt
```

`-i` → modifies the **original file**.

Without `-i`, sed only prints output.

---

# 11. Remove Blank Lines

```
sed '/^$/d' file.txt
```

Deletes empty lines.

---

# 12. Add Text at Beginning of Line

```
sed 's/^/DevOps: /' file.txt
```

Adds **DevOps:** before every line.

---

# 13. Add Text at End of Line

```
sed 's/$/ done/' file.txt
```

Adds **done** at the end of each line.

---

# 14. Replace Multiple Words

```
sed -e 's/error/fixed/g' -e 's/warning/check/g' file.txt
```

Replaces **multiple patterns**.

---

# 15. Use sed with pipe

Example (very common in DevOps):

```
docker ps | sed 's/ubuntu/linux/'
```

Replaces text in command output.

---

# DevOps Real-Time Example

### 1. Replace IP in config file

```
sed -i 's/192.168.1.10/10.0.0.5/g' config.conf
```

---

### 2. Update port in configuration

```
sed -i 's/8080/9090/g' application.properties
```

---

### 3. Remove comments from config file

```
sed '/^#/d' config.conf
```

---

# Most Important sed Commands (Quick Table)

| Command       | Purpose                 |
| ------------- | ----------------------- |
| `s/old/new/`  | Replace text            |
| `s/old/new/g` | Replace all occurrences |
| `-i`          | Edit file directly      |
| `d`           | Delete line             |
| `p`           | Print line              |
| `^`           | Start of line           |
| `$`           | End of line             |

---

**`awk`** is a powerful Linux command used for **text processing, pattern scanning, and data extraction**, especially when working with **structured text like logs, CSV files, or command output**.

In practice, DevOps engineers use `awk` when they want to **pick specific columns, calculate values, or filter records** from command output.

Basic idea: **`awk` reads input line by line and splits each line into fields (columns).**
By default, the fields are separated by **spaces**.

Basic syntax:

```
awk 'pattern {action}' file
```

* **pattern** → condition to match
* **action** → what to do with the matched line

---

### Simple example

File `data.txt`

```
John 25 DevOps
Alice 30 QA
Bob 28 Developer
```

Command:

```
awk '{print $1}' data.txt
```

Output:

```
John
Alice
Bob
```

`$1` means **first column**.

---

### Print multiple columns

```
awk '{print $1, $3}' data.txt
```

Output:

```
John DevOps
Alice QA
Bob Developer
```

---

### Print last column

```
awk '{print $NF}' data.txt
```

`NF` = number of fields.

---

### Print specific line

```
awk 'NR==2 {print}' data.txt
```

`NR` = line number.
This prints **line 2**.

---

### Filter rows using condition

```
awk '$2 > 26 {print $1}' data.txt
```

Shows names where **age > 26**.

Output:

```
Alice
Bob
```

---

### Count number of lines

```
awk 'END {print NR}' file.txt
```

Shows total lines in the file.

---

### Print column headers with data

```
awk '{print "Name:", $1, "Role:", $3}' data.txt
```

Output:

```
Name: John Role: DevOps
Name: Alice Role: QA
Name: Bob Role: Developer
```

---

### Use custom delimiter

If the file is CSV:

```
John,25,DevOps
Alice,30,QA
```

Command:

```
awk -F "," '{print $1,$3}' file.csv
```

`-F` sets the **delimiter**.

---

### Use awk with pipe (common in DevOps)

Example: check running processes

```
ps -ef | awk '{print $2}'
```

Shows **process IDs**.

---

Example: check disk usage

```
df -h | awk '{print $1,$5}'
```

Shows **filesystem and usage percentage**.

---

### Real DevOps examples

**1. Get running container IDs**

```
docker ps | awk '{print $1}'
```

---

**2. Get IP addresses**

```
ip a | grep inet | awk '{print $2}'
```

---

**3. Show top memory processes**

```
ps aux | awk '{print $4,$11}'
```

---

### Most useful awk variables

| Variable | Meaning          |
| -------- | ---------------- |
| `$1`     | First column     |
| `$2`     | Second column    |
| `$NF`    | Last column      |
| `NR`     | Line number      |
| `NF`     | Number of fields |

---

### Quick comparison (important for interviews)

| Tool     | Purpose                        |
| -------- | ------------------------------ |
| **grep** | search text                    |
| **sed**  | edit/replace text              |
| **awk**  | analyze columns / process data |

---




