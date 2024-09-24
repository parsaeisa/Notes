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

