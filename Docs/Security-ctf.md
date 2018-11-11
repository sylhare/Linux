# Security - CTF

## CTF

CTF means "capture the flag", it is a group of hacking challenge in order to get a string (usually random) called a flag. 

## OS Security

### Kali Linux

[Kali Linux](https://www.kali.org/downloads/) is a Debian-derived Linux distribution designed for digital forensics and penetration testing. It has various preinstalled penetration-testing programs.

It is a good choice for security testing.

## Connexion

Here is a bit reminder to use simple connexion tools such as `ssh` or `cURL`.

Making a ssh connection:

```bash
# The -p to precise the port
ssh -p <portnumber> <username>@<url>
```

Making a cURL to website with a cookie and a specified http method:

```bash
curl -v -X <HTTP METHOD> --cookie "<cookie_name>=<cookie_value>" <url>
```


## Web Security

This regroup all of the CTF challenges that are linked to web pages or front-end / back-end exchange and injection.

### Basic

There are some ways to check website vulnerabilities in order to patch them:

1. Check the source code with the developper tools
2. Check if there are some not protected root files `http://site.com/not/protected/file.txt`
3. Check `/robots.txt` for not indexed files
4. Check in `Application` then `cookies` any option that can be changed (in Chrome's dev tool)
5. Check the source code of the executed javascript and/or php.
6. Check the `.htaccess` file at `targetedsite.com\.htaccess` that describe what are the authorized http actions (`GET`, `PUT`, `POST`, `VIEW`). Sometime one is forbidden but not the others.
7. Use a [dns lookup](https://mxtoolbox.com/) website or tool to get the website's owner information. (Try the txt scan, port scan and other scan type)

### Web server Injection

Use injection in form filed with `;` (semi colon) or ``` ` ``` (back ticks) or `$` (dollar sign) to inject bash commands.

Check your regex when you want to look for something.

```bash
# The "." will look for everything
grep . /place/to/look/
```

Don’t forget relative import with `/` at the beginning

### Obfuscation

Obfuscation is a way to render client side code unreadable so it is harder to get what it is doing. So exploiting it gets harder.

- [jsnice](http://jsnice.org/) to "nicify" and de-Obfuscate javascript

### SQL Injection

SQL injection is to check for illegal characters that can be used on client side to get not authorized access to data. 

A simple not secured authentification query could look like:

```sql
sql = 'SELECT * FROM Users WHERE Name ="' + uName + '" AND Pass ="' + uPass + '"'
```

- `1=1` means match on everything so print everything in the table
- `#` make everything as a comment for MySQL.
- `‘` will allow to include something inside of a string, it will close the string so you can add something else.
- `;` will properly close the query and not read what is after

#### Sample usage with 1=1

Injection with  ’ or ‘1’=‘1 for an example query:

```sql
Select ? Where username=“admin” and password=“password”
```

which can be injected into:

```sql
Select ? Where username=“admin” and password=“’ or ‘1’=‘1”
```

Or for example ignoring the password field and replacing with a true operation `1=1`
```sql
SELECT * FROM users WHERE username='john' AND password='123456'
```

will become with `john' OR 1=1; --`:
```sql
SELECT * FROM users WHERE username='john' OR 1=1; -- ' AND password='123456' 
```


## Jail Escaping

This is the kinf of challenge were you are log as a user or in a software and you attempt to get out of that profile in order to get root access and thus get the flag.

### Shell escaping

#### Vim escaping

There is a well-known restricted shell escape with vim text editor. To perform first escape one required to run vim and execute following vim commands:

```bash
:set shell=/bin/bash
:shell
```

#### rVim escaping

You can use python in rVim but not shell
To list all installed features it is possible to use this vim command:

```vim
:version
```

If python is available, you can use shell command using this python line

```vim
:python3 import os; os.system(‘shell command’)
```

## Sources

- [Kali Linux](https://docs.kali.org/)
- [Security focused OS](https://en.wikipedia.org/wiki/Security-focused_operating_system)