

# Linux Shell Scripting – Basic Interview & Revision Notes (Corrected Version)

---

## 1. What is Linux Shell?

### Definition

- A **Linux Shell** is an interface between:

  . The **User**
  . The **Operating System (Kernel)**

---

### Functions of Shell

The shell performs the following functions:

1. Accepts commands from the user
2. Interprets the commands
3. Executes the commands by passing them to the kernel
4. Displays the output to the user

---

### Key Points

1. The shell acts as a **command interpreter**.
2. Users cannot directly interact with the kernel without a shell.
3. The kernel interacts directly with the hardware.

---

### Execution Flow

User → Shell → Kernel → Hardware

---

## 2. Applications of Shell

Shell is mainly used for:

1. File and directory manipulation (create, delete, modify files)
2. Program execution
3. User interaction (input/output handling)
4. Task automation (backup, cleanup, monitoring)
5. System administration tasks:
  a. User management
  b. Service management
  c. Process management

---

## 3. What is a Shell Script?

### Definition

A **Shell Script** is a text file containing a set of Linux commands.

---

### Execution Behavior

 Commands are executed **sequentially (line by line)**.

---

### Purpose

1. Automate repetitive tasks
2. Reduce manual work
3. Ensure consistency in operations
4. Save time and minimize human errors

---

## 4. Shell Script Format

### Shebang Line

```bash
#!/bin/bash
```

---

### Meaning

- `#!` → Shebang (interpreter directive)
- `/bin/bash` → Specifies the Bash shell interpreter

---

### Purpose

 Tells the system which interpreter should execute the script.

⚠ Note: It is required when executing the script using `./script.sh`.

---

### Making Script Executable

```bash
chmod +x script.sh
```

---

### Running the Script

```bash
./script.sh
```

OR

```bash
bash script.sh
```

---

## 5. Types of Shells

Commonly used shells in Linux:

1. **Bourne Shell (sh)** : Original Unix shell

2. **Bourne Again Shell (bash)** : Enhanced version of sh, Default shell in most Linux distributions

3. **Korn Shell (ksh)** : Enhanced scripting features

4. **C Shell (csh)** : C-like syntax

5. **TC Shell (tcsh)** : Improved version of csh

---

## 6. Echo Command

### Purpose

- Used to display output on the terminal.

---

### Syntax

```bash
echo "Hello World"
```

---

### Example

```bash
name="Ashutosh"
echo "My name is $name"
```

---

### Additional Useful Options

```bash
echo -n "Hello"    # Prints without a newline
echo -e "Hi\nBye"  # Enables escape sequences
```

---


## 7. Check Type of Shell

### To check the current shell:

```bash
echo $SHELL
```

### To check Bash version:

```bash
bash --version
```

### Purpose:
Helps identify which shell is currently being used.

---

## 8. Variables in Shell Script

### Key Points:

1. Variables are case-sensitive.
2. No space is allowed before or after `=`.
3. No need to declare data type.
4. Variable names should start with a letter or underscore.
5. Variable names should not start with a number.

### Correct Syntax:

```bash
variable_name="value"
```

### Example:

```bash
name="Ashutosh"
echo $name
```

### Incorrect Example:

```bash
name = Ashutosh   # ❌ Wrong (space not allowed)
```

---

## 9. Taking Input from User

### Purpose:

1. `read` command is used to take input from the user at runtime.
2. Makes scripts interactive.

### Syntax:

```bash
read variable_name
```

### Example:

```bash
echo "Enter your name:"
read name
echo "Hello $name"
```

### Professional Version:

```bash
read -p "Enter your name: " name
echo "Hello $name"
```

---

## 10. If-Else Conditional Statement

### Purpose:

1. Used for decision-making in shell scripts.
2. Executes commands based on conditions.

### Syntax:

```bash
if [ condition ]
then
    commands
elif [ condition ]
then
    commands
else
    commands
fi
```

### Important Rules:

