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

📒 Linux User Account Files & Commands

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

| Username | abhi |Name of the user account |
|----------|------|--------------------------|
| Password placeholder | x |Actual password is stored in /etc/shadow |
| User ID (UID) | 1001 | Unique ID of the user |
| Group ID (GID) | 1001 | Primary group ID of the user |
| User Info (GECOS) | Abhi Kumar | Full name or description of user |
| Home Directory | /home/abhi | Default login directory |
| Login Shell | /bin/bash | Shell assigned to the user |

📂 /etc/shadow
Stores encrypted passwords
Only accessible by root user
Improves system security
```
Example of /etc/shadow
abhi:$6$Tz3...Qw/:19540:7:90:10:14:19999
```
 Fields in /etc/shadow (Fields separated by :)

| Username | abhi | Name of the user |
| Encrypted Password | $6$Tz3...Qw/| Encrypted (hashed) password (Actual password is not readable)  |
| Last Password Change | 19540 | Number of days since 01-01-1970 |
| Minimum Days | 7 | Minimum days before password can be changed |
| Maximum Days | 90 | Password validity period |
| Warning Days | 10 | Days before password expiry warning |
| Inactive Days | 14 | Days after expiry before account is locked |
| Account Expiry Date | 19999 | Date when account expires (-1 or empty → never expires) |




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
```
chage -l <username>
→ List password aging information

chage -M 30 <username>
→ Maximum days password is valid

chage -m 7 <username>
→ Minimum days between password change

chage -W 10 <username>
→ Warning days before password expiry

chage -I 14 <username>
→ Inactive days after password expiry

chage -E 2025-12-31 <username>
→ Account expiry date

chage -d 0 <username>
→ Force password change at next login
```
## Modify Existing User
usermod Command: Used to modify user account details
Syntax:
```
usermod [options] <username>
```
Common usermod Options
```
usermod -s /sbin/nologin steve
→ Assign no-login shell
(Prevents user from logging in)

echo $shell
→ to check user shell

cat /etc/shells
→ Check Valid Login Shells

usermod -u <UID> <username>
→ Change User ID

usermod -u 3000 tony
→ Used to change user ID

usermod -d <new_home_dir> <username>
→ Assign new home directory

usermod -c "development center" bruce
→ Used to add comment for user

usermod -L <username>
→ Locks the user account

usermod -U <username>
→ Unlock User Account
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

| Group Name | developers| Name of the group |
| Password Placeholder  | x | Usually x (actual password stored in /etc/gshadow) |
| Group ID (GID) | 1005 | Numerical ID for the group |
| Group Members | alice,bob | Comma-separated list of users |


📂 Important Files in Group Management
1️⃣ /etc/group

Stores group information

Fields in /etc/group


Group name 

Password →

Group ID (GID) 

Group members 

2️⃣ /etc/gshadow

Stores secure group information

Only accessible by root

Stores encrypted group passwords

Fields in /etc/gshadow

Group name

Encrypted password

If password is stored here

! or * means no password

Group administrators

Group members

⚙️ Commands for Group Management
1️⃣ Add a Group
groupadd <groupname>


Used to create a new group

2️⃣ Delete a Group
groupdel <groupname>


Deletes the specified group

3️⃣ Add User to a Group

Using usermod

usermod -aG <groupname> <username>


-a → append

-G → secondary group

4️⃣ Set / Change Group Password
gpasswd -a <username> <groupname>


OR

gpasswd <groupname>



/etc/group → group details

/etc/gshadow → secure group data

groupadd, groupdel, usermod → main group commands


Linux Group Commands & File Permissions

👥 Group Password Management (gpasswd)
Common gpasswd Commands

1️⃣ Delete a Group

gpasswd -d <username> <groupname>


→ Removes user from the group

2️⃣ Add Multiple Users to a Group


gpasswd -M <user1,user2,user3> <groupname>
→ Adds multiple users to a single group

gpasswd -G <group1,group2,group3> <username>
→ Add a Single User to Multiple Groups


gpasswd -A <username> <group>
 Assigns admin to a group


gpasswd -A "" <groupname>
→ Removes Admin from Group








































To create a home directory:

useradd -m <username>
