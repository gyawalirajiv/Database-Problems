CREATE PROCEDURE tictactoeTournament()
BEGIN
     select n name, 
            a + b - c points, 
            a played,
            b won,
            a - b - c draw,
            c lost
         from (select if(x, name_naughts, name_crosses) n, 
                      sum(1) a, 
                      sum(if(x, w, l)) b,
                      sum(if(x, l, w)) c
                  from (select *, 
                               board rlike "O...O...O|O..O..O|^..O.O.O|^(...)*OOO" w,
                               board rlike "X...X...X|X..X..X|^..X.X.X|^(...)*XXX" l
                            from results, 
                                 (select 0 x union select 1) z
                       ) y 
                  group by 1
              ) x  
         order by 2 desc, 3, won desc, 1;
	
END