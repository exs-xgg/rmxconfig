# RMXConfig - the WAHFFLE server auto-configurator
#### Written by Romeo Manuel E. David

This script automates most of the process configuration including MySQL configuration and folder config.

Install:

On the terminal:
```shell
git clone https://github.com/exs-xgg/rmxconfig.git
cd rmxconfig
chmod 755 ./rmx
```

**IMPORTANT:** You should run this with sudo.
```shell
sudo ./rmx
```

You can also make this script globally available by initializing a command on the/usr/local/bin repository

```shell
cd /usr/local/bin
sudo touch ./rmx
```
Write this to ./rmx
```shell
cd /path/to/rmxconfig
sudo ./rmx
```

Change permission
```shell
chmod 750 ./rmx
```
To run:
```shell
sudo rmx
```
NOTE: Edit the 2017/hf.php file before generating reports, since entries are pushed outside the php markdown
