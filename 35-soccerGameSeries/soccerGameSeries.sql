CREATE PROCEDURE soccerGameSeries()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT 
        CASE
            WHEN stats.first_team_wins > stats.second_team_wins THEN 1
            WHEN stats.second_team_wins > stats.first_team_wins THEN 2
            WHEN stats.goal_diff > 0 THEN 1
            WHEN stats.goal_diff < 0 THEN 2
            WHEN stats.first_team_points > stats.second_team_points THEN 1
            WHEN stats.second_team_points > stats.first_team_points THEN 2
            ELSE 0
        END AS 'winner'
    FROM (
        SELECT 
            SUM(scores.first_team_score > scores.second_team_score) as 'first_team_wins',
            SUM(scores.first_team_score < scores.second_team_score) as 'second_team_wins',
            SUM(scores.first_team_score - scores.second_team_score) as 'goal_diff',
            SUM((scores.match_host = 2) * scores.first_team_score) as 'first_team_points',
            SUM((scores.match_host = 1) * scores.second_team_score) as 'second_team_points'
        FROM scores
    ) as stats;
END