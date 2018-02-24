# Github Backup

There are some alternatives to make a full back up of all of your github remote repositories. 
First I came across a nice [script](https://gist.github.com/rodw/3073987) that would do it for me.

But there are some other ruby alternatives available on github:

- [benbalter/github-records-archiver](https://github.com/ddollar/github-backup)
- [ddollar/github-backup](https://github.com/benbalter/github-records-archiver)
- [zauberlabs/backup-github](https://github.com/zauberlabs/backup-github)

Until I came across a nice article about the subject:

- [Addyosmani - How To Backup All Of Your GitHub Repositories In One Go](https://addyosmani.com/blog/backing-up-a-github-account/)

ddollar - github back up be like:

```
gem install github-backup
```

Then:

```
github-backup addyosmani /storage/backups
```