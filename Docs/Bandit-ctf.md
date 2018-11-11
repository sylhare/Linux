# Bandit CTF

Bandits is a CTF game on [overthewire](http://overthewire.org/wargames/bandit/) that involves system admin and bash skills.

So here are some of the command I used to get the exercices done.

If a file is not available you can show it from the above folder:

```
# When the file starts with a ‘-‘
cat ./-

# To show all files
cat ./*
```

Find all file with information recursively

```
ls -lR
```

If there are space in the file, you can get it directly or use `\`

To filter file by size

```
find . -size 1033c -type f | xargs cat
```

Look for the file by side 33bytes and put the error (tag as 2 in the exit stream ) into /dev/null which is a linux trash

```
find / -size 33c -type f 2>/dev/null | xargs ls -la | grep bandit6
```

Find the word millionth in the file data.txt

```
grep 'millionth' data.txt
```

Uniq is used to find the number of unique strings in a file:

```
cat data.txt | sort | uniq -c | grep '1 '
cat data.txt | sort | uniq -u
``` 

- the `-c` is used for count
- the `-u` is used to show only the unique ones. Uniq needs to be used with sort.


Strings will take the human readable txt from data.txt from an ascii range and egrep use regex to find a character (here starting with =)

```
strings data.txt | egrep ^=*
```

To decode base64 using the `-d`
```
base64 -d data.txt
```

The tool `tr` will replace the letter by another one. Here is an example for Rotation 13 where each letter is 13 letters in advance (a -> n)

```bash
Echo hello world | tr hello baby
>>> Babyworld
cat data.txt  | tr '[a-zA-Z]' '[n-za-mN-ZA-M]'
```

For uncompress, you can use file to get the compression format

```bash
xxd -r data.txt > > /tmp/file.txt
File /tmp/file.txt
>>> /tmp/file.txt: gzip compressed data, was "data2.bin"

xxd -r data.txt | gunzip | bunzip2 | gunzip | tar xfO - | tar xfO - | bunzip2 | tar xvfO - | gunzip
data8.bin
```

Awk string template engine, by default cut a sentence using the spaces. so `"this is a sentence"` will become `['this', 'is', 'a', 'sentence']`

Here awk on element 1 of the previous command.
```
awk ‘{print $1}’
```

Replace `:` by nothing using `sed`
```
sed ’s/://‘
```

Use `xargs` to take the result of the command into the next in a piped command.

```
find . -type f | xargs file
```
