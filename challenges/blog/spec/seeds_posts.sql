TRUNCATE TABLE posts RESTART IDENTITY CASCADE; 

INSERT INTO posts (title, content) VALUES ('my day', 'it was great but busy');
INSERT INTO posts (title, content) VALUES ('my life', 'is amazing');