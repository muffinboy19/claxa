const express = require('express');

const router = express.Router();

// FetchUserInfoQuestionaire route
router.get('/fetchUserInfoQuestionaire', (req, res) => {
    // Get the auth token from the request
    const authToken = req.query.authToken;

    // TODO: Implement the logic to fetch user info questionaire based on the auth token
    // Replace the following code with your actual implementation
    const questionaire = [
        {
            InfoQuestionType: 'Short answer',
            Question: 'Name',
            Icon: 'user'
        },
        {
            InfoQuestionType: 'DropDown',
            Question: 'Profession',
            Options: ['Option 1', 'Option 2', 'Option 3'],
            Icon: 'briefcase'
        },
        {
            InfoQuestionType: 'Short answer',
            Question: 'Age',
            Icon: 'calendar'
        },
        {
            InfoQuestionType: 'DropDown',
            Question: 'Profession',
            Options: ['Option 1', 'Option 2', 'Option 3'],
            Icon: 'briefcase'
        },
        {
            InfoQuestionType: 'Short answer',
            Question: 'Years of experience',
            Icon: 'clock'
        },
        {
            InfoQuestionType: 'Short answer',
            Question: 'Age',
            Icon: 'calendar'
        }
    ];

    res.json(questionaire);
});

// SubmitUserInfoQuestionaire route
router.post('/submitUserInfoQuestionaire', (req, res) => {
    // Get the auth token and answers from the request body
    const { authToken, answers } = req.body;

    // TODO: Implement the logic to submit user info questionaire and return the result
    // Replace the following code with your actual implementation
    const result = {
        onSuccess: true,
        domains: [
            {
                domain: 'Domain 1',
                description: 'Domain 1 description'
            },
            {
                domain: 'Domain 2',
                description: 'Domain 2 description'
            },
            {
                domain: 'Domain 3',
                description: 'Domain 3 description'
            },
            {
                domain: 'Domain 4',
                description: 'Domain 4 description'
            },
            {
                domain: 'Domain 5',
                description: 'Domain 5 description'
            },
            {
                domain: 'Domain 6',
                description: 'Domain 6 description'
            },
            {
                domain: 'Domain 7',
                description: 'Domain 7 description'
            },
            {
                domain: 'Domain 8',
                description: 'Domain 8 description'
            },
            {
                domain: 'Domain 9',
                description: 'Domain 9 description'
            },
            {
                domain: 'Domain 10',
                description: 'Domain 10 description'
            }
        ]
    };

    res.json(result);
});

module.exports = router;