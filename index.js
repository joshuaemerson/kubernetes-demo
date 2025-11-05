import express from 'express'

const app = express()
const PORT = process.env.PORT || 8000;

app.get('/', (req, res) => {
    res.json({
        message: "Hello from inside the container!",
        service: "hello-node",
        pod: process.env.POD_NAME || "undefined",
        time: new Date().toISOString()
    })
})

// Used by kubernetes
app.get('/readyz', (req, res) => res.status(200).send('ready'))
app.get('/healthz', (req, res) => res.status(200).send('ok'))

app.listen(PORT, () => {
    console.log(`Test app listening on port ${PORT}`)
})