# Node js

Creating a project:
```bash
npm init
```
You can use `-y` flag to skip configuring the `package.json` file.

Running a project: 
```bash
node <file name>.js
```

In `package.json` file we have a `scripts` flag. We can put this `node index.js` in that like this:
```bash
"scripts": {
  "start": "node index.js"
}
```
Then simply run:
```bash
npm start
```

Importing a built-in or custom package:
```javascript
const fs = require('fs');
```

Although javascript has an event loop and is running on one thread, the Node.js has some worker threads which can do something in background but their communication is limited. 

## Components

Here a list of components:
- Controller: Sits between http requests and Service. 
- Service: Service has the business logic of the application. 
- Mapper: Mapper is responsible to map database object to understandable objects for the program. 
- Prisma: Its the ORM. 
- Helpers: Like it's name, it is a directory with helper methods, reduces duplicates and improves code organization. 

The order is like this: 
```bash
Controllers -> Services --> Mapper
                        \-> Prisma
```
Helper directory is a seperated direcotry. 

Both mapper and prisma are beneath Service (Prisma is not under mapper). An example of usages:
```javascript
const dbUser = { id: 1, first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com' };
const apiUser = userMapper(dbUser);
```

## Commands

In this section, useful commands for generating project files are listed. 

### Prisma 

You can create migratoins using:
```bash
npx prisma migrate dev --name <migration_name>
```

### ESLint
```bash
npx eslint --init
```

### Jest (testing)
```bash
npx jest --init
```

### Prettier
```bash
echo {} > .prettierrc
```
Creates a `.prettierrc` file for code formatting configuration.

### Express application
For creating required files for an express application:
```bash
npx express-generator
```