CREATE PROCEDURE bugsInComponent()
BEGIN
    SELECT 
    filtered_bug_table.title AS bug_title, 
    filtered_componenet_table.title as component_title, 
    component_counter AS bugs_in_component
    FROM (
        SELECT num, title, COUNT(*) AS bug_counter FROM Bug
        JOIN BugComponent ON Bug.num = BugComponent.bug_num
        GROUP BY Bug.num
        HAVING bug_counter > 1
    ) AS filtered_bug_table
    JOIN BugComponent ON filtered_bug_table.num = BugComponent.bug_num
    JOIN (
        SELECT *, COUNT(*) as component_counter FROM (
            SELECT * FROM Component
            JOIN BugComponent ON Component.id = BugComponent.component_id
        ) AS joined_component_table
        GROUP BY joined_component_table.id
    ) as filtered_componenet_table
    ON filtered_componenet_table.id = BugComponent.component_id
    ORDER BY component_counter DESC, filtered_componenet_table.id, BugComponent.bug_num;
END