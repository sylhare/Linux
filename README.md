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
If there's a Xserver (ex: Ubuntu) :
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

#### Openshift

[OpenShift v3](https://docs.openshift.com/enterprise/3.0/architecture/index.html) is a layered system designed to expose underlying Docker and Kubernetes concepts as accurately as possible, with a focus on easy composition of applications by a developer. 
For example, install Ruby, push code, and add MySQL. Free ebook [here](https://www.openshift.com/promotions/for-developers.html )

Docker provides the abstraction for packaging and creating Linux-based, lightweight containers. Kubernetes provides the cluster management and orchestrates Docker containers on multiple hosts.

OpenShift adds:

- Source code management, builds, and deployments for developers
- Managing and promoting images at scale as they flow through your system
- Application management at scale
- Team and user tracking for organizing a large developer organization


OpenShift has a microservices-based architecture of smaller, decoupled units that work together. It can run on top of (or alongside) a Kubernetes cluster, with data about the objects stored in etcd, a reliable clustered key-value store. Those services are broken down by function:

- REST APIs, which expose each of the core objects.
- Controllers, which read those APIs, apply changes to other objects, and report status or write back to the object.

Openshift Documentation:

- [Containers list from Red Hat](https://access.redhat.com/containers/)
- [How:to Create an S2I Builder Image blog](https://blog.openshift.com/create-s2i-builder-image/)
- [Kompose](https://developers.redhat.com/blog/2017/08/02/getting-started-with-kompose/) is a tool that converts a Docker Compose file to Kubernetes or OpenShift artifacts.


### Sources

- [50 most frequently used Unix / Linux commands with examples](http://www.thegeekstuff.com/2010/11/50-linux-commands/)- [Shell Hacks](https://www.shellhacks.com/)