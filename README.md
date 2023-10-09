isucon-tools
=====

build
```
make build
```

alp
```
make alp file=access.log.1
```

p99でソートしたい場合
```
make alp file=access.log.1 arg="--sort p99"
```

alpdiff
```
make alp file=access.log.1 --dump dumpfile1.yaml
make alp file=access.log.2 --dump dumpfile2.yaml
make alpdiff dumpfile1.yaml dumpfile2.yaml
```

pt-query-digest
```
make pt file=mysql-slow.log
```


