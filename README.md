# coreos-nano

### Installation

Download https://github.com/broberson/coreos-nano/raw/master/nano.tgz and extract to your root directory:

```
cd /home/core
wget https://github.com/broberson/coreos-nano/raw/master/nano.tgz
cd /
sudo tar zxvf /home/core/nano.tgz
sudo mkdir -p /opt/share/misc
sudo touch /opt/share/misc/magic
```

This will place `nano` in your path at `/opt/bin`. Supplementary files for nano are placed in `/opt/etc` and `/opt/share`, where this binary has been configured to expect them.

You should also add the following to the top of your ~/.bashrc file

```
export MAGIC=/opt/share/misc/magic
```

If binaries worry you, execute `run.sh` to build your own copy. If you want to run this on your CoreOS installation directly, change "\$(pwd)/:/media/root" to "/:/media/root" in `run.sh` and delete the `nano.tgz` file it leaves in your root directory. Your `/opt` tree will already contain the necessary files for nano.
