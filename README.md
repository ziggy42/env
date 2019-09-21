# env
Minimal viable development environment in a container.

I use [podman](https://podman.io/) but Docker should also be fine, so you could just swap the `podman` command with `docker`.

```bash
podman build . --build-arg ACCESS_KEY_ID='<redacted>' --build-arg SECRET_ACCESS_KEY='<redacted>' -t env
podman run --rm -ti -p --name env env
```

## Visual Studio Code integration
Unfortunately the [Visual Studio Code Remote - Containers extension](https://code.visualstudio.com/docs/remote/containers#targetText=The%20Visual%20Studio%20Code%20Remote,Studio%20Code's%20full%20feature%20set.) [does not support podman at this time](https://github.com/microsoft/vscode-remote-release/issues/116), so I'm SSHing into the container instead.


```bash
podman build . --build-arg ACCESS_KEY_ID='<redacted>' --build-arg SECRET_ACCESS_KEY='<redacted>' -t env
podman build -f code.Dockerfile -t codeenv
podman run --rm -ti -p 2222:22  --name codeenv codeenv # password is 'root'
```

You will then be able to SSH into the container as described [here](https://code.visualstudio.com/blogs/2019/07/25/remote-ssh) and with the command:
```bash
ssh -p 2222 root@localhost
```
