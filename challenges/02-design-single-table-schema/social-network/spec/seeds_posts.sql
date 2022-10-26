TRUNCATE TABLE posts RESTART IDENTITY; 

INSERT INTO posts (title, content, views) VALUES ('my day', 'it was great but busy', '50');
INSERT INTO posts (title, content, views) VALUES ('my life', 'is amazing', '30');