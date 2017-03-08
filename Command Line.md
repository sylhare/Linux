##RedHat, CentOS: Command Line


###Listing filename
List the file in the directory `-l` Give the file with information on rights, creator, size and creation date

    ls -l 
    
list all the subdirectories

    ls -R

List the file in the directory that contain the word"

    ls *word*

list files that contains word1 or word2,

    ls [word1,word2]*

can work for just a caracter

    ls *word[12]*

look for file containing 2013, 2014, 2015

    ls *{2013..2015}

Look for a file beginning with a letter between H to C, the second letter can be between A to Z, the third letter would be a number from 0 to 9, the last three character can be anything

    ls [HC][A-Z][0-9]???

###Input - output
store in a file the results of the command

    ls -R > file.txt

add the result of the command to file.txt without erasing it
    
    ls >> file.txt

grep look for the "word" of the input file.txt

    grep -1 "word" < file.txt

Sort the element of the left side (default) from the input file.txt

    sort < file.txt

save the results with file.txt as an input in filesorted.txt as an output

    sort < file.txt > filesorted.txt 

allow to print on the command the ocntent of a file

    cat file.txt

###Terminal
clear the command screen

    clear 
