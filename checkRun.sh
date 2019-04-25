#!/bin/bash
i=1
 
while(true)
do
COUNT=$(ps -ef |grep chainx |grep -v "grep" |wc -l)
#echo $COUNT
if [ $COUNT -eq 0 ]; then
        echo NOT RUN
	i++
	echo $i >> restart
	nohup ./chainx --key=$CHAINX_PRIVATE_KEY  --validator-name=$CHAINX_NODE_NAME --name=$CHAINX_NODE_NAME --base-path=./  --validator --chain=local --pruning archive --block-construction-execution=NativeElseWasm --other-execution=NativeElseWasm --syncing-execution=NativeElseWasm >> log&
#else
#        echo is RUN
fi
sleep 0.5
done
#nohup ./chainx --key=$CHAINX_PRIVATE_KEY  --validator-name=$CHAINX_NODE_NAME --name=$CHAINX_NODE_NAME --base-path=./  --validator --chain=local --pruning archive --block-construction-execution=NativeElseWasm --other-execution=NativeElseWasm --syncing-execution=NativeElseWasm >> log& 
