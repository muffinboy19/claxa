const express = require('express');

const router = express.Router();

// FetchProfile route
router.post('/fetchProfile', (req, res) => {
    // Get the auth token from the request
    const authToken = req.body.authToken;

    // TODO: Implement logic to fetch profile metadata using the auth token

    // Example response
    const profileMetadata = {
        name: 'John Doe',
        username: 'johndoe',
        progress: 75,
        score: 100
    };

    res.json(profileMetadata);
});

// SaveProfile route
router.post('/saveProfile', (req, res) => {
    // Get the auth token and updated profile metadata from the request body
    let { authToken, updatedProfileMetadata } = req.body;

    // TODO: Implement logic to save the updated profile metadata using the auth token

    // Example response
    const response = {
        success: true
    };

    res.json(response);
});

module.exports = router;