## What is Cron?
Cron is a time-based job scheduler in Linux/Unix that is used to automatically execute commands 
or scripts at fixed intervals (minute, hour, day, week, or month).
It runs as a background service called crond.

## Used cases:
  1.Automated backups
  2.Log rotation
  3.System maintenance tasks
  4.Monitoring scripts
  5.Scheduled reports

## How Cron works
   1.Jobs are defined in a file called crontab
   2.Each user can have their own crontab
   3.Cron checks the schedule every minute and runs matching jobs

Crontab Commands
Edit cron jobs
```
crontab -e    
```
List cron jobs
```
crontab -l   
```
Remove all cron jobs
```
crontab -r
```
## Cron Syntax (Correct)
* * * * * command
| | | | |
| | | | └── Day of week (0–6, Sunday=0)
| | | └──── Month (1–12)
| | └────── Day of month (1–31)
| └──────── Hour (0–23)
└────────── Minute (0–59)
## Cron Installation

Amazon Linux
```
sudo yum install cronie -y
sudo systemctl enable crond
sudo systemctl start crond
```
Ubuntu
```
sudo apt update
sudo apt install cron -y
sudo systemctl enable cron
sudo systemctl start cron
```
## Common Cron Examples (Corrected & Verified)
```
Best Practice: Always use absolute paths in cron jobs.
```

| Cron Expression | Command                 | Meaning                               |
| --------------- | ----------------------- | ------------------------------------- |
| `0 0 * * *`     | `/home/user/backup.sh`  | Runs **daily at midnight (12:00 AM)** |
| `0 6,18 * * *`  | `/home/user/backup.sh`  | Runs at **6 AM and 6 PM every day**   |
| `0 */6 * * *`   | `/home/user/monitor.sh` | Runs **every 6 hours**                |
| `*/10 * * * *`  | `/home/user/script.sh`  | Runs **every 10 minutes**             |
| `0 * 20 7 *`    | `/home/user/backup.sh`  | Runs **every hour on July 20**        |


## Linux Process Management
A process is a running instance of a program loaded into memory.
Linux supports multitasking, meaning multiple processes can run simultaneously.

Each process has:
 1.PID (Process ID)
 2.PPID (Parent Process ID)
 3.Owner (user)
 4.Priority (nice value)
 5.State

## Process States 
| State            | Description                                              |
| ---------------- | -------------------------------------------------------- |
| **Running (R)**  | Actively using CPU                                       |
| **Sleeping (S)** | Waiting for I/O or event                                 |
| **Stopped (T)**  | Paused manually (Ctrl+Z / SIGSTOP)                       |
| **Zombie (Z)**   | Process finished but parent hasn’t collected exit status |

Note: Zombie processes do NOT consume CPU, only a PID entry.

## Killing Processes 
1 Graceful Termination 
```
kill <PID>
```

Sends SIGTERM (15)
Allows cleanup (closing files, saving state)
```
Example:
kill 1234
```
2 Force Kill (Last Option)
```
kill -9 <PID>
```
Sends SIGKILL (9)
Immediate termination
No cleanup → may cause data corruption

```
Example:
kill -9 93483
```

⚠️ Use SIGKILL only if SIGTERM fails

3 Kill by Process Name--(Kills all processes with name nginx)
```
killall nginx
```



4 Kill by User--(Kills all processes owned by user ubuntu)
```
pkill -u ubuntu
```



## Important Linux kill Signals 

| Signal  | Number | Purpose               |
| ------- | ------ | --------------------- |
| SIGTERM | 15     | Graceful termination  |
| SIGKILL | 9      | Force kill            |
| SIGSTOP | 19     | Pause process         |
| SIGCONT | 18     | Resume paused process |


## Working with Jobs
```
jobs : The jobs command displays a list of background (running) and stopped jobs started from the current shell. 
```
| Command | Description   |
| ------- | ------------- |
| jobs    | List all jobs |
| jobs -r | Running jobs  |
| jobs -s | Stopped jobs  |
| jobs -p | Show PIDs     |
| jobs -l | Detailed info |

Job Control Commands
| Command    | Purpose                  |
| ---------- | ------------------------ |
| `fg`       | Bring job to foreground  |
| `bg`       | Resume job in background |
| `Ctrl + Z` | Stop (suspend) job       |
| `Ctrl + C` | Terminate job            |

## Foreground Job /Process (

A foreground job (or foreground process) is a process that runs directly in the terminal and occupies it until the execution is 
completed or stopped.
While a foreground job is running, you cannot run another command in the same terminal.

Key Characteristics
 1.Runs attached to the terminal
 2.Receives keyboard input
 3.Blocks the command prompt
 4.Started without &
Example
 sleep 30

  i.The terminal is busy for 30 seconds
  ii.You must wait until it finishes or stop it
## Background Job/process
A background job is a process that runs without occupying the terminal, allowing you to continue using the same terminal to execute other commands.
It runs detached from direct keyboard input.

Key Characteristics
 1.Runs in the background
 2.Does not block the terminal
 3.Started using &
 4.Managed using jobs, fg, and bg
Example
  sleep 100 &
  
 i.Command runs in background
 ii.Terminal prompt is immediately available  


## Niceness Value 

-The niceness value is a number that determines the CPU scheduling priority of a process in Linux.
-It tells the scheduler how “nice” a process is to other processes when competing for CPU time.

Niceness Range (Very Important)
-20  → Highest priority (least nice)
  0  → Default priority
 19  → Lowest priority (most nice)


Lower value = higher priority
Higher value = lower priority

Why Niceness Is Used
 1.To control CPU usage
 2.To prevent one process from starving others
 3.Useful in multi-user or server environments 

View Niceness Value (Look at the NI column )
```
ps -l
```
Start a Process with Niceness
```
nice -n 10 sleep 60
```
Change Niceness of a Running Process
```
renice -n -5 -p <PID>
```
⚠️ Only root can set negative niceness values.

  
