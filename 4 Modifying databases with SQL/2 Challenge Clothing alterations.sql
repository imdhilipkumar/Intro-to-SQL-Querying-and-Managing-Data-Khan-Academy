CREATE TABLE clothes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    design TEXT);
    
INSERT INTO clothes (type, design)
    VALUES ("dress", "pink polka dots");
INSERT INTO clothes (type, design)
    VALUES ("pants", "rainbow tie-dye");
INSERT INTO clothes (type, design)
    VALUES ("blazer", "black sequin");
    
/*

Step 1
We've created a database of clothes, and decided we need a price column. Use ALTER to add a 'price' column to the table. Then select all the columns in each row to see what your table looks like now.

*/

ALTER TABLE clothes ADD price INTEGER default NULL;

SELECT * FROM Clothes;

/*
Step 2
Now assign each item a price, using UPDATE - item 1 should be 10 dollars, item 2 should be 20 dollars, item 3 should be 30 dollars. When you're done, do another SELECT of all the rows to check that it worked as expected.
*/

UPDATE clothes
SET price = 10
WHERE clothes.id = 1;


UPDATE clothes
SET price = 20
WHERE clothes.id = 2;


UPDATE clothes
SET price = 30
WHERE clothes.id = 3;

SELECT * FROM clothes;

/*
Step 3
Now insert a new item into the table that has all three attributes filled in, including 'price'. Do one final SELECT of all the rows to check it worked.
*/

INSERT INTO clothes (type, design, price)
    VALUES ("lazer", "Whiteequin", 50);
    
SELECT * FROM clothes;
    



