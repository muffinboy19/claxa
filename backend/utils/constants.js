const lesson = {
    LessonIndex: 0,
    Difficulty: 'Beginner',
    LessonId: 1234,
    IntroPage: {
        Hook: 'Welcome to Job Interview Skills Learning',
        Description: 'This lesson will cover the basics of job interview skills.',
        AssetIndex: 1
    },
    NumNodes: 6,
    LessonNodes: [
        {
            Index: 0,
            Type: 'LessonIntro',
            LessonReward: { Points: 100 },
            Content: { Title: 'Introduction to Job Interview Skills', Description: 'Learn the basics of job interview skills.' }
        },
        {
            Index: 1,
            Type: 'LessonContent',
            LessonReward: { Points: 50 },
            Content: [{ Title: 'Research the Company', Description: 'Research the company before the interview.' }, { Title: 'Practice Common Questions', Description: 'Practice answering common interview questions.' }]
        },
        {
            Index: 2,
            Type: 'Exercise',
            ExerciseType: "Single Answer Role Play",
            LessonReward: { Points: 50 },
            Content: { Title: 'Role Play', Description: 'Answer the following interview question:\n "Tell me about yourself." \n Try to answer confidently and concisely for job profile "Software Engineer".'}
        },
        {
            Index: 3,
            Type: 'LessonContent',
            LessonReward: { Points: 50 },
            Content: [{ Title: 'Strengths', Description: 'Identify your greatest strength and how it applies to the job of a Software Engineer.' }, { Title: 'Weaknesses', Description: 'Identify your greatest weakness and how you are working to improve it.' }]
        },
        {
            Index: 4,
            Type: "Exercise",
            ExerciseType: "Single Answer Role Play",
            LessonReward: { Points: 50 },
            Content: { Title: 'Role Play', Description: 'Answer the following interview question:\n "What are your strengths and weaknesses?" \n Try to answer confidently and concisely for job profile "Software Engineer".'}
        },
        {
            Index: 5,
            Type: 'Assessment',
            LessonReward: { Points: 100 },
            Content: {
                "Instructions": "Let's start with a few practice exercises to test your knowledge of job interview skills.",
                "Exercises": [
                    {
                      ExerciseType: "Single Answer Role Play",
                      Content: { Title: 'Role Play', Description: 'Answer the following interview question:\n "Tell me about yourself." \n Try to answer confidently and concisely for job profile "Software Engineer".'},
                    }, 
                    {
                      ExerciseType: "Single Answer Role Play",
                      Content: { Title: 'Research the Company', Description: 'Why is it important to research the company before an interview?' },
                    },
                    {
                      ExerciseType: "Single Answer Role Play",
                      Content: { Title: 'Strengths', Description: 'What is your greatest strength and how does it apply to the job of a Software Engineer?'}
                    }
                ]
            }
        }

    ],
    Tips: {
        StartIndex: 0,
        Content: [
            { Description: 'Tip 1: Research the company before the interview', AssetIndex: 1 },
            { Description: 'Tip 2: Practice answering common interview questions', AssetIndex: 2 }
        ]
    }
};

// Export the lesson object
module.exports = lesson;
