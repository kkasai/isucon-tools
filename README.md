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

nginx conf
```
        log_format ltsv "time:$time_local"
                        "\thost:$remote_addr"
                        "\tforwardedfor:$http_x_forwarded_for"
                        "\treq:$request"
                        "\tstatus:$status"
                        "\tmethod:$request_method"
                        "\turi:$request_uri"
                        "\tsize:$body_bytes_sent"
                        "\treferer:$http_referer"
                        "\tua:$http_user_agent"
                        "\treqtime:$request_time"
                        "\tcache:$upstream_http_x_cache"
                        "\truntime:$upstream_http_x_runtime"
                        "\tapptime:$upstream_response_time"
                        "\tvhost:$host";
 
        access_log /var/log/nginx/access.log ltsv;
```

mysql slow query
```
slow_query_log          = 1
slow_query_log_file     = /var/log/mysql/mysql-slow.log
long_query_time = 0
log-queries-not-using-indexes
```
