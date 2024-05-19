const express = require('express');

const router = express.Router();

// Dummy data
const instructions = {
    'exercise1': 'This is the instruction for exercise 1',
    'exercise2': 'This is the instruction for exercise 2',
    // Add more exercises and instructions here
};

router.post('/fetchExerciseInstruction', (req, res) => {
    const { auth_token, description, validExercise } = req.body;

    // Check if the auth_token is valid
    // You can implement your authentication logic here

    // Check if the description is valid
    if (!description) {
        return res.status(400).json({ error: 'Invalid description' });
    }

    // Find the instruction based on the description
    var instruction = null;
    if(validExercise){
        instruction = description;
    }
    if (!instruction) {
        return res.status(404).json({ error: 'Instruction not found' });
    }

    // Return the instruction
    res.json({ instruction });
});

router.post('/fetchExerciseResponse', (req, res) => {
    const { auth_token, conversation, info } = req.body;

    // Check if the auth_token is valid
    // You can implement your authentication logic here

    // Check if the conversation and info are valid
    if (!conversation || !info) {
        return res.status(400).json({ error: 'Invalid conversation or info' });
    }

    // Process the conversation and info to generate the next response
    // You can implement your logic here

    // Return the next response
    res.json({ response: 'Next response' });
});

router.post('/submitExerciseResponse', (req, res) => {
    const { auth_token, conversation, info, response } = req.body;

    // Check if the auth_token is valid
    // You can implement your authentication logic here

    // Check if the conversation, info, and response are valid
    if (!conversation || !info || !response) {
        return res.status(400).json({ error: 'Invalid conversation, info, or response' });
    }

    // Process the conversation, info, and response to evaluate the submission
    // You can implement your logic here

    // Evaluation result
    const result = [
        {
            "Metrics": "Accuracy",
            "Score": 80,
            "Feedback": "Good job! You have answered 80% of the questions correctly."
        },
        {
            "Metrics": "Fluency",
            "Score": 70,
            "Feedback": "You need to work on your fluency."
        },
        {
            "Metrics": "Relevance",
            "Score": 90,
            "Feedback": "Your answers are relevant to the questions."
        }
    ]

    // Return the evaluation result
    res.json(result);
});

module.exports = router;