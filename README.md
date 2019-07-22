# Flume<br/>
Flume On top alpine 3.5 and Openjdk 1.8 + Sink Spark in polling mode<br/>
# Start Flume by mounting config file and Sink Spark jar<br/>
```
 docker run --name relayer -p 6666:6666  --volume $HOME/Flume/netcattospark.conf:/data/config/flume.conf --volume $HOME/Flume/thirdparty/:/data/thirdparty -e FLUME_CONF_DIR=/data/config/ -e OPTIONS="-Dflume.root.logger=INFO,console -C /data/thirdparty/spark-streaming-flume-sink.jar" --detach foodytechnologies/flume-openjdk8-alpine
 ```
<br/>
"relayer" container is launched and is listening on 6666 port for netcat service. "flume.conf" indicated that netcat flow will be bufferised in Sink Spark.<br/>
Later (at any moment) we can launch a spark job to poll bufferised messages from Flume agent on the port 4545
