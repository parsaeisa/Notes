# Security

## JWT

jwt is a framework. All jwt have **same structure** but **different content** (encryption alogirhtms).

A JWT looks like this (3 parts, dot-separated):

```
xxxxx.yyyyy.zzzzz
```
### Structure 

#### 1. Header (Base64URL-encoded JSON)

```json
{
  "alg": "HS256",
  "typ": "JWT",
  "kid": "12345"   // optional
}
```

#### 2. Payload (Base64URL-encoded JSON)

```json
{
  "sub": "user123",
  "name": "Parsa",
  "iat": 1712345678,
  "exp": 1712355678
}
```

#### 3. Signature
Created by signing the first two parts using the secret or private key.

Final token =

```
base64url(header) + "." + base64url(payload) + "." + base64url(signature)
```


## Mindset

We have a mturity level of software engineers in context of secure softwqare engineering:

- Denial: I don't have to think about it.
- Irrational fear: No, we can't do anything, in today's world everything is possible. Full of negativity.
- Bag of tricks: We have implemented 10 tricks. Is it enough? Are we close?
- Mature: A meture software engineer has a **reasoned, balanced and defensive** mindset.

We have two concepts about use cases which are:
- Misuse: Intentionally
- Abuse

**Both** can do harm.

## OWASP
 
One of the first names which come to mind in context of security is OWASP. 

I think it provides a report every year about more dangerous vulnerabilities.