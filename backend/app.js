const express = require('express');
const cors = require('cors');

const app = express();
const port = 5050;

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
    // Handle login route logic here
    res.send('Hello World!');
});

// API routes
app.use("/api/v2/auth", require("./routes/auth"));
app.use("/api/v2/profile", require("./routes/profile"));
app.use("/api/v2/genericQuestionaire", require("./routes/genericQuestionaire"));
app.use("/api/v2/learn", require("./routes/learn"));


app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});