1. Leave space inside square brackets.
  ✔ `[ $age -ge 18 ]`
  ❌ `[$age -ge 18]`
2. `fi` is used to close the if block.

### Example: Voting Eligibility

```bash
echo "Enter your age:"
read age

if [ "$age" -ge 18 ]
then
    echo "You are eligible to vote"
else
    echo "Sorry, you are not eligible to vote"
fi
```

---

## 11. Comparison Operators (Numeric)

Used mainly inside `if` conditions.

| Operator | Meaning                  |
| -------- | ------------------------ |
| -eq      | Equal to                 |
| -ne      | Not equal to             |
| -gt      | Greater than             |
| -lt      | Less than                |
| -ge      | Greater than or equal to |
| -le      | Less than or equal to    |

### Example:

```bash
a=10
b=5

if [ $a -gt $b ]
then
    echo "A is greater than B"
fi
```

---

## 12. Executing a Shell Script

### 12.1 Steps to Execute a Script

1. Check file permissions:

```bash
ls -l script.sh
```

2. Add execute permission (if not present):

```bash
chmod +x script.sh
```

3. Run the script:

```bash
./script.sh
```

---

### 12.2 Running Script Without Execute Permission

If execute permission is not granted, you can run the script using:

```bash
bash script.sh
```

✔ This does not require `chmod +x`.

---

## 13. Switch Case Statement

### 13.1 Purpose

1. Used when multiple conditions need to be checked.
2. Cleaner and more readable than multiple `if-elif` statements.
3. Commonly used in menu-driven programs.

---

### 13.2 Syntax

```bash
case variable in
    pattern1)
        commands
        ;;
    pattern2)
        commands
        ;;
    *)
        default_commands
        ;;
esac
```

✔ `;;` ends each case block.
✔ `esac` closes the case statement.

---

### 13.3 Example

```bash
echo "Enter a number (1-3):"
read choice

case $choice in
    1)
        echo "You selected One"
        ;;
    2)
        echo "You selected Two"
        ;;
    3)
        echo "You selected Three"
        ;;
    *)
        echo "Invalid choice"
        ;;
esac
```

---

## 14. For Loop

### 14.1 Purpose

1. Used to execute a block of commands multiple times.
2. Helpful for repetitive tasks.

---

### 14.2 Basic For Loop (List of Values)

```bash
for i in 1 2 3 4 5
do
    echo "Number: $i"
done
```

---

### 14.3 Loop Over Strings

```bash
for name in Ram Shyam Sita
do
    echo "Name: $name"
done
```

---

### 14.4 Range-Based Loop (Bash)

```bash
for i in {1..5}
do
    echo $i
done
```

✔ Works in Bash shell.

---

### 14.5 C-Style For Loop (Recommended)

```bash
for (( i=1; i<=5; i++ ))
do
    echo $i
done
```

✔ More flexible and commonly used in scripting.

---

## 15. Comments in Shell Script

### 15.1 Single-Line Comment

1. Starts with `#`
2. Used to explain code

```bash
# This is a comment
echo "Hello"
```

---

### 15.2 Multi-Line Comment (Workaround)

⚠ Bash does not officially support multi-line comments.

Common workaround:

```bash
: '
This is a
multi-line
comment
'
```

OR

```bash
<<COMMENT
This is a
multi-line
comment
COMMENT
```

✔ These are workarounds, not true multi-line comments.

---

## 16. While Loop

### 16.1 Purpose

1. Executes a block of commands as long as the condition remains true.
2. Used when the number of iterations is not fixed.

---

### 16.2 Syntax

```bash
while [ condition ]
do
    commands
done
```

---

### 16.3 Example

```bash
i=1

while [ $i -le 5 ]
do
    echo "Number is $i"
    i=$((i + 1))
done
```

✔ The loop stops when the condition becomes false.
✔ `done` closes the while loop.

---

## 17. Iterating Values from a File

### 17.1 Purpose

