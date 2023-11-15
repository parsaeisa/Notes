# Encryption

Encryption is a useful concept that applies in many software applications such as:
- URL shortener
- Key-value store

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