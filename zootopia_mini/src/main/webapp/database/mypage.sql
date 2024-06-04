update member set image='profileimage1.jpg', saveimage='profileimage1.jpg' where userid='joha';

select * from member;

select * from contest;

select * from contestpetiv_view;

update member set nickname = '바뀌나?' where userid = 'user1';


INSERT INTO member (nickname, userid, pwd, name, phone, email, petname, petgender, kind) VALUES
('닉네임1', 'user1', '0000', '김철수', '010-9876-5432', 'user1@example.com', '카미', 'F', '고양이'),
('닉네임2', 'user2', '0000', '이영희', '010-1111-2222', 'user2@example.com', '뽀삐', 'F', '강아지'),
('닉네임3', 'user3', '0000', '박미영', '010-3333-4444', 'user3@example.com', '맥스', 'M', '강아지');

INSERT INTO member (nickname, userid, pwd, name, phone, email, petname, petgender, kind) VALUES
('조하엄마', 'joha', '0000', '정은선', '010-9876-5432', 'user1@example.com', '조하', 'F', '강아지'),
('조하아빠', 'jota', '0000', '현진이', '010-1111-2222', 'user2@example.com', '조타', 'F', '강아지'),
('닉네임4', 'user4', '0000', '박미영', '010-3333-4444', 'user3@example.com', '맥스', 'M', '강아지');


insert into contest_pet (userid  , cseq , content , image, saveimage ) values 
('jota', 5 ,'우리 조하 귀엽죠 ㅋㅋㅋㅋ' , 'joha13.jpg','joha13.jpg' );
insert into contest_pet (userid  , cseq , content , image, saveimage) values 
('joha', 4 ,'얜 잘때 왜이럴까 진짜,,' , 'joha5.jpg','joha5.jpg' );
insert into contest_pet (userid  , cseq , content , image, saveimage) values 
('user3', 5 ,'나는 오늘 쉬야를 했습니다' , 'joha21.jpg','joha21.jpg' );
insert into contest_pet (userid  , cseq , content , image, saveimage) values 
('user4', 4 ,'귀여운 혓바닥 메롱' , 'joha17.jpg','joha17.jpg' );

select * from contest;



INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('joha','Y','우리 반려견 엽기사진 콘테스트' , '우리 반려견의 엽기 사진 대결해요!' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('jota','Y','콘테스트 또 올려요~~' , '테스트입니다' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('jota','Y','조타 콘테스트 3' , '테스트입니다' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('user1','Y','누가 더 사랑스러운 반려동물을 가지고 있는가!' , '사랑스러운 반려동물들을 찾아보세요!! 지금 바로 여러분의 귀여운 동물 사진들을 올려주세요!' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('user1','Y','누가 더 사랑스러운 반려동물을 가지고 있는가!' , '사랑스러운 반려동물들을 찾아보세요!! 지금 바로 여러분의 귀여운 동물 사진들을 올려주세요!' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));

-- 종료된 콘테스트 
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('jota','Y','종료된 콘테스트 테스트' , '기간이 종료 되었습니다!!' ,
DATE_SUB(NOW(), INTERVAL 3 DAY));
insert into contest_pet (userid  , cseq , content , image, saveimage) values 
('joha', 9 ,'종료된 콘테스트에 참가했었어요' , 'joha11.jpg','joha11.jpg' );



update member set useyn = 'Y' where userid = 'joha';

delete from contestpetiv_view where cpseq = 16;



select * from contestpet_view;

select * from community_reply;

