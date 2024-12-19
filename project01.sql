SHOW TABLES FROM project01;
SELECT * FROM board;
SELECT * FROM location_category;
SELECT * FROM member;
SELECT * FROM message;


CREATE TABLE likes (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    board_id INT NOT NULL,
    mem_id INT NOT NULL
);


INSERT INTO likes (board_id, mem_id) VALUES (2, 1);
INSERT INTO likes (board_id, mem_id) VALUES (3, 1);
SELECT * FROM likes;


create table message(
	sender varchar(10),
    receiver varchar(10),
    content varchar(200),
    subject varchar(50),
    send_date datetime,
    num int primary key AUTO_INCREMENT
);
insert into message(sender, receiver, content, subject, send_date) values
('1', '2,' , '잘부탁드립니다', '안녕하세요', '2024-12-12 09:34:21'),
('2', '3,' , '아우배불러', '내일도시락은?',   '2024-12-15 09:34:21'),
('3', '1,' , '잠좀자고싶다', '밤12시',  '2024-12-16 09:34:21');