1. Reads values line by line from a file.
2. Commonly used in data processing and configuration handling.

---

### 17.2 Example

Suppose `names.txt` contains:

```
Ram
Shyam
Sita
```

Script:

```bash
while read name
do
    echo "Name: $name"
done < names.txt
```

✔ `< names.txt` redirects file input to the loop.
✔ `read` reads one line at a time.

---

## 18. Arithmetic Expressions

### 18.1 Purpose

1. Used to perform arithmetic operations in shell scripting.
2. Mainly works with integers.

---

### 18.2 Using `let`

```bash
a=10
b=5

let sum=a+b
echo $sum
```

---

### 18.3 Recommended Method (`$(( ))`)

```bash
a=10
b=5

sum=$((a + b))
echo $sum
```

✔ `$(( ))` is preferred over `let` in modern scripts.

---

## 19. Alias

### 19.1 Purpose

1. An alias is a shortcut for a long command.

---

### 19.2 Syntax

```bash
alias short_name="original_command"
```

---

### 19.3 Example

```bash
alias ll="ls -l"
```

Now typing:

```bash
ll
```

Will execute:

```bash
ls -l
```

---

### 19.4 Display All Aliases

```bash
alias
```

---

## 20. Display Script Name

### 20.1 Using `$0`

1. `$0` stores the name (or path) of the script being executed.

Example:

```bash
echo "Script name is: $0"
```

---

### 20.2 Using `basename`

Removes the directory path and displays only the file name:

```bash
basename /home/user/scripts/myscript.sh
```

Output:

```
myscript.sh
```

---

## 21. Functions in Shell Script

### 21.1 Definition

1. A function is a reusable block of code.
2. Helps reduce duplication.
3. Improves readability and maintainability.

---

### 21.2 Function Declaration (Method 1)

```bash
greet() {
    echo "Hello"
}
```

---

### 21.3 Function Declaration (Method 2)

```bash
function greet {
    echo "Hello"
}
```

✔ Both methods are valid in Bash.

---

### 21.4 Calling a Function

```bash
greet
```

✔ Use only the function name to call it.
❌ Do not use parentheses when calling the function.

---


## 22. Function with Arguments

### 22.1 Example

Functions can accept arguments just like scripts.

```bash
add() {
    num1=$1
    num2=$2
    sum=$((num1 + num2))
    echo "Sum is $sum"
}

add 10 20
```

### Explanation:

1. `$1` → First argument
2. `$2` → Second argument
3. Arguments are passed when calling the function.

✔ Output:

```
Sum is 30
```

---

## 23. Special Shell Variables

| Variable      | Description                          |
| ------------- | ------------------------------------ |
| `$0`          | Name (or path) of the script         |
| `$1, $2, ...` | Positional parameters                |
| `$#`          | Number of arguments passed           |
| `$?`          | Exit status of last executed command |
| `$$`          | Process ID (PID) of current script   |
| `$RANDOM`     | Generates a random number (0–32767)  |
| `$EUID`       | Effective user ID                    |

---

## 24. Random Number Example (Dice Game)

```bash
#!/bin/bash

number=$((RANDOM % 6 + 1))
echo "Dice rolled: $number"
```

### Explanation:

1. `$RANDOM` generates a random number between 0 and 32767.
2. `% 6 + 1` limits the result to numbers between 1 and 6.

---

## 25. Check if Script is Executed by Root User

### Concept:

1. Root user has UID = 0.
2. `$EUID` stores the effective user ID.

### Example:

```bash
if [ "$EUID" -eq 0 ]
then
    echo "You are root user"
else
    echo "You are not root user"
fi
```

✔ Useful for scripts that require administrator privileges.

---


## 26. Input / Output Redirection

### Why Redirection is Used:

1. Redirect command output to a file
2. Take input from a file instead of keyboard
3. Separate standard output and standard error
4. Automate logging and scheduled jobs

---

