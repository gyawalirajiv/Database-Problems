CREATE PROCEDURE testCheck()
    SELECT id, IF (given_answer is NULL, 'no answer', IF(correct_answer = given_answer, 'correct', 'incorrect')) AS checks
    FROM answers
    ORDER BY id;
