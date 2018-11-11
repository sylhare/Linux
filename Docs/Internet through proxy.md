# Internet through proxy
------------------------

Because that is one of the most annoying thing ever.

## Setting up the proxy

nano .bash_profile

```
export http_proxy="http://PROXY_SERVER:PORT"
export https_proxy="https://PROXY_SERVER:PORT"
export HTTP_PROXY="http://PROXY_SERVER:PORT"
export HTTPS__PROXY="http://PROXY_SERVER:PORT"
NO_PROXY="localhost,127.0.0.1"

```

Reload the file:
```
source .bash_profile
```

To see if there are any proxy set up:
```
env | grep -i proxy
```

## Proxy setting function

If you use a proxy server often, you can create Bash functions as follows (add to your `~/.bashrc` file) try `nano ~/.bashrc` to edit the file then add:

```
# Set Proxy
function setproxy() {
    export {http,https}_proxy="http://PROXY_SERVER:PORT"
    export {HTTP,HTTPS}_PROXY="http://PROXY_SERVER:PORT"
    env | grep -i proxy
}

# Unset Proxy
function unsetproxy() {
    unset {http,https}_proxy
    unset {HTTP,HTTPS}_PROXY
    echo no proxy
}
```
Reload your `~/.bashrc` file:
```
source ~/.bashrc
```

You can test the function by trying `setproxy` and `unsetproxy`.

## Source

I found this tip on [Shell Hacks](https://www.shellhacks.com/linux-proxy-server-settings-set-proxy-command-line/) via [superuser.com](https://superuser.com/questions/196166/linux-command-line-to-turn-off-proxy). ;)


