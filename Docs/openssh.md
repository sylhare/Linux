## Configuring and controlling Open SSH Service

Symetric encryption
    - one key
Asymetric encryption
    - two keys (matched set)
       - private key 
       - public key 
 
 private key encrypted - all public key can decrypt it: Authentication
 public key encrypted - only private key can decrypt it: Privacy
 
 With GPG implements PGP where the message is encrypted with the recipient public key and signed using the sender private key so you can have privacy and authentication.
 Only one person can read it, and know where it comes from.
 
 To make a ssh connection:
 ```
 ssh <user>@<remotehost> -p <port>
 ```
 
 When you connect for the first time to a host, it will print its finger print and you can add it to your `~/.ssh/known_hosts`
 To check what happen for ssh connection, you can see at `/etc/ssh`
 
 When ssh into a server the command executed is the bash shell so while it is running you stay connected. You can quit by using `ctrl + d` or by typing `exit`.
 
 To add yourself to a host as an authorized remote user `ssh-copy-id root@desktopY`
 There is a daemon called `ssh-agent` that makes a copy of the private key to facilitate the ssh connexion. 
 
 Creating a new ssh key with `ssh-keygen` you need to enter a passphrase if you went your ssh key to be encrypted.
 
 
 You can get this message if for example someone is messing with the DNS or the IP of the site you want to access has changed.
 You can remove the host from your `known_hosts` and try connecting. 
 
 ```
 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@       WARNING: POSSIBLE DNS SPOOFING DETECTED!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
The RSA host key for github.com has changed,
and the key for the corresponding IP address 143.183.13.13
is unknown. This could either mean that
DNS SPOOFING is happening or the IP address for the host
and its host key have changed at the same time.
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the RSA key sent by the remote host is
SHA256:0p4WBFiBh1+oS2y0OkLZvNd1fyYw37N31iXRxOlGHPg.
Please contact your system administrator.
Add correct host key in /Users/user/.ssh/known_hosts to get rid of this message.
Offending RSA key in /Users/user/.ssh/known_hosts:10
RSA host key for <remote host> has changed and you have requested strict checking.
Host key verification failed.
```