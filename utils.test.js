const assert = require('node:assert');
const { describe, it } = require('node:test');
const { formatDate } = require('./utils');

describe('utils.js', () => {
  describe('formatDate()', () => {
    it('should return a string', () => {
      assert.strictEqual(typeof formatDate(), 'string');
    });

    it('should return date in YYYY-MM-DD format', () => {
      const result = formatDate();
      assert.match(result, /^\d{4}-\d{2}-\d{2}$/);
    });

    it('should return the current date', () => {
      const result = formatDate();
      const now = new Date();
      const expected = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;
      assert.strictEqual(result, expected);
    });

    it('should pad single digit months with zero', () => {
      const result = formatDate();
      const parts = result.split('-');
      assert.strictEqual(parts[1].length, 2);
    });

    it('should pad single digit days with zero', () => {
      const result = formatDate();
      const parts = result.split('-');
      assert.strictEqual(parts[2].length, 2);
    });
  });
});
