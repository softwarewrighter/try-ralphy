const { greet } = require('./index');
const { formatDate } = require('./utils');

function main() {
  console.log(greet());
  console.log(formatDate());
}

main();

module.exports = { main };
