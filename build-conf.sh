for port in `seq 6001 6006`; do \
  mkdir -p ./conf \
  && PORT=${port} envsubst < ./redis.tmpl > ./conf/redis-${port}.conf \
  && mkdir -p ./data/${port}; \
done

