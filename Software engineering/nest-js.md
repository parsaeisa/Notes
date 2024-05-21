# Nest js

## Components

**Controllers** are handlers. Use them instead of handlers. 

### Services 

I think that services sit between business logic and controllers. This can make handling both logic and controllers more easily. 

For connecting to Mongo, all the queries are in the service and in the controller you just call one of the services' post. 

## Packages

- For connecting to mongo: **Mongoose** package
```bash
npm i @nestjs/mongoose mongoose
```
## Decorators

- `@Injectable`: This makes a class injectable to other classes