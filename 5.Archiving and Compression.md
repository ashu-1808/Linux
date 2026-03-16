## Archiving
Archiving is the process of combining multiple files and directories into a single file 
(called an archive) without reducing their size.
Combines multiple files into a single file

Use Cases:
 1 Backup
 2 Data transfer
 3 Better file organization

 TAR :(Tape Archive)
It is usd to create and extract file.
```
Syntax
tar <options> <archive_name> <files/directories>
```
## Common Options
| Option | Meaning               |
| ------ | --------------------- |
| -c     | Create archive        |
| -x     | Extract archive       |
| -v     | Verbose               |
| -f     | File name             |
| -C     | Extract to directory  |
| -t     | List archive contents |
| -z     | gzip                  |
| -j     | bzip2                 |
| -J     | xz                    |

## Compression 
Compression is the process of reducing the size of a file by removing redundant data,
to save disk space and speed up data transfer.

Use Cases: 
 1 Save Disk Space
 2 Faster Data Transfer
 3 Software Distribution
 4 Archiving Large Projects
 
## Compression Tools
| Tool  | Compression | Decompression |
| ----- | ----------- | ------------- |
| gzip  | gzip file   | gunzip file   |
| bzip2 | bzip2 file  | bunzip2 file  |
| xz    | xz file     | unxz file     |

| Tool  | Speed | Compression | Best Use           |
| ----- | ----- | ----------- | ------------------ |
| gzip  | 4/5   | 3/5         | Fast, daily use    |
| bzip2 | 2/5   | 4/5         | Better compression |
| xz    | 1/5   | 5/5         | Smallest size      |


Check directory size
```
du -sh /etc
```
## Create & Extract Archives
1️⃣ gzip (.tar.gz / .tgz)
```
Create Archive (gzip)
tar -cvzf backup.tar.gz /etc

Extract Archive
tar -xvzf backup.tar.gz

Extract to Specific Directory
tar -xvzf backup.tar.gz -C /opt
```
2️⃣ bzip2 (.tar.bz2)
```
Create Archive (bzip2)
tar -cvjf backup.tar.bz2 /etc

Extract Archive
tar -xvjf backup.tar.bz2

Extract to Specific Directory
tar -xvjf backup.tar.bz2 -C /opt
```
3️⃣ xz (.tar.xz)
```
Create Archive (xz)
tar -cvJf backup.tar.xz /etc

Extract Archive
tar -xvJf backup.tar.xz

Extract to Specific Directory
tar -xvJf backup.tar.xz -C /opt
```
4️⃣ zip (.zip)
```
Create Zip Archive
zip -r backup.zip /etc

Extract Zip Archive
unzip backup.zip

Extract to Specific Directory
unzip backup.zip -d /opt
```
| Tool  | Create      | Extract     |
| ----- | ----------- | ----------- |
| gzip  | `tar -cvzf` | `tar -xvzf` |
| bzip2 | `tar -cvjf` | `tar -xvjf` |
| xz    | `tar -cvJf` | `tar -xvJf` |
| zip   | `zip -r`    | `unzip`     |

## Compression &  Decompression
| Tool      | Compression Command     | Compressed File | Decompression Command  | Use Case                         |
| --------- | ----------------------- | --------------- | ---------------------- | -------------------------------- |
| **gzip**  | `gzip file.txt`         | `file.txt.gz`   | `gunzip file.txt.gz`   | Fast, daily use, logs            |
| **bzip2** | `bzip2 file.txt`        | `file.txt.bz2`  | `bunzip2 file.txt.bz2` | Better compression than gzip     |
| **xz**    | `xz file.txt`           | `file.txt.xz`   | `unxz file.txt.xz`     | Maximum compression              |
| **zip**   | `zip file.zip file.txt` | `file.zip`      | `unzip file.zip`       | Windows & cross-platform sharing |
