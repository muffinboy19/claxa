const express = require('express');

const router = express.Router();

// Dummy data
const completionData = {
    hook: 'Dummy Hook',
    description: 'Dummy Description'
};

// Route: /fetchOnCompletion
router.post('/fetchOnCompletion', (req, res) => {
    // Extract input data from request body
    const { authToken, lessonIndex, lessonId, topic } = req.body;

    // Perform any necessary operations with the input data
    // For now, we'll just send back the dummy data
    const completionMessage = {
        hook: completionData.hook,
        description: completionData.description
    };

    // Send the completion message as the response
    res.json(completionMessage);
});

module.exports = router;