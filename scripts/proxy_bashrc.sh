# Set Proxy
function setproxy() {
    export {http,https}_proxy="http://proxy:8080"
    export {HTTP,HTTPS}_PROXY="http://proxy:8080"
    env | grep -i proxy
}

# Unset Proxy
function unsetproxy() {
    unset {http,https}_proxy
    unset {HTTP,HTTPS}_PROXY
    echo no proxy
}
