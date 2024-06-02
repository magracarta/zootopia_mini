
select * from contest;

select * from member;

-- ALTER TABLE contest RENAME COLUMN count TO cnt;

SELECT DATE_ADD(NOW(), INTERVAL 1 DAY);

update contest set useyn = 'Y' where useyn = 'W';

INSERT INTO contest (userid, nickname, subject, content, lastdate)
values ('user1','역학계몽요해','누가 더 이쁜 발바닥을 가지고 있는가!' , '세상에서 제일이쁜 우리 강아지의 발바닥을 자랑해보세요! 1등하신분껜 무한 칭찬을 !' ,
DATE_ADD(NOW(), INTERVAL 7 DAY));



INSERT INTO contest (userid, nickname, subject, content, lastdate)
values ('user10','WiseOwl','누가 더 사랑스러운 반려동물을 가지고 있는가!' , '사랑스러운 반려동물들을 찾아보세요!! 지금 바로 여러분의 귀여운 동물 사진들을 올려주세요!' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));


INSERT INTO contest (userid, nickname, subject, content, lastdate)
values ('user1','역학계몽요해','누가 더 이쁜 발바닥을 가지고 있는가!' , '세상에서 제일이쁜 우리 강아지의 발바닥을 자랑해보세요! 1등하신분껜 무한 칭찬을 !' ,
DATE_ADD(NOW(), INTERVAL 7 DAY));
INSERT INTO contest (userid, nickname, subject, content, lastdate)
values ('user2','서바두턔바쨰','아무거나 1등 하는 강아지 고양이 찾아보쟈!' , '강아지든 고양이든 누가 최고인지 한번 찾아봅시다!' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));


INSERT INTO contest (userid, nickname, subject, content, lastdate)
values ('user1','역학계몽요해','누가 더 이쁜 발바닥을 가지고 있는가!' , '세상에서 제일이쁜 우리 강아지의 발바닥을 자랑해보세요! 1등하신분껜 무한 칭찬을 !' ,
DATE_ADD(NOW(), INTERVAL 1 DAY));


ALTER TABLE contest RENAME COLUMN count TO cnt;
ALTER TABLE contest add COLUMN pcnt int default 6;

select * from contest_pet;
select * from contest;
select * from contest;
select * from member;



CREATE OR REPLACE VIEW contestpetiv_view AS
SELECT a.cseq , b.cpseq , b.content , b.recommends , b.image , b.saveimage ,
m.petgender , m.petname , m.kind , m.userid  , m.nickname , m.pwd as password

FROM contest AS a, contest_pet AS b , member AS m
WHERE a.cseq = b.cseq and b.userid = m.userid ;

select * from contestpetiv_view;

CREATE OR REPLACE VIEW contestpet_view AS
SELECT 
    a.cseq AS cseq,
    a.userid AS userid,
    a.subject AS subject,
    a.content AS content,
    a.createdate AS createdate,
    a.lastdate AS lastdate,
    a.cnt AS cnt,
    a.useyn AS useyn,
    a.pcnt AS pcnt,
    SUM(CASE WHEN b.cseq IS NULL THEN 0 ELSE 1 END) AS allpcnt,
    m.nickname AS nickname 
FROM 
    contest AS a
LEFT JOIN 
    contest_pet AS b ON a.cseq = b.cseq
JOIN 
    member AS m ON a.userid = m.userid
GROUP BY 
    a.cseq, a.userid, a.subject, a.content, a.createdate, a.lastdate, a.cnt, a.useyn, a.pcnt, m.nickname;



select * from contest_pet;

select * from contestpet_view;


select * from member;






select * from contest;
select * from contestpetiv_view;
update contest_pet set gender = 'M' where gender is null;
update member set petname = 'dongdong' where petname is null;
update member set petgender = 'M' where petgender is null;
update contest set useyn = 'Y' where cseq = 50;

select * from contest_reply;
-- contest_reply  댓글 불러오기


select * from contest_pet;

INSERT INTO member (nickname, userid, pwd, name, phone, email, petname, petgender, kind) VALUES
('닉네임1', 'user1', '0000', '홍길동', '010-1234-5678', 'user1@example.com', 'ALEX', 'F' ,'강아지'),
('닉네임2', 'user2', '0000', '김철수', '010-9876-5432', 'user2@example.com', '카미', 'F', '고양이'),
('닉네임3', 'user3', '0000', '이영희', '010-1111-2222', 'user3@example.com', '뽀삐', 'F', '강아지'),
('닉네임4', 'user4', '0000', '박미영', '010-3333-4444', 'user4@example.com', '맥스', 'M', '강아지');


insert into contest_pet (userid  , cseq , content , image, saveimage ) values 
('user2', 39 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image2.jpg','pet_image2.jpg' );
insert into contest_pet (userid  , cseq , content , image, saveimage) values 
('user1', 39 ,'저희 강아지좀 보세요 대박이에요.' , 'pet_image1.jpg','pet_image1.jpg' );

insert into contest_pet (userid  , cseq , content , image, saveimage) values 
('user2', 39 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image2.jpg','pet_image2.jpg' );
insert into contest_pet (userid  , cseq , content , image, saveimage) values 
('user1', 6 ,'저희 강아지좀 보세요 대박이에요.' , 'pet_image1.jpg','pet_image1.jpg' );


INSERT INTO member (nickname, userid, pwd, name, phone, email) VALUES
('닉네임6', 'user6', '0000', '홍길동', '010-1234-5678', 'user1@example.com');

INSERT INTO member (nickname, userid, pwd, name, phone, email, petname, petgender, kind , image , saveimage) VALUES
('닉네임5', 'user5', '0000', '홍길동', '010-1234-5678', 'user1@example.com', 'ALEX', 'F' ,'강아지' , 'profileimage1.jpg' , 'profileimage1.jpg');

select * from member;
select * from contest;

update contest set useyn = 'Y' where useyn = 'W';


INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('user1','Y','누가 더 사랑스러운 반려동물을 가지고 있는가!' , '사랑스러운 반려동물들을 찾아보세요!! 지금 바로 여러분의 귀여운 동물 사진들을 올려주세요!' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('user1','Y','누가 더 사랑스러운 반려동물을 가지고 있는가!' , '사랑스러운 반려동물들을 찾아보세요!! 지금 바로 여러분의 귀여운 동물 사진들을 올려주세요!' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('user1','Y','누가 더 사랑스러운 반려동물을 가지고 있는가!' , '사랑스러운 반려동물들을 찾아보세요!! 지금 바로 여러분의 귀여운 동물 사진들을 올려주세요!' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('user1','Y','누가 더 사랑스러운 반려동물을 가지고 있는가!' , '사랑스러운 반려동물들을 찾아보세요!! 지금 바로 여러분의 귀여운 동물 사진들을 올려주세요!' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));

update contest set useyn = 'Y' where useyn = 'W';
