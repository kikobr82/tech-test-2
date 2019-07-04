const appTest = require('../src/routes/version')

const body = {
    'version': process.env.BUILD_VERSION,
    'description': process.env.BUILD_DESCRIPTION,
    'sha': process.env.BUILD_SHA

}

let req = {
    body: {}
}

let res = {
    send: function (myapp) {
        this.status = myapp.status
        this.body = myapp.body
    }
}

test('Checking Versio Values', () => {
    appTest(req, res)
    expect(res.body).toEqual(body)
})

test('Checking Version Status', () => {
    appTest(req, res)
    expect(res.status).toEqual(200)
})
