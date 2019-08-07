## Configuring and controlling Open SSH Service

### Symetric vs Asymetric encryption

Symetric encryption:
  - one key
    
Asymetric encryption:
  - two keys (matched set)
    - private key 
    - public key 
 
 private key encrypted 
   - all public key can decrypt it: Authentication
 public key encrypted 
   - only private key can decrypt it: Privacy
 
 ### What about GPG
 
With GPG implements PGP where the message is encrypted with the recipient public key and signed using the sender private key so you can have privacy and authentication.

Only one person can read it, and know where it comes from.

### What about SSH

#### Creating a SSH key

Creating a new ssh key with `ssh-keygen` you need to enter a passphrase if you went your ssh key to be encrypted:

```
ssh-keygen -t rsa
```

#### Make a SSH connection

To make a ssh connection:
```bash
ssh <user>@<remotehost> -p <port>
```
 
When you connect for the first time to a host, it will print its finger print and you can add it to your `~/.ssh/known_hosts`
To check what happen for ssh connection, you can see at `/etc/ssh`
 
When ssh into a server the command executed is the bash shell so while it is running you stay connected. You can quit by using `ctrl + d` or by typing `exit`.

#### Add a SSH key to a remote host
 
##### With ssh-copy-id
To add yourself to a host as an authorized remote user `ssh-copy-id root@desktopY`
There is a daemon called `ssh-agent` that makes a copy of the private key to facilitate the ssh connexion. 

##### Using authorized_keys

You can also go to the remote server and add the public key `my_key.pub` inside the `/home/user/.ssh/authorized_keys` folder.
So that the next time you connect to that server you won't be prompt for the password for that `user`. Using:

```bash
ssh -i my_key.pem user@server
```

The `my _key.pem` and `my_key.pub` are a matching public and private key pair.

### SSH spoofing 

You can get this message if for example someone is messing with the DNS or the IP of the site you want to access has changed.

```bash
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@       WARNING: POSSIBLE DNS SPOOFING DETECTED!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
The RSA host key for github.com has changed,
and the key for the corresponding IP address 145.185.15.15
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
SHA256:0p4WBUiBh1+oS2y0OkLBvNd3fyYw37N31iDRxOlGHPg.
Please contact your system administrator.
Add correct host key in /Users/user/.ssh/known_hosts to get rid of this message.
Offending RSA key in /Users/user/.ssh/known_hosts:10
RSA host key for <remote host> has changed and you have requested strict checking.
Host key verification failed.
```

You can remove the host from your `known_hosts` and try connecting. You will be prompted with `unkwon_host` and you'll need to add the new `fingerprint` to your `known_hosts`. 

However if you've seen that message above, you should think twice before doing that.
