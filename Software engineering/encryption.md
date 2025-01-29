# Encryption

Encryption is a useful concept that applies in many software applications such as:
- URL shortener
- Key-value store
- Authorization & Authentication

## Applied cryptography
- Encryption
- Hashing
- MAC
- Signature
- TLS

### Hashing

Hashing is almost always used for comparing two values without revealing them. If:
```
Hash(a) = Hash(b)
```
We can say:
```
a=b
```

We can check this equality without sending a and b value over the internet. This checking insures **integrity**.

I think revealing a value from it's hash is impossible.

### Hash functions

A good hash function must have these properties:
- Collision free
- Preimage resistance
- Second preimage resistance

* Collision is when two values have same hashes.

NIST lists seven approved hash algorithms: SHA-1, SHA-224, SHA-256, SHA-384 SHA
512, SHA-512/224 and SHA-512/256

I've heard MD5, MD4 and MDA5 too.

### Signature

Sender: Hashes the message and encrypts that hash in **asymmetric** way, then appends this encrypted hash to the end of the message before sending.

Receiver: Decrypts the signature with public key, then hashes the message. If these two hashes were equal, integrity is proved.

## Mod (%)

The mod operator is a usefull operator. This operator is being used on bucketing. 

Another application of Mod is this scenario:

Consider a key-value store. You want to map key's (strings) to the underlying array's indexes. 

You do some encodings on the key and calculate their sum, then using the sum mod on the array's capacity, you can map them to your array. 

See this link: https://github.com/parsaeisa/key_value_store

## Authorization / Authentication

To complete  ...