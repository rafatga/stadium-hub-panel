# ✨ Stadium Hub Panel

- [Environment](##environment)
- [Installation](##installation)
- [Starting Project](##Starting)


## Environments
- http://panel.stadium-hub.loc (traefik proxy local)
- http://panel.stadium-hub.loc:3001 (local)

## Installation
### System requirements
- Docker

### Local docker installation:
- (Step 1) -> Clone project
```
git clone -b develop https://github.com/rafatga/stadium-hub-panel
```
- (Step 2) -> host config
```
[mac] -> /etc/hosts
[ubuntu] -> /etc/hosts
[windows] -> C:\Windows\system32\drivers\etc\hosts

127.0.0.1       panel.stadium-hub.loc
```
- (Step 3) -> Build docker image
```
make bootup
```

## Starting Project
### [1] Start project
```
make start
```
### [2] Stop project
```
make stop
```

## TODO
- Add CI/CD with GitHub Actions
- Config WebStorm node interpreter