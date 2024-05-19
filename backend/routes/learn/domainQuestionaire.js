const express = require('express');
const lesson = require('../../utils/constants')

const router = express.Router();

// FetchDomainQuestionaire route
router.get('/fetchDomainQuestionaire', (req, res) => {
    // Get auth token from request
    const authToken = req.headers.authorization;

    // TODO: Implement logic to fetch domain questionaire based on auth token
    // Replace the dummy data with your actual implementation
    const domainQuestionaire = [
        { QuestionType: 'MCQ', QuestionDescription: 'What is your greatest strength?', Options: ['Option 1', 'Option 2', 'Option 3', 'Option 4']},
        { QuestionType: 'Short Answer', QuestionDescription: 'Describe a time when you faced a difficult situation at work and how you handled it.' },
        { QuestionType: 'DropDown', QuestionDescription: 'What is your preferred programming language?', Options: ['Java', 'Python', 'JavaScript', 'C++'] },
    ];

    // Send the domain questionaire as response
    res.json(domainQuestionaire);
});

// SubmitDomainQuestionaire route
router.post('/submitDomainQuestionaire', (req, res) => {
    // Get auth token from request
    const authToken = req.headers.authorization;

    // TODO: Implement logic to submit domain questionaire based on auth token
    // Replace the dummy data with your actual implementation

    // Send the lesson as response
    res.json(lesson);
});

module.exports = router;