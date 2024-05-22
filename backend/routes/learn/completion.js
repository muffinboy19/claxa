const express = require('express');

const router = express.Router();

// Dummy data
const completionData = {
    hook: 'Are you sure, you are not a PRO?',
    description: 'Great job!'
};

// Route: /fetchOnCompletion
router.post('/fetchOnCompletion', (req, res) => {
    // Extract input data from request body
    let { authToken, lessonIndex, lessonId, topic } = req.body;

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