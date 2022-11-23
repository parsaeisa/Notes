1# Redis

The **Re**mote **Di**ctionary **S**erver .

Redis is a key-value store and database caching system . 

One of the advantages of key-value stores is their simple interface . 

A Redis command in one handler is estimated 1 pt, the base of estimation . 


`hset`

`zset`

`AddHook`

## Add redis to project

In project , we should define a new redis client which connects to a redis server .
In this document only golang projects are being discussed .

The goredis package is being used here : https://github.com/go-redis/redis

```go
opts := &goredis.FailoverOptions{
			OnConnect:             ... ,
			Username:              ... ,
			Password:              ... ,
			DB:                    ... ,
			MaxRetries:            ... ,
			MinRetryBackoff:       ... ,
			MaxRetryBackoff:       ... ,
			DialTimeout:           ... ,
			ReadTimeout:           ... ,
			WriteTimeout:          ... ,
			PoolSize:              ... ,
			MinIdleConns:         ... ,
			MaxConnAge:            ... ,
			PoolTimeout:           ... ,
			IdleTimeout:           ... ,
			IdleCheckFrequency:    ... ,
			// the bottom options are for redis sentinel 
			MasterName:            ... ,
			SentinelAddrs:         ... ,
            SentinelPassword:      ... ,
            SlaveOnly:             ... ,
            UseDisconnectedSlaves: ... ,
		}
		a.RedisClient = goredis.NewFailoverClient(opts)
```
as you can see you define two objects , the first one is options and the other one is client and 
that option object is passed to client .

The options are about the clients connection to the server . 

We can test our connection to the redis server using below code :
```go
ticker := time.NewTicker(config.C.Redis.DialTimeout)
defer ticker.Stop()
for time.Now(); true; <-ticker.C {
    counter++
    _, err := a.RedisClient.Ping(ctx).Result()
    if err == nil {
        break
    }

    log.WithFields(log.Fields{"address": config.C.Redis.Address, "err": err}).Error("Error in ping command to redis")
    if counter >= DialRetry {
        log.Fatal("cannot connect to redis")
    }
}
```

Now we can execute redis commands using this redis client : 
```go
err := rdb.Set(ctx, "key", "value", 0).Err()
if err != nil {
    panic(err)
}

val, err := rdb.Get(ctx, "key").Result()
if err != nil {
    panic(err)
}

val, err := rdb.Del(ctx, "key").Result()
if err != nil {
panic(err)
}
```

## Other Redis topics

* Redis sentinel : Is used to make redis highly available ,
* Redis hashmap
* Redis locker
* Resp 
* Redsync

Continue watching : 
https://www.youtube.com/watch?v=OqCK95AS-YE
https://www.youtube.com/watch?v=XCsS_NVAa1g
