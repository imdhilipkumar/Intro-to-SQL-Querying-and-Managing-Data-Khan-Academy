CREATE TABLE todo_list (id INTEGER PRIMARY KEY, item TEXT, minutes INTEGER);
INSERT INTO todo_list VALUES (1, "Wash the dishes", 15);
INSERT INTO todo_list VALUES (2, "vacuuming", 20);
INSERT INTO todo_list VALUES (3, "Learn some stuff on KA", 30);
INSERT INTO todo_list VALUES (4, "Do Some Project Work SQL", 45);


-- Step 1 : Add another item (this is the part that was missing)
INSERT INTO todo_list VALUES (5, "Read a book", 25);

-- Step 1 : Select and sort by minutes
SELECT item, minutes FROM todo_list 
ORDER BY minutes;

-- Step 2 : SUM of minutes
SELECT SUM(minutes) FROM todo_list;
