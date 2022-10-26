TRUNCATE TABLE users RESTART IDENTITY CASCADE; 

INSERT INTO users (username, email) VALUES ('toad', 'toad@fake.com');
INSERT INTO users (username, email) VALUES ('chicken', 'chicken@fake.com');