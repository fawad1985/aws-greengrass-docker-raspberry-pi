# Install Docker
Make sure Raspberry Pi is up and running.

### Connect with SSH
```$ ssh pi@raspberrypi.local```

### Start the Docker installer
```$ curl -sSL https://get.docker.com | sh```

# Configure Docker
There are a few manual steps needed in order to make greengrass working. We need to change the docker storage driver to 'devicemapper'. Read more about it [here](https://forums.aws.amazon.com/message.jspa?messageID=832291)
```$ sudo systemctl enable docker
$ sudo nano /etc/docker/daemon.json```
and paste
```
{
    "storage-driver":"devicemapper"
}
```
`ctrl-o + ctrl+x`

Now you can now reboot the Pi, or start the Docker daemon with:

```$ sudo systemctl start docker```

### Enable Docker client
The Docker client can only be used by root or members of the docker group.
```$ sudo usermod -aG docker pi```

After making this change, log out and reconnect with `ssh`.