## 27. Types of Redirection

| Symbol | Description                                |
| ------ | ------------------------------------------ |
| `>`    | Redirect output (overwrite file)           |
| `>>`   | Redirect output (append to file)           |
| `<`    | Take input from file                       |
| `2>`   | Redirect standard error                    |
| `&>`   | Redirect both output and error (Bash only) |

---

## 28. Redirect Command Output to File

### 28.1 Overwrite Output

```bash
ls > output.txt
```

✔ Existing content in the file will be replaced.

---

### 28.2 Append Output

```bash
ls >> output.txt
```

✔ New output is added at the end of the file.

---

## 29. Redirect Errors to File

### Purpose:

1. Store error messages separately.
2. Useful for debugging.

---

### Example:

```bash
ls /invalid_directory 2> error.txt
```

✔ The error message will be stored in `error.txt`.

---

## 30. Reading Input from File Inside Script

### 30.1 Purpose

1. Used to read file content inside a script.
2. Helpful for processing configuration files or data files.

---

### 30.2 Example (Read Entire File into Variable)

```bash
#!/bin/bash

FILE="/home/user/config.txt"

content=$(cat "$FILE")
echo "$content"
```

✔ `$( )` is command substitution.
✔ Always use quotes to handle spaces correctly.

---

### Recommended Method (Read Line by Line)

```bash
#!/bin/bash

FILE="config.txt"

while read line
do
    echo "$line"
done < "$FILE"
```

✔ Reads file line by line.
✔ Better for large files.

---

## 31. What is /dev/null?

### 31.1 Explanation

1. `/dev/null` is a special system file.
2. Any data written to it is discarded permanently.
3. Also known as the "black hole" of Linux.

---

### 31.2 Use Cases

1. Suppress unwanted output.
2. Ignore error messages.
3. Clean script execution.

---

### 31.3 Examples

Discard standard output:

```bash
ls > /dev/null
```

Discard error output:

```bash
ls /invalid_directory 2> /dev/null
```

Discard both output and error (Bash):

```bash
ls /invalid_directory &> /dev/null
```

---

## 32. Arguments in Shell Script

### 32.1 Purpose

1. Allows passing values at runtime.
2. Makes scripts dynamic and reusable.

---

### 32.2 Running Script with Arguments

```bash
./script.sh arg1 arg2
```

✔ Arguments are separated by spaces.

---

## 33. Accessing Script Arguments

| Variable | Meaning                             |
| -------- | ----------------------------------- |
| `$0`     | Script name (or path)               |
| `$1`     | First argument                      |
| `$2`     | Second argument                     |
| `$#`     | Total number of arguments           |
| `$@`     | All arguments (individually quoted) |
| `$*`     | All arguments (as a single string)  |

✔ Arguments are passed from left to right.

---

## 34. Example Script (Arguments)

### 34.1 Script

```bash
#!/bin/bash

echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Total arguments: $#"
```

---

### 34.2 Run

```bash
./script.sh Ram Shyam
```

Output:

```
Script name: ./script.sh
First argument: Ram
Second argument: Shyam
Total arguments: 2
```

---

## 35. Shifting Arguments using shift

### 35.1 Concept

1. `shift` removes the first positional argument.
2. Remaining arguments move one position to the left.
3. Useful for processing arguments sequentially.

---

### 35.2 Example

```bash
#!/bin/bash

echo "Before shift: $1"
shift
echo "After shift: $1"
```

Run:

```bash
./script.sh Apple Mango
```

Output:

```
Before shift: Apple
After shift: Mango
```

---

## 36. Practical Example – User Creation Script

⚠ This requires root privileges.

---

### 36.1 Script

```bash
#!/bin/bash

echo "User creation in progress..."

useradd "$1"

echo "User $1 created successfully."
```

---

### 36.2 Run

```bash
sudo ./script.sh John
```

✔ `$1` is used as the username.
✔ `sudo` is required to create users.

---








