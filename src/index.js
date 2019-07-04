const express = require('express')
const routerVersion = require('./routes/version')

const app = express()

app.get('/version', routerVersion)


app.listen(3000, () => {
    process.stdout.write('Server running on port 3000')
})
