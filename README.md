# RMXConfig - the WAHFFLE server auto-configurator
#### Written by Romeo Manuel E. David

This script automates most of the process configuration including MySQL configuration and folder config.
Install:
On the terminal:
```bash
git clone https://github.com/exs-xgg/rmxconfig.git
cd rmxconfig
chmod 755 ./rmx
```

**IMPORTANT:** You should run this with sudo.
```bash
sudo ./rmx
```

You can also make this script globally available by initializing a command on the/usr/local/bin repository

```bash
cd /usr/local/bin
sudo touch ./rmx
```
Write this to ./rmx
```
cd /path/to/rmxconfig
sudo ./rmx
```
```bash
chmod 755 ./rmx
```
To run:
```bash
sudo rmx
```
## NOTE: Edit the 2017/hf.php file before generating reports, since entries are pushed outside the php markdown
