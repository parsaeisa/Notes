# Redis

The **Re**mote **Di**ctionary **S**erver .

Redis is a key-value store and database caching system . 

One of the advantages of key-value stores is their simple interface . 

A Redis command in one handler is estimated 1 pt, the base of estimation . 


`hset`

`zset`

`AddHook`

Search this word : "Redis datatypes"

But redis has more application rather than cahing system which you can see in the image below : 

<img src="https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/images/redis_applications.jpeg" width="500" height="700">

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

## Redis-cli
To run redis-cli type `redis-cli` in terminal. 

One of the advantages of key-value stores is their simple interace. So you can see other commands very easily.

## Pipe 

When sent a request to redis server, we are waiting for an acknowledgement too. This TTL can take us time. When we have multiple requests that are somehow like transactions ( requests must be done together ) we can put them in a pipe. Pipe accumulates those request and sends them all together. 

This can lower the wastes of time.

## Redis hook

Hook is something that executes by some triggers like : connection, command and pipeline.
example ( in go-redis v9) :
```go
import "github.com/redis/go-redis/v9"

type redisHook struct{}

var _ redis.Hook = redisHook{}

func (redisHook) DialHook(hook redis.DialHook) redis.DialHook {
	return func(ctx context.Context, network, addr string) (net.Conn, error) {
		fmt.Printf("dialing %s %s\n", network, addr)
		conn, err := hook(ctx, network, addr)
		fmt.Printf("finished dialing %s %s\n", network, addr)
		return conn, err
	}
}

func (redisHook) ProcessHook(hook redis.ProcessHook) redis.ProcessHook {
	return func(ctx context.Context, cmd redis.Cmder) error {
		fmt.Printf("starting processing: <%s>\n", cmd)
		err := hook(ctx, cmd)
		fmt.Printf("finished processing: <%s>\n", cmd)
		return err
	}
}

func (redisHook) ProcessPipelineHook(hook redis.ProcessPipelineHook) redis.ProcessPipelineHook {
	return func(ctx context.Context, cmds []redis.Cmder) error {
		fmt.Printf("pipeline starting processing: %v\n", cmds)
		err := hook(ctx, cmds)
		fmt.Printf("pipeline finished processing: %v\n", cmds)
		return err
	}
}
```

## Redis sorted set
Is a sorted non-repeating groups of strings. To each member in the set a score is assigned. Multiple members can share a same score.

### Creating
In redis-cli zadd is the command used to create a sortedset. 

When we add a new member we should assign it a score.

```bash
# zadd <the key that contains sorted set> <score> <member>
zadd firstss 2 "Parsa"
```

We can add multiple members in one line :
```bash
# zadd <the key that contains sorted set> [<score> <member>][n]
zadd faveGuitarists 4 "Stephen Malkmus" 2 "Rosetta Tharpe" 3 "Bola Sete" 3 "Doug Martsch" 8 "Elizabeth Cotten" 12 "Nancy Wilson"
```

### Retrieve data

#### zrange
`zrange` command is used to show members with rank in a specific range.
```bash 
# zrange <key containing sorted set> <starting rank> <ending rank>
zrange faveGuitarists 0 3
```

ranks can be negative too. -1 is for the last member ( with worst rank), -2 is for second last member and so on.

With `WITHSCORES` we can show scores : 
```bash
zrange faveGuitarists 5 6 WITHSCORES
```

reference : https://www.digitalocean.com/community/cheatsheets/how-to-manage-sorted-sets-in-redis

#### ZCOUNT

The `zcount` command returns elements that their scores are in a specific range. 

Command:
```
ZCOUNT [sorted set name] [min] [max]
```

The **min** and **max** are representatives of the range that we are seaching in.

We can use `-inf` for min and `+inf` for max.

### Concepts 
The data structure used to create a sorted set is "Skiplist".
You can see the description about Skiplist in [here](https://github.com/parsaeisa/Notes/tree/main/Software%20engineering/Database#skiplist).


## Set

Redis has an array the ensures each element is unique in that array. That array with unique element (each member comes only one time), is called **Set** in redis.

We can use it to remove duplicate records while storing them.

### An example: 
A broker can deliver a message more than one time, but storing other redelivered messages can harm the application's logic.

## Other Redis topics

* Redis sentinel : Is used to make redis highly available

Try to cluster some redises with redis-sentinel .

* Redis hashmap
* Redis locker
* Resp 
* Redsync
* Redis datatypes
* SETNX
* `ZRemRangeByScore` method in golang
* `Expire` method in golang on a pipeline

Continue watching : 
https://www.youtube.com/watch?v=OqCK95AS-YE
https://www.youtube.com/watch?v=XCsS_NVAa1g

## Geo-spatial features

Redis doesn't have any dedicated feature for geo-spatial objects.

For storing geo-spatioal objects it uses sorted-set. 

`GEOADD` Geo add command is used for storing points. 

```
GEOADD cities -122.34 47.61 Seattle
```
If operation performed successfully it returns 1. 

As you can see this is so much like `ZADD` command for sorted sets. Hence, other sorted sets commands can be used : 
```
127.0.0.1:6379> ZRANGE cities 0 -1 WITHSCORES
1) "Seattle"
2) "1558507288382415"
```

with mentioned command you can query newly added items.

I think it's score (as you remember we had scores in sorted sets) is computed using the built-in geohash function.

For inspecting the GEOHASH for a point you can use the command below : 
```
127.0.0.1:6379> GEOHASH cities Seattle
1) "c23nb54sr70"
```

With `GEOPOS` command we can get coordiantes of a point : 
```
127.0.0.1:6379> GEOPOS cities Seattle
1) 1) "-122.33999758958816528"
   2) "47.61000085169597185"
```

For getting points in certain radius from point "A" you can use this command : 
```
GEOSEARCH [a set] FROMMEMBER [ A member ] BYRADIUS [radius] km WITHCOORD WITHDIST WITHHASH
```

The WITHCOORD, WITHDIST and WITHHASH are flags that show information for each founded point. 

We can also query points with a certain distance to a new points (wit coordinates) :
```
GEOSEARCH cities FROMLONLAT [lat] [lng] BYRADIUS [radius] km WITHCOORD WITHDIST WITHHASH
```

In two mentioned queries, we used circles, but redis has features for more sophisticated searchs.