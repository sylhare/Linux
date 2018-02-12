# Linux Foundation

The [Linux Foundation](http://www.linuxfoundation.org/) is a large open source non profit organisation that promotes and foster collaborative development.

## ONAP

[ONAP](https://www.onap.org/) (Open Network Automation Platform) is an open source software platform that delivers capabilities for the design, creation, orchestration, monitoring, and life cycle management of
 
- Virtual Network Functions (VNFs)
- The carrier-scale Software Defined Networks (SDNs) that contain them
- Higher-level services that combine the above

### Contributing to Onap

#### Getting access to the source code

Onap is composed of a big [list of projects](https://gerrit.onap.org/r/#/admin/projects/) on which you can contribute to.

To have a preview of the projects you can check the mirrored repositories on [Github/onap](https://github.com/onap). As mirror you can't really contribute to them that way.

To contribute using you need to:

- Go on the onap's gerrit: [gerrit.onap.org](https://gerrit.onap.org/r/#/admin/projects/)
- Create a linux foundation account (in `Account signup / management`)
-  Then you need to sign in (it's a tiny `sign in` link under the `search button`).
-  Configure a rsa public key on your side:
```
ssh-keygen -t rsa
```
- Add your public key in `settings/SSH Public Keys`
- test your ssh tunnel with :
```
ssh -p 29418 <sshusername>@gerrit.<project>.org
```
- On your project page, you should be able to clone the project using ssh.

#### Commit to the project

Each project has a JIRA project associated to it at [jira.onap.org](https://jira.onap.org). It is a good way to find things to do on a project.

To contribute and actually commit code you would need:

- Acquire the commit hook:
```
curl -Lo ./.git/hooks/commit-msg https://gerrit.onap.org/r/tools/hooks/commit-msg
chmod +x ./.git/hooks/commit-msg
```
- Add the files to your commit message
```
git add .
```
- Sign off the commit and add the issue ID to the footer (it's case sensitive)
```
fixing stuff

Change-Id: I706ec04d541925be8f04c44254379523f2085eca
Issue-ID: POLICY-389
Signed-off-by: Bob <bob@research.att.com>
```
- Push your code to refs for master:
```
git push origin HEAD:refs/for/master
```
- It will go through a process of being reviewed, accepted. To make any change to your commit, use:
```
git commit --amend
```

## Sources

- [Gerrit's Guide](http://lf-releng-docs.readthedocs.io/en/latest/gerrit.html) 
- [Configuring Gerrit](https://wiki.onap.org/display/DW/Configuring+Gerrit) 
- [Commit message example](https://gerrit.onap.org/r/#/c/31483/1//COMMIT_MSG)