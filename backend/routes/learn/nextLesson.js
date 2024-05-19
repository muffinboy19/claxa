const express = require('express');
const router = express.Router();
const lesson = require('../../utils/constants')

router.post('/fetchNextLesson', (req, res) => {
    const { authToken, currentLessonIndex, currentDifficultyLevel } = req.body;
    // Implement your logic here to fetch the next lesson based on the provided inputs
    res.json(lesson);
});

module.exports = router;