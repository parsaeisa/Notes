# Api-paradigms

## Rest API

The most popular one, Requests are stateless, A request has nothing to do with it's next request.

Each request has a response code ( which you know what are they ).

Also the artifact that is being exchanged is `json` which is a **Human readable** plain text.

## Graph ql 

In rest, you send a request per each resource that you want. But in graphql you can get more than one resource in one request. Like a query.

In my opinion is similar to **Redis pipe**. 

## gRPC

It converts the raw data to binary data, Which is more :
- Secure ( I think because it's not human readable)
- Storage efficient
