/* What does the app's SQL look like? */

-- Create a table to store Instagram-like posts
CREATE TABLE posts (
    post_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user TEXT,
    image_url TEXT,
    caption TEXT,
    likes INTEGER DEFAULT 0
);

-- Insert example posts
INSERT INTO posts (user, image_url, caption, likes)
VALUES ("dhilip_kumar", "https://img1.jpg", "First day at beach!", 20);

INSERT INTO posts (user, image_url, caption, likes)
VALUES ("tech_guru", "https://img2.jpg", "SQL is love 💻", 45);

INSERT INTO posts (user, image_url, caption, likes)
VALUES ("artlover", "https://img3.jpg", "Morning sketch ☀️", 10);

-- Update a post's caption (editing a post)
UPDATE posts
SET caption = "First day at the sunny beach! 🏖️"
WHERE post_id = 1;

-- Delete a post (deleting a post)
DELETE FROM posts
WHERE post_id = 3;

-- View all posts
SELECT * FROM posts;

