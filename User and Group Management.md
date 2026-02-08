## User and Group Management Linux

## Types of Linux Users
1. Root User
The root user is the superuser in Linux.
Has unrestricted access to the entire system.
Can perform all administrative tasks, including:
Creating and deleting users
Modifying system files
Installing software
Configuring system settings
User ID (UID): 0
```
Common Root Commands
sudo -i → Switch to root user
sudo <command> → Execute a command with root privileges
```
2. System Users
System users are service accounts created by the system.
Used to run specific services or processes (e.g., web server, database).
Do not have login shells by default.
Have limited privileges to enhance system security.
User ID (UID) range: 1 – 999

3. Standard / Local Users
These users are created for daily tasks and normal operations.
Each user has:
Their own home directory (e.g., /home/username)
Specific permissions to access files and resources
Used for regular login and work.

Adding a New User
```
adduser <username>
```
Automatically creates Home directory, User group, Password and default settings
          OR
```
useradd <username>
```

⚠️ Note:By default, useradd does not create a home directory.
To create a home directory:
```
useradd -m <username>
```
Change / Set Password
```
passwd <username>
```
Delete User
```
userdel -r <username>
```
-r removes home directory also
List All Users
```
cat /etc/passwd
```

## Linux User Account Files & Commands

```
/etc/passwd
```
Stores user account information
File is readable by all users
```
Example of /etc/passwd file =
abhi:x:1001:1001:Abhi Kumar:/home/abhi:/bin/bash
Fields in /etc/passwd
```
Fields in /etc/passwd (Fields separated by :)
| Field Name               | Value        | Description                             |
| ------------------------ | ------------ | --------------------------------------- |
| **Username**             | `abhi`       | Name of the user account                |
| **Password Placeholder** | `x`          | Actual password stored in `/etc/shadow` |
| **User ID (UID)**        | `1001`       | Unique ID of the user                   |
| **Group ID (GID)**       | `1001`       | Primary group ID of the user            |
| **User Info (GECOS)**    | `Abhi Kumar` | Full name / description of user         |
| **Home Directory**       | `/home/abhi` | Default login directory                 |
| **Login Shell**          | `/bin/bash`  | Shell assigned to the user              |


📂 /etc/shadow
Stores encrypted passwords
Only accessible by root user
Improves system security
```
Example of /etc/shadow
abhi:$6$Tz3...Qw/:19540:7:90:10:14:19999
```
 Fields in /etc/shadow (Fields separated by :)

| Field Name               | Value          | Description                                                   |
| ------------------------ | -------------- | ------------------------------------------------------------- |
| **Username**             | `abhi`         | Name of the user                                              |
| **Encrypted Password**   | `$6$Tz3...Qw/` | Encrypted (hashed) password (actual password is not readable) |
| **Last Password Change** | `19540`        | Number of days since **01-01-1970**                           |
| **Minimum Days**         | `7`            | Minimum days before password can be changed                   |
| **Maximum Days**         | `90`           | Password validity period                                      |
| **Warning Days**         | `10`           | Days before password expiry warning                           |
| **Inactive Days**        | `14`           | Days after expiry before account is locked                    |
| **Account Expiry Date**  | `19999`        | Date when account expires (`-1` or empty → never expires)     |




/etc/shadow
Stores encrypted password hashes
Also stores password aging information
Improves system security

## Change Password Policy
chage Command 
chage In Linux is used the chage (change-age) command to manage and view password aging and
account expiration policies for user


Syntax:
```
chage [options] <username>
```
Common chage Options
→ List password aging information
```
chage -l <username>
```
→ Maximum days password is valid
```
chage -M 30 <username>
```
→ Minimum days between password change
```
chage -m 7 <username>
```
→ Warning days before password expiry
```
chage -W 10 <username>
```
→ Inactive days after password expiry
```
chage -I 14 <username>
```
→ Account expiry date
```
chage -E 2025-12-31 <username>
```
→ Force password change at next login
```
chage -d 0 <username>
```
## Modify Existing User
usermod Command: Used to modify user account details
Syntax:
```
usermod [options] <username>
```
Common usermod Options
1 Assign no-login shell →(Prevents user from logging in)
```
usermod -s /sbin/nologin steve
```
2 to check user shell
```
echo $shell
```
3 Check Valid Login Shells
```
cat /etc/shells
```
4 Change User ID
```
usermod -u <UID> <username>
```
5 Used to change user ID
```
usermod -u 3000 tony
```
6 Assign new home directory
```
usermod -d <new_home_dir> <username>
```
7 Used to add comment for user
```
usermod -c "development center" bruce
```
8 Locks the user account
```
usermod -L <username>
```
9 Unlock User Account
```
usermod -U <username>
```

## Sudoers File
What is Sudoers File?
```
/etc/sudoers is a configuration file
Controls who can run commands with elevated (root) privileges
Allows users to execute commands as root or superuser
Provides a secure way to manage administrative rights
```
## Add User to Sudoers File
```
1.Login as root

2.Open sudoers file:
vim /etc/sudoers

3.Go to the bottom of the file and add:

username ALL=(ALL) ALL

Meaning:
1st ALL → From any terminal
(ALL) → As any user

2nd ALL → Run all commands

```
##Important Note

Always edit sudoers file using : visudo (to avoid syntax errors)


## Group Management In Linux)

Group
A group is a collection of users that helps in managing permissions easily.

cat /etc/group (Entry Example)
developers:x:1005:alice,bob

Fields in /etc/group (Fields separated by :)
| Field Name               | Value        | Description                                       |
| ------------------------ | ------------ | ------------------------------------------------- |
| **Group Name**           | `developers` | Name of the group                                 |
| **Password Placeholder** | `x`          | Actual group password is stored in `/etc/gshadow` |
| **Group ID (GID)**       | `1005`       | Numerical ID for the group                        |
| **Group Members**        | `alice,bob`  | Comma-separated list of users                     |



## Important Files in Group Management
 Fields in /etc/group
| Field              | Description                                            |
| ------------------ | ------------------------------------------------------ |
| **Group Name**     | Name of the group                                      |
| **Password**       | Usually `x` (actual password stored in `/etc/gshadow`) |
| **Group ID (GID)** | Numerical ID assigned to the group                     |
| **Group Members**  | Comma-separated list of users in the group             |

Fields in /etc/gshadow

| Field                    | Description                    |
| ------------------------ | ------------------------------ |
| **Group Name**           | Name of the group              |
| **Encrypted Password**   | Stored group password (if any) |
|                          | `!` or `*` → No group password |
| **Group Administrators** | Users who can manage the group |
| **Group Members**        | Members of the group           |


## Commands for Group Management
1 Add a Group = Used to create a new group
```
groupadd <groupname>
```
2 Delete a Group = Deletes the specified group
```
groupdel <groupname>
```
3 Add User to a Group
```
usermod -aG <groupname> <username>
```
-a → append 
-G → secondary group

4 Set / Change Group Password
```
gpasswd -a <username> <groupname>
```
OR
```
gpasswd <groupname>
```

5 Delete a Group
```
gpasswd -d <username> <groupname>
```
6 Add Multiple Users to a Group
```
gpasswd -M <user1,user2,user3> <groupname>
```

7 Add a Single User to Multiple Groups
```
gpasswd -G <group1,group2,group3> <username>
```

8 Assign Group Admin

```
gpasswd -A <username> <group>
```

9 Remove Admin from Group
```
gpasswd -A "" <groupname>

```








































To create a home directory:

useradd -m <username>
