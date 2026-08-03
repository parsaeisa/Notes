# DNS

DNS is like a phonebook which has beautiful web addresses as names and the ip address of their servers as phonenumbers. 

## Namecheap

Namecheap is a domain registry and web service provider. 

Url: https://www.namecheap.com/

For playing around with it, It has a sandbox version too: https://ap.www.sandbox.namecheap.com/

You can add recrods with it manually or you can enable it's **API access** to automate DNS stuff in the code. 

For API access, it has a document which lists all methods and their manual: https://www.namecheap.com/support/api/intro/

It has methods for checking available domains, getting domain lists, Setting new hosts, etc.

For adding a TXT record:

```bash
curl --location 'https://{{baseUrl}}/xml.response?ApiUser={{apiUser}}&UserName={{username}}&ApiKey={{apiKey}}&ClientIp={{clientIP}}&Command=namecheap.domains.dns.setHosts&SLD=testdomain1&TLD=com&HostName1=@&RecordType1=TXT&Address1=arbitraryText&TTL1=86400
```

Where:
- SLD: Second level domain
- TLD: Top level domain
- RecordType: The type of the record which in this case is "TXT"
- AddressX: The metadata which we want to give
- TTLX: The time to live for record in seconds ( 86400s --> one day).