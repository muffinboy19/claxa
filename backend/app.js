const express = require('express');
const cors = require('cors');

const app = express();
const port = 5050;

app.use(cors());

app.get('/', (req, res) => {
    // Handle login route logic here
    res.send('Hello World!');
});

app.use("/v2/api/auth", require("./routes/auth"));

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});