/*Please add ; after each select statement*/
CREATE PROCEDURE battleshipGameResults()
BEGIN
    select size, sum(undamaged) undamaged, sum(partly_damaged) partly_damaged, sum(sunk) sunk from (
    select id, damage, size,
    case when damage = 0 then 1 else 0 end undamaged,
    case when damage > 0 and damage < size then 1 else 0 end partly_damaged,
    case when damage = size then 1 else 0 end sunk
    from (
	select id,
    (
        select count(*) from opponents_shots o
        where o.target_x >= s.upper_left_x and o.target_x <= s.bottom_right_x
        and o.target_y >= s.upper_left_y and o.target_y <= s.bottom_right_y
    ) damage,
    (s.bottom_right_x - s.upper_left_x + s.bottom_right_y - s.upper_left_y + 1) size
    from locations_of_ships s
    ) r
    ) tmp
    group by size
    order by size;
END