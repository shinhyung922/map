SHOW TABLES FROM project01;
SELECT * FROM board;
SELECT * FROM location_category;
SELECT * FROM member;
SELECT * FROM message;
desc message;
CREATE TABLE likes (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    board_id INT NOT NULL,
    mem_id INT NOT NULL
);
drop table likes;
INSERT INTO likes (board_id, mem_id) VALUES (2, 1);
INSERT INTO likes (board_id, mem_id) VALUES (3, 1);
SELECT * FROM likes;
ALTER TABLE message ADD PRIMARY KEY (num);
ALTER TABLE message MODIFY num INT AUTO_INCREMENT;