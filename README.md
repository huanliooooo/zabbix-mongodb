# Technology

1. Python3, python3-pip, pymongo
2. Zabbix Agent (+ zabbix_sender)
3. Mongodb

# Installation

1. Import the mongodb template to zabbix and link it to the zabbix mongodb host.
2. Clone project:

```
git clone https://github.com/huanliooooo/zabbix-mongodb.git
```

2. Config HostName and Server in /bin/zabbix.conf
3. Test script:

```
./bin/mongodb-stats.sh $SERVER $HOST_NAME
```

4. Cronjob every 30 seconds

```
./bin/cronjob.sh
```

Note:

The following metrics are collected on mongodb version 3.0 by using python mongodb client, and then sent by zabbix sender.

**Server Stats**

- mongodb.ismaster
- mongodb.version
- mongodb.storageEngine
- mongodb.uptime
- mongodb.okstatus
- mongodb.asserts.msg
- mongodb.asserts.rollovers
- mongodb.asserts.regular
- mongodb.asserts.warning
- mongodb.asserts.user
- mongodb.backgroundFlushing.flushes
- mongodb.backgroundFlushing.total_ms
- mongodb.operation.getmore
- mongodb.operation.insert
- mongodb.operation.update
- mongodb.operation.command
- mongodb.operation.query
- mongodb.operation.delete
- mongodb.memory.resident
- mongodb.memory.virtual
- mongodb.memory.mapped
- mongodb.memory.mappedWithJournal
- mongodb.connection.current
- mongodb.connection.available
- mongodb.connection.totalCreated
- mongodb.network.numRequests
- mongodb.network.bytesOut
- mongodb.network.bytesIn
- mongodb.heap.size
- mongodb.page.faults
- mongodb.globalLock.totalTime
- mongodb.globalLock.currentQueue.total
- mongodb.globalLock.currentQueue.writers
- mongodb.globalLock.currentQueue.readers
- mongodb.globalLock.activeClients.total
- mongodb.globalLock.activeClients.writers
- mongodb.globalLock.activeClients.readers

**DB Stats**

- mongodb.stats.storageSize[db]
- mongodb.stats.ok[db]
- mongodb.stats.avgObjSize[db]
- mongodb.stats.indexes[db]
- mongodb.stats.objects[db]
- mongodb.stats.collections[db]
- mongodb.stats.fileSize[db]
- mongodb.stats.numExtents[db]
- mongodb.stats.dataSize[db]
- mongodb.stats.indexSize[db]
- mongodb.stats.nsSizeMB[db]

# License

[MIT](/LICENSE.md)
