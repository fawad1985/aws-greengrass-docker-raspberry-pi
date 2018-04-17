# Install Docker
Make sure Raspberry Pi is up and running.

### Connect with SSH
```$ ssh pi@raspberrypi.local```

### Start the Docker installer
```$ curl -sSL https://get.docker.com | sh```

# Configure Docker
There are a few manual steps needed in order to make greengrass working. We need to change the docker storage driver to 'devicemapper'. Read more about it [here](https://forums.aws.amazon.com/message.jspa?messageID=832291).

```
$ sudo systemctl enable docker
$ sudo nano /etc/docker/daemon.json
```
and paste
```
{
    "storage-driver":"devicemapper"
}
```
`ctrl-o + ctrl+x`

Now you can reboot the Pi and start the Docker daemon with:

```$ sudo systemctl start docker```

### Enable Docker client
The Docker client can only be used by root or members of the docker group.

```$ sudo usermod -aG docker pi```

After making this change, log out and reconnect with `ssh`.

`$ docker info`

```
Containers: x
 Running: x
 Paused: x
 Stopped: x
Images: x
Server Version: 18.04.0-ce
Storage Driver: devicemapper
```
Make sure storage driver is `devicemapper`.

# Docker for Greengrass
Clone the repo. You can find the link above.

### Build Greengrass image
```
$ cd aws-greengrass-docker-raspberry-pi
$ docker build -t aws-greengrass .
```

### Run AWS Greengrass container

1. Make sure you have placed the certificates in `certs/` directory.
2. Update the `config.json` in `config/`.
3. Run the container
   ```
   docker run -it -v "$PWD/certs":/greengrass/certs -v $PWD/config:/greengrass/config --privileged aws-greengrass
   ```


# Note
The `start.sh` file runs whenever you start the container. You can choose to update it, based on your need. Also, when we change the Docker storage driver you won't see the images and containers created with the old storage driver, until you change it back. [Read this](https://docs.docker.com/storage/storagedriver/)