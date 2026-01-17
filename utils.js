/**
 * Formats the current date as YYYY-MM-DD
 * @returns {string} The current date in YYYY-MM-DD format
 */
function formatDate() {
  const now = new Date();
  const year = now.getFullYear();
  const month = String(now.getMonth() + 1).padStart(2, '0');
  const day = String(now.getDate()).padStart(2, '0');
  return `${year}-${month}-${day}`;
}

module.exports = { formatDate };
