# System Configuration commands (RedHat CentOS)
-----------------------------------------------

##Network configurtions commands

Show the network information

	ifconfig

to return just the IP of the wifi 

	ifconfig wlan0 | grep "inet" | grep -v "inet6" | tr -s " " ":" | cut -f4 -d ":"

- `grep "inet`"  that includes *inet* 
- `grep -v "inet6"` that excludes the IPv6 address
- `tr -s " " ":"` is added with `tr` that means translate and `-s` squeeze to replace any `" "` (space) into `":"` finally we have 
- `cut -f4 -d ":"` that cuts the first for field with `-d `(delimiter) is `":"`

