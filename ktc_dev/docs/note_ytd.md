#!/bin/bash
cd /ppwps/tasks

/opt/java/java21/bin/java -Dlog4j.configurationFile=/ppwps/tasks/ppwps-alipayreconcile-log4j.xml -Dspring.config.location=/ppwps/tasks/ -Ddb.config.file=/ppwps/dbconfig/db.properties -Dkey.crypto.path=/ppwps/dbconfig/ -Dspring.config.name=task -cp /ppwps/lib/log4j-api.jar:/ppwps/lib/log4j-core.jar:/ppwps/tasks/ppwps-alipayreconcile.jar  org.springframework.boot.loader.launch.JarLauncher $1 $2 $3 $4 $5 $6

# just for see
/ktcalipay/monitor/MonitorNotify.jar    lib/log4j-core-2.3.jar  Main    157     /ktcalipay/monitor/mon2.start.sh(0),/ktcalipay/monitor/monstart2.sh(0),/ktcalipay/monitor/monstart1.sh(0),/ktcalipay/monitor/mon1.start.sh(0),


# remembers
# /ktcalipay/lib/log4j-api.jar

cp -v -p  /opt/java/java8/bin/java /opt/java/java8/bin/notifymon1
/ktcalipay/monitor/mon2.start.sh
/ktcalipay/monitor/monstart2.sh
/ktcalipay/monitor/mon1.start.sh
/ktcalipay/recvqrtransvc/restart-recvqrtranssvc.sh
/ktcalipay/recvqrtransvc/start-recvqrtranssvc.sh
/ktcalipay/miniappservice/start-miniappservice.sh

