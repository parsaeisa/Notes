# Encryption

Everywhere you hear about security the main topic is **encryption**.

Encryption is a useful concept that applies in many software applications such as:
- URL shortener
- Key-value store
- Authorization & Authentication

One classification of encryptions are:
- Symmetric (only one key is used for encrypting and decrypting)
- Asymmetric (Pulic and private key)

## Different encrypting algorithms
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

### Certificate

Certifiacte is a signature to a public key. I think it is used in TLS.

## Symmetric

Examples: AES

When AES encrypts a data it gives:
- **DEK:** It stands for "Data encryption key".
- **IV:** It stands for Initial value. 

## Paseto

Paseto is designed to address the shortcomings of JWT tokens. It can create either a symmetric or asymmetric token.

Each token is consisted of four parts:
- Version
- Purpose
- Payload
- Footer


## Mathematics operations

Some mathematical operations play a key role in encryption.

## Mod (%)

The mod operator is a usefull operator. This operator is being used on bucketing. 

Another application of Mod is this scenario:

Consider a key-value store. You want to map key's (strings) to the underlying array's indexes. 

You do some encodings on the key and calculate their sum, then using the sum mod on the array's capacity, you can map them to your array. 

See this link: https://github.com/parsaeisa/key_value_store

## XOR

XOR is used a lot in encryption because of the three features which it has:
* It cause bit fusions which makes a pattern harder to detect.
* It is reversible, if `A xor B = C`, then we have: `C xor B = A`.
* It is a single CPU operation which makes it fase and a good choice for lightweight encryption.

## Authorization / Authentication

To complete  ...