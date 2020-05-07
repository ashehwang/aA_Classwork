PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    questioner_id INTEGER,

    FOREIGN KEY (questioner_id) REFERENCES users(id)
);


CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    author_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
    users(fname, lname)
VALUES
    ('Michael', 'Hollingworth'),
    ('Ashe', 'Hwang'),
    ('Lina', 'Kherchi'),
    ('Ryan', 'Mapa'),
    ('Carlos', 'Garcia'),
    ('Julia', 'Wang');

INSERT INTO
    questions(title, body, questioner_id)
VALUES 
    ('Why is SQL hard?', 'SQL is so hard. Whyyyyyy', (SELECT id FROM users WHERE fname = 'Ashe')),
    ('COVID question!', 'Why is COVID19 not going away?', (SELECT id FROM users WHERE fname = 'Carlos')),
    ('Why won''t everyone drink wine with me?', 'Fridays are the perfect time for some wine!', (SELECT id FROM users WHERE fname = 'Julia')),
    ('Friday circle time', 'What was the high and low of your week?', (SELECT id FROM users WHERE fname = 'Carlos')),
    ('Why won''t everyone drink boba with me?', 'Boba is so awesome!', (SELECT id FROM users WHERE fname = 'Julia'));

INSERT INTO
    question_follows(question_id, user_id)
VALUES
    ((SELECT id FROM questions WHERE title = 'Why is SQL hard?'), (SELECT id FROM users WHERE fname = 'Michael')),
    ((SELECT id FROM questions WHERE title = 'Why is SQL hard?'), (SELECT id FROM users WHERE fname = 'Ashe')),
    ((SELECT id FROM questions WHERE title = 'Why is SQL hard?'), (SELECT id FROM users WHERE fname = 'Ryan')),
    ((SELECT id FROM questions WHERE title = 'Why won''t everyone drink wine with me?'), (SELECT id FROM users WHERE fname = 'Carlos'));

INSERT INTO
    replies(question_id, parent_reply_id, author_id, body)
VALUES
    ((SELECT id FROM questions WHERE title = 'Why is SQL hard?'),
     NULL,
     (SELECT id FROM users WHERE fname = 'Michael'),
     'Because the folks at App Academy don''t give us enough videos :(');
     
     
INSERT INTO
    replies(question_id, parent_reply_id, author_id, body)
VALUES
     ((SELECT id FROM questions WHERE title = 'Why is SQL hard?'),
     (SELECT id FROM replies WHERE body = 'Because the folks at App Academy don''t give us enough videos :('),
     (SELECT id FROM users WHERE fname = 'Ryan'),
     'What about all the lectures?'),
     
     ((SELECT id FROM questions WHERE title = 'Why is SQL hard?'),
     (SELECT id FROM replies WHERE body = 'Because the folks at App Academy don''t give us enough videos :('),
     (SELECT id FROM users WHERE fname = 'Lina'),
     'If you do the readings, get enough sleep, and follow all the demos, that should be enough.');
     
          
INSERT INTO
    replies(question_id, parent_reply_id, author_id, body)
VALUES
     ((SELECT id FROM questions WHERE title = 'Why is SQL hard?'),
     (SELECT id FROM replies WHERE body = 'What about all the lectures?'),
     (SELECT id FROM users WHERE fname = 'Michael'),
     'But I want more Alvin.'),
     
     ((SELECT id FROM questions WHERE title = 'COVID question!'),
     NULL,
     (SELECT id FROM users WHERE fname = 'Lina'),
     'Because the government is lagging behind.');

INSERT INTO
    question_likes(user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Ashe'),
     (SELECT id FROM questions WHERE title = 'Why is SQL hard?')),

    ((SELECT id FROM users WHERE fname = 'Michael'),
     (SELECT id FROM questions WHERE title = 'Why is SQL hard?')),

    ((SELECT id FROM users WHERE fname = 'Ashe'),
    (SELECT id FROM questions WHERE title = 'COVID question!')),

        ((SELECT id FROM users WHERE fname = 'Lina'),
    (SELECT id FROM questions WHERE title = 'COVID question!')),

        ((SELECT id FROM users WHERE fname = 'Julia'),
    (SELECT id FROM questions WHERE title = 'Friday circle time')),

        ((SELECT id FROM users WHERE fname = 'Carlos'),
    (SELECT id FROM questions WHERE title = 'Friday circle time')),

        ((SELECT id FROM users WHERE fname = 'Ryan'),
    (SELECT id FROM questions WHERE title = 'Friday circle time')),

        ((SELECT id FROM users WHERE fname = 'Julia'),
    (SELECT id FROM questions WHERE title = 'COVID question!')),
    
        ((SELECT id FROM users WHERE fname = 'Carlos'),
    (SELECT id FROM questions WHERE title = 'Why won''t everyone drink boba with me?')),
    
        ((SELECT id FROM users WHERE fname = 'Michael'),
    (SELECT id FROM questions WHERE title = 'Why won''t everyone drink boba with me?'));