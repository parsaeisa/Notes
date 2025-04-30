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
						 \-> Repositories
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

You may see a class with input arguments defined in it's constructor. But you cannot find that constructor being explicitly
called anywhere. This is because container manager in Node.js. When you try to inject a class for using it with the code below:
```javascript
const emailService = container.resolve(emailService);
// emailService is the class
```
The container manager instantiates or retrieves it and gives it the dependencies it needs.

Container typically refers to an IoC (Inversion of Control) container provided by a dependency injection (DI) library, such as "InversifyJS", "tsyringe" or others.

It has some methods like resolve, rebind and dispose. Don't forget to search about them.

Classes should have the decorator @Injectable so they can be registered in container. 

### AppDatasource ( Interacting with database )

For Interacting with database in Node.js, typeorm is used. It handles database schema changes and is used for managing migrations. By managing I mean:
- Creating
- Running
- Reverting

Put these lines in your package.json (in "scripts" tag):
```
"migration:generate": "./node_modules/.bin/ts-node ./node_modules/.bin/typeorm migration:generate -d ./src/datasource.ts ./migrations/$npm_config_name",
"migration:run": "./node_modules/.bin/ts-node ./node_modules/.bin/typeorm migration:run -d ./src/datasource.ts",
"migration:revert": "./node_modules/.bin/ts-node ./node_modules/.bin/typeorm migration:revert -d ./src/datasource.ts",
```

That `datasource.ts` is discussed further in this document.

For creating migrations, Run this command:
```
npm run migration:generate --name=myMigration
```

Then a new file is created. It has two methods, up and down. For adding a new query, you should add it in up method and add it's reverse query ( A query which deletes everything that is created or vice-versa ) in down method.
```javascript
public async up /*...*/ {
	await queryRunner.query(
            `your query`
        );
}

public async down /*...*/ {
	await queryRunner.query(
            `Your reverse query`
        );
}
```

Then apply this migration to your database using this:
```
npm run migration:run
```

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

#### For starting a transaction

```javascript
const queryRunner = AppDataSource.createQueryRunner();
await queryRunner.connect();
await queryRunner.startTransaction();
try {
	// Queries using queryRunner.manager

	await queryRunner.commitTransaction();
	return true;
} catch (failure) {
	await queryRunner.rollbackTransaction();
	if (failure instanceof Failure) return failure;
} finally {
	await queryRunner.release();
}
```

### Logging

A package which I saw is being used is **"winston"**.

### Other files

There are some other files which of course have some usages:
- jest.config.js
- jest.setup.js

Once, in the jest.setup.js file I added this:
```javascript
process.env.PGHOST = '127.0.0.1';  // PostgreSQL
```

And it solved a problem where postgres was looking for IPv6 addresses.

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



## Validation

This section is concerned with validation incoming requests from user. 

There is a general form of validation which is preventing injections. Injections such as SQL, Command and XSS.
For preventing injection this code is used:
```javascript
const { body, param, validationResult } = require('express-validator');

app.post('/user', [
  body('email').isEmail(),
  body('password').isLength({ min: 8 })
], (req, res) => {
	// You can move these lines to a middleware. 
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  res.send('User created');
});
```

But a specific kind of validation is related to app's business logic. One thing in this kind of validation is checking schemas. This is an schema object definition in Node.js which can be added to a checking middleware in Node.js:
```javascript
const firstValidation: Schema = {
	email: {
		notEmpty: {
			errorMessage: requiredField,
		},
		trim: true,
		isEmail: true,
		escape: true,
	},
	passwordConfirmation: {
		notEmpty: { errorMessage: requiredField },
		trim: true,
		isLength: { options: { min: 10 }, errorMessage: "This field must contain at least 10 characters" },
		escape: true,
		custom: {
			options: (password, { req }) => password === req.body.password,
			errorMessage: "Password confirmation must be equal to password",
		},
	},
	dateOfBirth: {
		notEmpty: {
			errorMessage: requiredField,
		},
		isDate: true,
	},
}
```

In the controller, You may read the request directly with `req.body`. But it's not safe. For making it safe, In one of our middlewares, after defining validation schemas, We can use:

```javascript
res.locals.validated = matchedData(req);
```

And it's better to wrap it in a error checking if clause:
```javascript
const errors = validationResult(req);
if (errors.isEmpty()) {
	res.locals.validated = matchedData(req);
	return next();
}
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
