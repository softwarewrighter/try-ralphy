# hello-world

A simple demo project to showcase Ralphy's autonomous AI coding capabilities.

## Installation

```bash
npm install
```

## Usage

Run the main application:

```bash
npm start
```

This will output:
```
Hello from Ralphy!
2024-01-15
```

## API

### index.js

#### `greet()`

Returns a greeting message.

```javascript
const { greet } = require('./index');
console.log(greet()); // "Hello from Ralphy!"
```

### utils.js

#### `formatDate()`

Returns the current date formatted as `YYYY-MM-DD`.

```javascript
const { formatDate } = require('./utils');
console.log(formatDate()); // "2024-01-15"
```

## Scripts

- `npm start` - Run the main application
- `npm test` - Run the test suite
- `npm run lint` - Run ESLint

## License

MIT
