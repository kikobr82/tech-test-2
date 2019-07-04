
const getVersion = (req, res) => {
    try {
        const myapp = {
            'version': process.env.BUILD_VERSION,
            'description': process.env.BUILD_DESCRIPTION,
            'sha': process.env.BUILD_SHA
        }

        res.send({
            status: 200,
            body: myapp
        })
    }
    catch (err) {
        res.send({
            status: 500,
            error: err
        })
    }
}

module.exports = getVersion 

