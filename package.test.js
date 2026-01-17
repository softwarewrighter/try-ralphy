const { test } = require('node:test');
const assert = require('node:assert');
const fs = require('fs');
const path = require('path');

test('package.json exists and has correct structure', async (t) => {
  const packagePath = path.join(__dirname, 'package.json');

  await t.test('package.json file exists', () => {
    assert.ok(fs.existsSync(packagePath), 'package.json should exist');
  });

  await t.test('package.json has correct name', () => {
    const pkg = JSON.parse(fs.readFileSync(packagePath, 'utf8'));
    assert.strictEqual(pkg.name, 'hello-world', 'name should be hello-world');
  });

  await t.test('package.json has required metadata', () => {
    const pkg = JSON.parse(fs.readFileSync(packagePath, 'utf8'));
    assert.ok(pkg.version, 'should have version');
    assert.ok(pkg.description, 'should have description');
    assert.ok(pkg.main, 'should have main entry point');
  });
});
