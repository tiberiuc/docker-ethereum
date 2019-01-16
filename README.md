
# docker-ethereum

A Docker configuration with sane defaults for running a fully-validating
Ethereum node, based on [Alpine Linux](https://alpinelinux.org/).

Full support for regtest and [backup-agent](https://github.com/tiberiuc/docker-backup_agent)

## Quick start

Requires that [Docker be installed](https://docs.docker.com/engine/installation/) on the host machine.

```
# Create some directory where your ethereum data will be stored.
$ mkdir /home/youruser/ethereum_data

$ docker run --name ethereum -d \
   --volume /home/youruser/ethereum_data:/root/.ethereum \
   --publish 8545:8545 \
   --publish 8546:8546 \
   --publish 30303:30303 \
   --publish 9191:9191 \
   tiberiuc/ethereum

$ docker logs -f ethereum
[ ... ]
```


## Configuration

configuration is done through command line arguments
```
docker run --name ethereum tiberiuc/ethereum --rpc --rpcaddr "0.0.0.0" --wsaddr "0.0.0.0" --rpcapi "db,admin,miner,eth,net,web3,debug,personal,shh,txpool" --ws --shh --ipcdisable --wsapi "db,admin,miner,debug,eth,net,web3,personal,shh,txpool" --wsorigins="*" --rpccorsdomain="*"
```

## Daemonizing

Currently geth is run inside supervisor

## Backup and restore

Backup
```
curl http://localhost:9191/backup -o ethereum.tgz
```

Restore
```
curl http://localhost:9191/restore --data-binary @./ethereum.tgz
```
