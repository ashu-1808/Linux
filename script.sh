1.
#!/bin/bash

echo "HEllO WELCOME TO PYTHON SESSION....!"
----

2.
#!/bin/bash

name="seema"
age=22
echo "Name is $name and age is $age"
----

3.
#!/bin/bashi
readonly college="ABC"
echo "college name is $college"
college="metro"
echo "college is  $college"
---

4.
#!/bin/bash
echo "checking comments"
# this one is for checking comments
echo "multiple line comment"
<<comment
this
is
multiline
comment
---

5.
#!/bin/bash
echo "Enter your name and age:"
read name age
echo "your name is $name and age is $age"
---

6.
#!/bin/bash
name="seema"
echo "name is $name"
echo "date is $(date)"
echo "current working directory is $(pwd)"
---

7.
#!/bin/bash
echo "first argument is $1"
echo "second argumennt is $2"
echo "third argument is $3"
echo "display all argument $@"
echo "total no of argument $#"
---


8.
#!/bin/bash
cp $1 $2
---

9.
#!/bin/bash
filename="demo.txt"
filecontents=$(cat $filename)
echo "file contents:"
echo "$filecontents"
---

10.
#!/bin/bash
echo "Enter file name:"
read filename
filecontent=$(cat $filename)
echo $filecontent
---

11.
#!/bin/bash
echo "welcome to this worldd.........!" >FILE.txt
---

12.
#!/bin/bash
echo "this is second line" >> FILE.txt
---

13.
#!/bin/bash
echo "enter file name:"
read filename
echo "this is the third text line" >> $filename
---

14.	
#!/bin/bash
echo "Enter file name :"
read filename
echo "Enter date:"
read data
echo "$data" >> $filename
---

15.
#!/bin/bash
echo "enter file name"
read filename
cat <<EOF > $filename
this is first line
this is second line
this is third line
this is fourth line
EOF
---

16.
#!/bin/bash
echo "Enter file name"
read filename
echo "Enter data (press ctrl+d to save):"
cat >>$filename
---

17.
#!/bin/bash

file="app.log"

if [ -f $file ]

then
        echo "log file exists:"
else
        echo "log file missing.creating..."
        touch $file

fi
---

18.
#!/bin/bash

file="demo"

if [ -f $file ]

then
        echo "file exists"

elif [ -d $file ]

then
        echo "this is directory not a file"

else
        echo "file not found"

fi
---

19.
#!/bin/bash

file="data.txt"

if [ -f $file ]

then
        cp $file ${file}_backup
        echo "backup created"
else
        echo "file not found"

fi
---

20.
#!/bin/bash

echo "Enter username:"
read name

if [ $name = "admin" ]
then
       echo "Welcome Admin"
else
       echo "access denied"

fi
---

21.
#!/bin/bash

echo "Enter username:"
read name

if [ $name = "admin" ]
then
       echo "Welcome Admin"
else
       echo "access denied"

fi
----

22.
#!/bin/bash

usage=$( df -h /  | awk 'NR==2 {print $5}'| sed 's/%/ /' )

if [ $usage -gt 80 ]

then
        echo "Disk space is critical: $usage"
else
        echo "Disk space is normal: $usage"

fi





















