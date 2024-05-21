const express = require('express');

const router = express.Router();

// Login route
router.post('/login', (req, res) => {
    let { validLogin } = req.body;

    if (validLogin) {
        // Generate a dummy auth token
        const authToken = 'dummyAuthToken';

        // Return the auth token
        res.json({ authToken });
    } else {
        // Return login error
        res.status(401).json({ error: 'Invalid login credentials' });
    }
});

// Signup route
router.post('/signup', (req, res) => {
    let { validLogin } = req.body;

    if (validLogin) {
        // Generate a dummy auth token
        const authToken = 'dummyAuthToken';

        // Return the auth token
        res.json({ "authToken": authToken });
    } else {
        // Return signup error
        res.status(400).json({ error: 'Invalid signup data' });
    }
});

module.exports = router;