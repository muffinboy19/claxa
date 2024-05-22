const express = require('express');
const router = express.Router();

// Use the routes
router.use('/domainQuestionaire', require('./domainQuestionaire'));
router.use('/exercise', require('./exercise'));
router.use('/onCompletion', require('./completion'));
router.use('/nextLesson', require('./nextLesson'));

module.exports = router;
