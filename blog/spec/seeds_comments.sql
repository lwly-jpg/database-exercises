TRUNCATE TABLE comments RESTART IDENTITY; 

INSERT INTO comments (author, content, post_id) VALUES ('toad', 'this was a great post', '1');
INSERT INTO comments (author, content, post_id) VALUES ('chicken', 'i love chicken', '1');