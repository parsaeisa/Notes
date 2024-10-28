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

## Process

Node.js provides a global object called `process`.

### Some key features
You can:
- Access environment variables
- access command-line arguments passed to the Node.js process via `process.argv`
- terminate a process using `process.exit(0)`
- access informations about the current process (informations such as **pid** and **cwd**)
- check the memory usage of the process using `process.memoryUsage()`
- do some event handling but search more about it

### Config file

As mentioned before it can access environment variables, so it serves a same purpose as config files.

> Dynamic configuration: This term refers to having multiple configs, for deployment, test, staging, etc.

`process.env` lets you keep sensitive information out of your version control system.

### Common practice

Common practice is to use **dotenv**.

```bash
npm install dotenv
```

Create an .env file:
```bash
PORT=3000
DB_URI=mongodb://localhost:27017/mydb
```

Accessing information:
```javascript
require('dotenv').config(); // Load variables from .env file

const port = process.env.PORT || 5000; // Use default port if not set
const dbUri = process.env.DB_URI;

console.log(`Server running on port: ${port}`);
console.log(`Database URI: ${dbUri}`);
```