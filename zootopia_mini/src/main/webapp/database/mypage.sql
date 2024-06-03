update member set image='profileimage1.jpg', saveimage='profileimage1.jpg' where userid='joha';

select * from member;

select * from contest;

update member set nickname = '바뀌나?' where userid = 'user1';


INSERT INTO member (nickname, userid, pwd, name, phone, email, petname, petgender, kind) VALUES
('닉네임6', 'user6', '0000', '김철수', '010-9876-5432', 'user2@example.com', '카미', 'F', '고양이'),
('닉네임7', 'user7', '0000', '이영희', '010-1111-2222', 'user3@example.com', '뽀삐', 'F', '강아지'),
('닉네임8', 'user8', '0000', '박미영', '010-3333-4444', 'user4@example.com', '맥스', 'M', '강아지');