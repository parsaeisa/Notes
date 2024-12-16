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

Then simply run:
```bash
npm start
```

Importing a built-in or custom package:
```javascript
const fs = require('fs');
```

Although javascript has an event loop and is running on one thread, the Node.js has some worker threads which can do something in background but their communication is limited. 

## Files

#### `package.json`

In this file you can define many things like commands that can be executed in the root directory of project.

These commands consist:
- Running the application
- Running tests ( unit, integration, single, ...)
- Code forammting related (Lint, Prettier)
- Docs ( like swagger )
- Migrations ( Creating migrations for every new entities )

- What happen for each command. In the `"scripts"` part:
```bash
{
  "scripts": {
      "dev": "docker compose ...",
      "test": "docker compose ...",
  }
}
```
  In this section, We can put this `node index.js` in that like this:
```bash
"scripts": {
  "start": "node index.js"
}
```


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
constapiUser = userMapper(dbUser);
```

### Process

Node.js provides a global object called `process`.

#### Some key features
You can:
- Access environment variables
- access command-line arguments passed to the Node.js process via `process.argv`
- terminate a process using `process.exit(0)`
- access informations about the current process (informations such as **pid** and **cwd**)
- check the memory usage of the process using `process.memoryUsage()`
- do some event handling but search more about it

#### Config file

As mentioned before it can access environment variables, so it serves a same purpose as config files.

> Dynamic configuration: This term refers to having multiple configs, for deployment, test, staging, etc.

`process.env` lets you keep sensitive information out of your version control system.

### AppDatasource

AppDatasource is a thing which you use it to get connected to database. It is from **typeorm** library. 

use:
```javascript
import { DataSource } from "typeorm";

export const AppDataSource = new DataSource({
	type: "postgres",
	host: process.env.HOST,
	username: process.env.USER,
	password: process.env.PASSWORD,
	database: process.env.DB,
	port: Number(process.env.PORT),
	ssl: process.env.IS_ON_LOCAL_MACHINE === "true" ? false : { rejectUnauthorized: false },
	synchronize: false,
	logging: ["query", "error"], // it can be false
	entities: [/* Array of entities */],
	subscribers: [],
	migrations: ["./migrations/*.ts"],
});
```

As you can see configurations for getting connected to database is here. 

**Also**, `typeorm` has some important commands which you can see in the commands section of this document. 

### Cache

Node.js has a caching feature. You can add it to your project using the code below:
```javascript
import NodeCache from "node-cache";
const seconds = 10;

const cache = new NodeCache({ stdTTL: seconds });
// There is of course other configurations

cache.flushAll();

export default cache;
```

`cache.flushAll()` should be called when you are starting up your application.

You can use it with:
```javascript
cache.set(key, value);
cache.get(key);
```

It has other features such as `.keys` too. Search if you needed.

### Container 

Container typically refers to an IoC (Inversion of Control) container provided by a dependency injection (DI) library, such as "InversifyJS", "tsyringe" or others.

It has some methods like resolve, rebind and dispose. Don't forget to search about them.

Classes should have the decorator @Injectable so they can be registered in container. 

## Common practice

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

## Commands

In this section, useful commands for generating project files are listed. 

### npx
It is a tool that comes with Node.js and allows you to execute binaries (CLI tools) from 
`node_modules` or directly fetch and run a package without globally installing it

It comes before other node.js related CLIs. 

It:
- doesn't need globally installing a CLI that you want to use
- uses the last version of a CLI. 

### typeorm

It handles database schema changes and is used for managing migrations. By managing I mean:
- Creating
- Running
- Reverting

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
