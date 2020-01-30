In order to get docker to work with WSL.

* Enable 'Expose daemon on tcp://localhost:2375 without TLS'
* Reboot
* Run the `./scripts/wsl-install-docker.sh`
* Edit `/etc/wsl.conf`
* Ensure that `export DOCKER_HOST=tcp://localhost:2375` is set, currently it's in the exports script

/etc/wsl.conf
```
[automount]
root = /
options = "metadata"
```