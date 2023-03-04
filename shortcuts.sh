#!/bin/bash

11ls -lh /usr/bin
sort -u users.txt
grep -i "needle" haystack
command (ls, sort, grep)
options (-lh, -u, -i "needle")
arguments (/usr/bin, users.txt, haystack

[ec2-user@172-31-53-76 ~]$
~ is user home folder

ls = lists folders and directories
ls -l = lists long list with read/write privileges

Ctrl + A = moves to beginning of line
Ctrl + E = moves to end of line
Ctrl + Left Arrow = moves backward a word
Ctrl + Right Arrow = moves forward a word
Ctrl + U = Deletes from cursor to beginning
Ctrl + K = Deletes from cursor to end of line
Ctrl Shift C = Copy to clipboard
Ctrl Shift V = Paste from clipboard

man ls = manual for ls "list" command ("h" key for help, "f" key for forward page, "b" for backward page,
"q" when done).

ls --help = short help section

cd Documents/ = change directory to Documents folder
cd .. = brings us to Parent directory of the current directory
pwd = print working directory
cd - = brings us to previous folder
cd = brings us to home directory (~)

home/ec2-user/Documents/Exercise Files
cd Exercise Files/ = will not work
cd Exercise\ Files/ = will work with backslash (or can use cd 'Exercise Files')

mkdir new_folder = creates a new directory/folder called new_folder
mkdir Departments/CustomerService = creates a new directory CustomerService in the Departments Folder.

mkdir Departments/CustomerService/Docs Departments/CustomerService/Cases Departments/CustomerService/Awards
= (creates 3 folders under Departments/CustomerService)

mkdir -p Departments/Legal/Contracts (creates all needed Parent folders. Creates Legal folder, then Contracts
subfolder)

rmdir Departments/Legal/Contracts (folder has to be empty to remove)

*resume 'Copy, move, delete files'

cp poems.txt poems2.txt = creates a copy of poems.txt with new name poems2.txt

cp poems.txt Departments/Hr/Employee\ Info = creates a copy in listed directory

mv poems2.txt Department/Marketing = moves poems2.txt to listed directory

mv Departments/Marketing/poems2.txt Departments/Marketing/literature.txt = poems2.txt file renamed to literature.txt

mv Departments/Marketing/poems2.txt . = moves poems2.txt to current working directory

mv *.txt Departments/Marketing = moves all .txt files in current folder to Departments/Marketing

mv Departments/Marketing/* . = moves all files under Marketing folder into current working directory

rm literature.txt = removes literature.txt file (No Recycle Bin)

rm poems?.txt = removes poems1.txt, poems2.txt, etc (? is just 1 character).

rm -R Departments/CustomerService = removes CustomerService folder and contents recursively

(root is the superuser) (sudo = substitute user do)
sudo ls /root = see contents of root folder
sudo -k = gives up permission to superuser

rwxrwxrwx poems.txt = (user, group, others. Read, Write, eXecute)
Symbolic File Permissions (chmod)
u+rwx (adds all 3 permissions to User)
g=r (adds Read permission to Group but removes all other permissions)
o-rwx (removes all 3 permissions from Others)
a+rwx (all) (gives all 3 permissions to all 3 types of users User/Group/Others)
(if you leave out prefix, chmod will apply to all values)

touch newfile.txt = creates newfile.txt file and adds -rw-rw-r-- permissions

vi test2.sh = goes into text editor for that file.
	press "i" key for insert mode.
	press "escape" key to get out of insert mode and into command mode.
	press ":w" to save file.
	press "wq" to write/save and quit which saves as well.
	press ":q!" quit without saving changes.
	press ":w newfile.txt" to save the new file with that name

sudo chown root test2.sh = need superuser, to changeownership to root. (sudo privliges needed to change
	permission to root).

echo "hello" = writes out hello
echo "hello world" | wc = pipes to wc (word count) returns 1 2 12 (1 line, 2 words, 12 chars/bytes) (-l just shows lines)

cat poems.txt = outputs file (cat = concatenate and print files)


head poems.txt = outputs first 10 lines of file
tail  poems.txt = outputs last 10 lines of file
head -n 5 poems.txt = outputs first 5 lines of file
tail -n 5 poems.txt = outputs last 5 lines of file
cat poems.txt | cat -n | tail -n 5 = output all lines, then number them, then take last 5 lines
	4 Hi
	5 I met
	6 Almost
	7 Hi Again
	8 This is the last line of text

cat poems.txt | tail -n 5 | cat -n = output all lines, then take last 5 lines, then number them
	1 Hi
	2 I met
	3 Almost
	4 Hi Again
	5 This is the last line of text

less poems.txt = outputs file in pagination format simliar to "man" ("b" back, "f" forward, etc).

*grep (prints lines of text that match a pattern.  CASE SENSITIVE)
grep "the" poems.txt = outputs line that have the letters "the" and highlights them.
grep -n "the" poems.txt = adds line numbers
grep -i "the" poems.txt = -i makes it case insensitive
grep -vi "the" poems.txt = only returns lines without the letters "the"
grep -E "[hijk]" poems.txt = returns all lines that have h, i, j, k and highlights them.
grep -E "\w{6,}" poems.txt = returns all lines that have 6 or more characters considered word characters
grep -rniw './' -e 'pattern'  =  search for pattern Recursively, liNe number, Ignore case (W matches whole word)

awk '{print $2}' simple_data.txt = print returns the value at specified field (returns 2nd column)
awk '{print $2 "\t" $1}' simple_data.txt | sort -n = print returns the value at specified field
	(returns 2nd column), then a tab, then the data from column 1, then sorted by the 2nd column ($2).

sed (stream editor, changes data)
sed s/Orange/Red/g simple_data2.txt = changes all instances of strings "Orange" to "Red" (/s means substitute, /g replaces
	all occurences on all lines, w/o /g only first instance)
sort -k2nr -t\; simple_data2.txt = numeric sort (k2 is 2nd column, n is numeric sort, r is reverse.
	 -t\; specifies delimeter is ;(escaped))
sort -u dupes.txt = removes duplicate lines of text
cat simple_data.txt | tr [:lower:] [:upper:] = uppercases everything in the file.

Redirection:
Standard input (stdin) - Keyboard input - Descriptor = 0
Standard output (stdout) - Text on screen - Descriptor = 1
Standard error (stderr) - Error text on screen - Descriptor = 2

ls 1> filelist.txt = lists (ls) the standard output (1>) to a new file (filelist.txt)
(also can use ls > filelist.txt)

ls notreal (gives error "ls: cannot access notreal: No such file or directory" which is the Standard Error)
ls notreal 2> filelist4.txt = gives same error but puts Standard error (2>) into filelist4.txt
>filelist4.txt = send an empty string to that file and overwrite everything (cat filelist4.txt returns nothing)
echo "and some appending text" >> filelist5.txt = appends that string text to end of filelist5.txt



------------------------------  Updated 11/13/2017 -----------------------------
mv bin _bin    = changes name of bin directory to _bin

echo $BASH  = tells us bash is installed should return '/bin/bash'
less alice.txt  = like 'cat' but does pagination, 'q' to quit
file alice.txt  = tells us file type (which is ASCII text)
rm -ri test  = recusively remove test directory and files, but ask for each file and directory
(rm nope!) find . -type f -name '*.class' -delete -- recursively search current directory and sub's, finds file name
	'*.class' then deletes it
touch {a,b,c}.txt   =  touch a.txt b.txt c.txt
mv file.{txt,jpg} dir/   =  mv file.txt file.jpg dir
touch {a..c}{1..3}.txt   =  creates 9 files a1.txt, a2.txt, a3.txt, b1.txt, etc
mv *{txt,jpg} Documents   =  mv *txt *jpg Documents

[ec2-user@ip-172-31-55-170 demo]$ cat > story.txt
It was a dark and stormy night...
Hello
^C
[ec2-user@ip-172-31-55-170 demo]$ cat story.txt
It was a dark and stormy night...
Hello
[ec2-user@ip-172-31-55-170 demo]$

ls | less   =  take output of ls and inputs into less
grep 1978 oscars.tsv | sort > 1978_films.txt  = searches file for '1978' then sorts, then puts into file
grep \; oscars.tsv    =  searches for all instances of ; in oscars.tsv (need to escape ; because its special char to unix)
tr \\t \; < oscars.tsv > oscars.csv   = takes input from oscars.tsv, replaces (tr) all tabs (\t is the tab char, needs escaping), semi
	colons (; escaped).  Then outputs that to oscars.csv

echo "hello, $(whoami)"   = prints out "hello, ec2-user" (or brkays, etc)
[root@ip-172-31-55-170 bin]# echo "hello, $(whoami)"
hello, root

[ec2-user@ip-172-31-55-170 ~]$ echo "Buy milk" > "notes_$(date).txt"
[ec2-user@ip-172-31-55-170 ~]$ cat notes_Tue\ Nov\ 14\ 00\:52\:49\ UTC\ 2017.txt
Buy milk

Ctrl+R  = reverse i search through history ************************ (use R or L arrow to enter command)

--------------------------------------   sort   -----------------------------
cat math_attendance

Lecture1
Ted
Mike
Paul

Lecture2
Ted
Mike

Lecture3
Ted

sort math_attendance | uniq -c (uniq gives the unique values, -c will give count)
	2
	3 Ted
	2 Mike
	1 Paul

sort math_attendance | uniq -c | sort -nr (sorts numerically, in reverse order)
	3 Ted
	2 Mike
	2
	1 Paul
--------------------------------------   /sort   -----------------------------

tail -f /var/log/secure (creates streaming log, last 10 entries, of logins.  Login via another Putty session to watch this)

ls -lharS | tail -n 1 (outputs ls, (r)everse (S)ort by file size, then grabs last line)
ls -lhaS | head -n 2 | tail -n 1  (same output as above, sort descending, take top 2, then take the bottom 1)
ls -lhart | tail -n 1 (outputs last modified)
ls -lha | wc -l (counts number of lines in current directory.  Includes ., .., "total...")

grep -Ev "^$|lecture" match_attendance | sort | uniq (v = not, E = extended regex, '^$|lecture' is blank line or lecture)
------ grep only list directories  -----------------
$ ls -lha | grep "^d"
drwx------. 5 ec2-user ec2-user  137 Nov 15 00:55 .
drwxr-xr-x. 3 root     root       22 Nov 13 22:48 ..
drwx------. 2 ec2-user ec2-user   29 Nov 13 22:48 .ssh
drwxrwxr-x. 2 ec2-user ec2-user    6 Nov 15 00:55 test1
drwxrwxr-x. 2 ec2-user ec2-user  207 Nov 15 00:56 test2

------ grep only non directories  -----------------
$ ls -lha | grep -v "^d"
total 20K
-rw-------. 1 ec2-user ec2-user 1.7K Nov 15 01:10 .bash_history
-rw-r--r--. 1 ec2-user ec2-user   18 Mar  7  2017 .bash_logout
-rw-r--r--. 1 ec2-user ec2-user  193 Mar  7  2017 .bash_profile
-rw-r--r--. 1 ec2-user ec2-user  231 Mar  7  2017 .bashrc
-rw-------. 1 ec2-user ec2-user   47 Nov 13 23:13 .lesshst

-----------------------------------------   find  --------------------------------
find . -name "poe*" = finds all files in cwd (find by name) that have poe*
find ~/Documents -name "*d*" = go to Home folder, then Documents folder to search *d* instead of cwd
find . -name '.bashrc' 2>/dev/null   = finds files .bashrc, redirects errors (like "Permission denied") to a null file
find . -iname 'basrc'    = ignores case sensitivity


-----------------------------------------   alias  --------------------------------
alias    =  display all aliases.  ie:
alias ls='ls --color=auto'    (no whitespaces allowed)

type:
alias ls='ls -lhat --color=auto'    =  when you run "ls" it will run "ls -lhat"
\ls    = will run system default and not the alias

alias rm2='rm -i'    =  running 'rm *.txt' will ask you each time before removing *.txt file
unalias rm2   = remove alias rm2

***adding alias at shell session will delete alias when exiting session.  Add to .bashrc to have it
	added every time.  You can remove by unalias, then run 'source ~/.bashrc' to re-add it ****

--------------------------------------- .bashrc -----------------------------------
.bashrc is loaded for non-login shells
.profile is loaded for login shell
When Bash starts as a login shell (i.e. through SSH session), it runs .profile instead
Start Bash through a terminal emulator that's not a login session, it reads .bashrc

# Tip: read .bashrc from .profile (source ~/.bashrc) to make sure you always have the same configuration:
Add the following to .bash_profile (or .profile)
# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		# source
		. "$HOME/.bashrc"
	fi
fi

--------------------------------------- ENV Variables -------------------------------
To get the variable name you have to add $ ($PS1), to set the variable you don't have to add $ (PS1=)
[ec2-user@ip-111-11-11-11 ~]$ echo $PS1
[\u@\h \W]\$    =  [ + user + @ + host + Working Dir + ] + $   (also [\t] would add timestamp)
man bash  (/PS1 to search for PS1, then search for /PROMPTING)
env   = lists out all variables.
~/homebin/hiworld.sh  (is a file that prints out hello world)
./hiworld.sh will not work from ~ because homebin is not added to path
PATH="$PATH:~/homebin"    (set PATH to the current $PATH and append ~/homebin)
	*you can now run hiworld.sh from any directory

--------------------------------------- Export Variables -------------------------------
EDITOR="EMACS"   (sets editor to emacs instead of vi.)
less text.txt    (less command, type 'v' to edit, but it will use vi instead of emacs)
export EDITOR="EMACS"    **Export variables that are needed in subprocesses**

--------------------------------------- Changing Shells -------------------------------
echo $SHELL
/bin/bash    (tells us we are in bash shell)
chsh   (change shell)
New shell [/bin/bash]: /bin/dash    (changes shell to dash)
logout    (logs out.  logout and login and you are now running dash instead of bash(dash only Ubuntu))

--------------------------------------- Shell scripting ----------------------------
type test     (how to find out if command name is already in use)
test is a shell builtin

--------------------------------------- tn = Take Notes script ----------------------
#!/bin/bash (-x   is DEBUGGER if you want to add -x.  can insert 'set -x' to turn on debug, then 'set +x' to turn off)
# means this script is meant to be run by bash interpreter
# Simple note-taking script

# $1 gets value of first arguement passed in, echo prints to screen, then appends to notes.txt
#echo $1 >> ~/notes.txt

# $* takes all arguements, not just the first one
#echo $* >> ~/notes.txt
#echo $(date): $* >> ~/notes.txt
#echo added to notes.txt: $*

# get the date
date=$(date)

# get the topic
topic="$1"

# filename to write to
#filename=~/${topic}notes.txt
# or use (note ~ is escaped by " so use ${HOME}
filename="${HOME}/${topic}notes.txt"

#Ask user for input
read -p "What notes do you want to add": note

# If a note was entered by user, continue the taking note script, else give warning to user
if [[ $note ]]; then
        # quotes around filename will keep it as a single set to handle spaces i.e. "Sports Baseball"
        echo "$date: $note" >> "$filename"
        echo "Note saved: '$note' TO $filename"
else
        echo "No input; note wasn't saved"
fi


--------------------------------------- Variables use "'s and {}'s often! -------------
pi=3.14
echo $pi
3.14
# note user "$x" instead of $x to handle spaces and special chars

foo=foo2
echo ${foo}bar
foo2bar   ({} braces tell where variable begins and ends)

[[ $str ]]  = true if str is not empty
[[ $str = "something" ]]   = true if str equals "something"  *** USE Spaces!!!
[[ -e $filename ]]   = true if file $filename exists
[[ -d $dirname ]]   = true if dir $dirname exists


-------------------------------- create_script.sh = script to create script files --------

#!/bin/bash

# create_script
# This script creates a new bash script, sets permissions and more
# Author:

#Is there an arguement?
if [[ ! $1 ]]; then
        echo "Missing arguement"
        exit 1
fi

scriptname="$1"
bindir="${HOME}/bin"
echo $bindir
filename="${bindir}/${scriptname}"
echo $filename

if [[ -e $filename ]]; then
        echo "File ${filename} already exists"
        exit 1
fi

if type "$scriptname"; then
        echo "There is already a command with name ${scriptname}"
        exit 1
fi

# Check bin directory exists
if [[ ! -d $bindir ]]; then
        # if not: create bin directory
        if mkdir "$bindir"; then
                echo "created ${bindir}"
        else
                echo "Could not create ${bindir}"
                exit 1
        fi
fi

# Create a script with a single line
echo '#!/bin/bash' > "${filename}"
# Add executable permission
chmod u+x $filename
# Open with editor
if [[ $EDITOR ]]; then
        $EDITOR "$filename"
else
        echo "Script created; not starting editor because \$EDITOR is not set."
fi

echo "End of code reached"
exit 0


-------------------------------- math_test = logic and integer arithmatic expressions --------
#!/bin/bash

# Compare file count of 2 Directories
# Author

# Check number of arguments
if [[ $# -ne 2 ]]; then
        echo "Need exactly 2 arguments"
        exit 1
fi

# Secret check to exit script immediately. && is AND, || is OR
if [[ $1 = "foo" && $2 = "bar" ]]; then
        echo "You found secret exit pword"
        exit 1
fi

# Both arguments should be directories
if [[ ! -d $1 ]]; then
        echo "'$1' is not a directory"
        exit 1;
fi

if [[ ! -d $2 ]]; then
        echo "'$2' is not a directory"
        exit 1;
fi

dir1="$1"
dir2="$2"

# Get number of files in directories
count_1=$(ls -A1 "$dir1" | wc -l)
count_2=$(ls -A1 "$dir2" | wc -l)

# Which one has most files?
if [[ $count_1 -gt $count_2 ]]; then
        echo "${dir1} has most files"
elif [[ $count_2 -gt $count_1 ]]; then
        echo "${dir2} has most files"
else
        echo "number of files is equal"
fi

echo "end of code"
exit 0