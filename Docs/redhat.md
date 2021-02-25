^ = anchor at the beginning
$ = anchor at the end
. = wild card
[aou] = any of a, o, u
* = matches 0 or more occurences
+ = matches 1 or more occurences
? = matches 0 or 1 occurences


^cat start with cat
ion$ finishes with ion
c.t will return anything that matches (cat, cut)
c.. will return anything with three letters starting with c (cat, cut)
c.* anything starting with c
c.+ will return anything after the c
c.{2} will take two letters after the c


egrep is grep but without escaping regex characters

grep = global regular expression pattern
It comes from the old linux console ed: g/^student/p 

grep -i will make it case isensitive
grep -v will inverse the matches and give all the line that does not contain it
grep -rn (r is recursive, n tells to print the line number)

grep -e ^root -e ^student (root or student)


vim /etc/passwd +/^root will bring you to the line that matches the regular expression in the file

Copy paste in vim
y: yank or copy
p: paste after the cursor
P: before the cursor

v (+shift or control) go to visual mode to select multiple lines
shift v to go in visual block, shift i to go in insert mode, add some text then escape and the test will be print at the beginning of each lines

vimtutor to learn vim, set LAMG=fr_CA.utf8 vimtutor to change the language to french

at is a tool to do a task in the future, like cron but not recursive.
at time
> command
[ctrl] + d


> Implementation detail that goes against people's expectation


kernel.org to download the linux kernel to install and compile it

The . at the end for of the file/directory means if ACL(access control lists) is on/off

hjkl to move left down up right

w b after before space
( ) before, after period
{ } before after paragraphs
/ to search in vim, n N to move in the matches


When downloading new doc, to display all selinux-policy-devel
you can refresh the man using mandb
then man -k selinux



Terminal tips

Double tab after a couple words gives you all of the command with it
ctrl + C    stop a program
ctrl + Z    put a program in the background (like &)
ctrl + D    quit (like a ssh connexion)
ctrl + L    clear the terminal
ctrl + A    put the cursor at the beginning of the line
ctrl + E    put the cursor at the end of the line
ctrl + U    erase everything from the beginning to the cursor
ctrl + K    erase everything from the cursor to the end of the line
ctrl + W    remove word by word the command
ctrl + Y    undo ctrl + W


ctrl + P or up  Go up in the previous instructions
ctrl + N or down Go down in the previous instructions

:w !sudo tee %


redo the command above but as sudo:
sudo !!

!! redo the last command
$$ give the PID of the last command
$? give the code exciting the last command

p?d -> prints an error
/usr/bin/p?d -> interprets it as pwd 

globbing and file pattern matching expansion

echo hello | tee test.txt  # tee will print the out put and redirect it to a file also
!echo . do the last bash command (bash history expansion)

bash debugguer - bashdb