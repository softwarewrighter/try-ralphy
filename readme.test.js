const { describe, it } = require('node:test');
const assert = require('node:assert');
const fs = require('fs');
const path = require('path');

describe('README.md', () => {
  const readmePath = path.join(__dirname, 'README.md');
  const readmeContent = fs.readFileSync(readmePath, 'utf8');

  it('should exist', () => {
    assert.ok(fs.existsSync(readmePath), 'README.md should exist');
  });

  it('should have a title', () => {
    assert.ok(readmeContent.includes('# hello-world'), 'README should have project title');
  });

  it('should have installation instructions', () => {
    assert.ok(readmeContent.includes('## Installation'), 'README should have Installation section');
    assert.ok(readmeContent.includes('npm install'), 'README should mention npm install');
  });

  it('should have usage instructions', () => {
    assert.ok(readmeContent.includes('## Usage'), 'README should have Usage section');
    assert.ok(readmeContent.includes('npm start'), 'README should mention npm start');
  });

  it('should document the API', () => {
    assert.ok(readmeContent.includes('## API'), 'README should have API section');
    assert.ok(readmeContent.includes('greet()'), 'README should document greet function');
    assert.ok(readmeContent.includes('formatDate()'), 'README should document formatDate function');
  });

  it('should list available scripts', () => {
    assert.ok(readmeContent.includes('## Scripts'), 'README should have Scripts section');
    assert.ok(readmeContent.includes('npm test'), 'README should mention npm test');
    assert.ok(readmeContent.includes('npm run lint'), 'README should mention npm run lint');
  });

  it('should include license information', () => {
    assert.ok(readmeContent.includes('## License'), 'README should have License section');
    assert.ok(readmeContent.includes('MIT'), 'README should mention MIT license');
  });
});
