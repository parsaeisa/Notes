# Network

`WebSocket` and `Http` are based on HTTP

## Making a VPN

- Buy a server from Racknerd website.
- Buy a DNS resolver, Arvan is good I guess.
- Don't know other steps :))

# DNS 

DNS or **D**omain **N**ame **S**erver is a map from url that we use (like "google.com" to ip address).

source : neetcode.io

## TCP vs UDP in practice

TCP has a concept called "connecion", which you see a lot, for example in gRPC.

But UDP has nothing like connection and it just works with packets. It has to save data just in packets.

## Http generations

**QUIC**: 

# Websocket 

Unlike http1, web socket supports bidrectional communication.

# TLS

TLS stands for **Transport Layer Security**.

**TLS certificate**:

**TLS key**:

# SSL

SSL stands fpr **S**ecure **S**ocket **L**ayer.

SSL uses a public key/private key approach for encrypting. Based on Computer security course in the university, the publick key is used for encrypting a message in the origin and a private key is used for decrypting the message in the destination.

## Key components

- Issuer: issuer is an entity that issue certificates. Certificate Authorities (CA) are trusted organizations that issue certificates.
- Subject
- Public key
- Private key
- Validity period: SSL certificates have a limited lifespan.
- Signature: Signature ensures certificate authority. It is generated using the private key of the issuer.  

## Certificate

Certificates include these items:
- Public key
- Owners identity
- Digital Signature
- Validity period
- The issuer

**Handshake** is the process of exchanging certificates and validating them. 

## SSH

There are two versions of SSH, SSH-1 and SSH-2. The SSH-2 has standardized **IETF**.

It has three steps:
- Transport layer: Creates a secure connection
- Authentication layer: Verifies the user
- Connection layer: Multiplexes communications into logical channels.

<img src="https://github.com/parsaeisa/Notes/blob/main/Network/image/how%20SSH%20works.gif">
