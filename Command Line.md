##RedHat, CentOS: Command Line


###Filename Globbing
List the file in the directory `-l` Give the file with information on rights, creator, size and creation date. 
And `-R` list all of the subdirectories 

    ls -l -R
    
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
