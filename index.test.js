const assert = require('node:assert');
const { describe, it } = require('node:test');
const { greet } = require('./index');

describe('index.js', () => {
  describe('greet()', () => {
    it('should return "Hello from Ralphy!"', () => {
      assert.strictEqual(greet(), 'Hello from Ralphy!');
    });

    it('should return a string', () => {
      assert.strictEqual(typeof greet(), 'string');
    });

    it('should be a function', () => {
      assert.strictEqual(typeof greet, 'function');
    });
  });
});
