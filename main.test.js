const assert = require('node:assert');
const { describe, it, mock } = require('node:test');

describe('main.js', () => {
  describe('main()', () => {
    it('should export main as a function', () => {
      const { main } = require('./main');
      assert.strictEqual(typeof main, 'function');
    });

    it('should call console.log twice when executed', () => {
      const originalLog = console.log;
      const logs = [];
      console.log = (msg) => logs.push(msg);

      // Clear the require cache to get fresh execution
      delete require.cache[require.resolve('./main')];
      require('./main');

      console.log = originalLog;

      assert.strictEqual(logs.length, 2);
    });

    it('should print greeting message first', () => {
      const originalLog = console.log;
      const logs = [];
      console.log = (msg) => logs.push(msg);

      delete require.cache[require.resolve('./main')];
      require('./main');

      console.log = originalLog;

      assert.strictEqual(logs[0], 'Hello from Ralphy!');
    });

    it('should print date in YYYY-MM-DD format second', () => {
      const originalLog = console.log;
      const logs = [];
      console.log = (msg) => logs.push(msg);

      delete require.cache[require.resolve('./main')];
      require('./main');

      console.log = originalLog;

      // Check that second log matches YYYY-MM-DD format
      assert.match(logs[1], /^\d{4}-\d{2}-\d{2}$/);
    });
  });
});
