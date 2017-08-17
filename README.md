# Linux

Here is a quick reminder of Linux commands line.
There's the online doc too.

- [General commands](https://github.com/Sylhare/Linux/blob/master/General%20commands.md)
- [Shell Editors](https://github.com/Sylhare/Linux/blob/master/Shell%20Editors.md)
- [System configuration commands](https://github.com/Sylhare/Linux/blob/master/System%20configuration%20commands.md)

That's basically a reminder for me, if it helps someone else then cool.

### RedHat

Install [RedHat developper](https://developers.redhat.com/blog/2016/03/31/no-cost-rhel-developer-subscription-now-available/) offers no-cost licences to get and try RedHat Entreprise Linux.

For that you will need to:

- Register at [RedHat Developer Program](https://developers.redhat.com/)
- Download the [RedHat Entreprise Linux for Development](https://developers.redhat.com/products/rhel/download/)
- Install it (server, [virtual box](https://www.virtualbox.org/), vmware)
- Register it on the [redhat customer portal](https://access.redhat.com/labs/registrationassistant/#/) (`cat /etc/redhat-release` to check the version)
- Then run the Red Hat Subscription Management Portal service:
```
subscription-manager register --username <username> --password <password>
```

#### Tips

- Map the keyboard in french:
```
loadkeys fr 
```
If there's a Xserver:
```
setxkbmap fr
```

- Load the graphical UI
```
startx
```
Or if you need to install it
```
yum groupinstall "X Window System" Desktop
```

### Sources

- [50 most frequently used Unix / Linux commands with examples](http://www.thegeekstuff.com/2010/11/50-linux-commands/)