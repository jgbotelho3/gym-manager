const { Pool } = require('pg')

module.exports = new Pool({
  user: 'set_username',
  password: 'set_password',
  host: 'localhost',
  port: 5432,
  database: 'database_name'
})