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

### Signature

Sender: Hashes the message and encrypts that hash in **asymmetric** way, then appends this encrypted hash to the end of the message before sending.

Receiver: Decrypts the signature with public key, then hashes the message. If these two hashes were equal, integrity is proved.


## Different encrypting algorithms

- SHA
- MD5

## Mod (%)

The mod operator is a usefull operator. This operator is being used on bucketing. 

Another application of Mod is this scenario:

Consider a key-value store. You want to map key's (strings) to the underlying array's indexes. 

You do some encodings on the key and calculate their sum, then using the sum mod on the array's capacity, you can map them to your array. 

See this link: https://github.com/parsaeisa/key_value_store

## Authorization / Authentication

To complete  ...