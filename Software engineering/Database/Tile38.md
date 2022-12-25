# Tile38

The github repository : https://github.com/tidwall/tile38

Object types :
* lat/lon
* bbox
* Geohash
* GeoJSON
* QuadKey
* XYZ tile.

protocols : 
* http ( curl )
* RESP
* Websockets
* Telnet

Server responses : RESP & json

Anoter feature of Tile38 is its leader/follower replication . 

tile38 is exposed on port 9581 :
```bash
docker run -p 9851:9851 tile38/tile38
```