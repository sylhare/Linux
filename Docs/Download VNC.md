## Download VNC

Get it at:

- https://www.realvnc.com/en/connect/download/viewer/raspberrypi/

Or install it using:

```bash
gzip -d VNC-6.1.1-Linux-ARM-DEB.tar.gz
tar -xvf VNC-6.1.1-Linux-ARM-DEB.tar
sudo dpkg -i VNC-Server-6.1.1-Linux-ARM.deb
sudo systemctl start vncserver
sudo systemctl start vncserver-x11-serviced
```

in a file in root fro chrome:

```bash
/usr/lib/chromium-browser/chromium-browser --disable-quic --enable-fast-unload --enable-tcp-fast-open --enable-pinch --ppapi-flash-path=/usr/lib/chromium-browser/libpepflashplayer.so --ppapi-flash-args=enable_stagevideo_auto=0 --start-fullscreen 
```


If proxy you can use:

```
--proxy-server=http://proxy:80 --proxy-bypass-list=localhost,example.com
```