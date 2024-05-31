
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







insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user7','SunnySmile', 15 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image2.jpg','pet_image2.jpg' );
insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user8','일난풍화한', 15 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image1.jpg','pet_image1.jpg' );

insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user4','퐤니모', 15 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image2.jpg','pet_image2.jpg' );
insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user3','서매빠디뿌', 15 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image1.jpg','pet_image1.jpg' );

insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user4','퐤니모', 15 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image2.jpg','pet_image2.jpg' );
insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user3','서매빠디뿌', 15 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image1.jpg','pet_image1.jpg' );

insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user2','서바두턔바쨰', 14 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image2.jpg','pet_image2.jpg' );
insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user10','WiseOwl', 14 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image1.jpg','pet_image1.jpg' );


insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user2','서바두턔바쨰', 14 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image2.jpg','pet_image2.jpg' );
insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user1','역학계몽요해', 13 ,'저희 강아지좀 보세요 대박이에요.' , 'pet_image1.jpg','pet_image1.jpg' );




insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user2','서바두턔바쨰',12 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image2.jpg','pet_image2.jpg' );
insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user10','WiseOwl', 13 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image1.jpg','pet_image1.jpg' );


insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user2','서바두턔바쨰', 11 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image2.jpg','pet_image2.jpg' );
insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user1','역학계몽요해', 11 ,'저희 강아지좀 보세요 대박이에요.' , 'pet_image1.jpg','pet_image1.jpg' );



insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user2','서바두턔바쨰', 10 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image2.jpg','pet_image2.jpg' );
insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user10','WiseOwl', 10 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image1.jpg','pet_image1.jpg' );


insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user2','서바두턔바쨰', 10 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image2.jpg','pet_image2.jpg' );
insert into contest_pet (userid , nickname , cseq , content , image, saveimage) values 
('user1','역학계몽요해', 10 ,'저희 강아지좀 보세요 대박이에요.' , 'pet_image1.jpg','pet_image1.jpg' );
select * from contest;
select * from contestpetiv_view;
update contest_pet set gender = 'M' where gender is null;
update member set petname = 'dongdong' where petname is null;
update member set petgender = 'M' where petgender is null;
update contest set useyn = 'Y' where cseq = 50;

select * from contest_reply;
-- contest_reply  댓글 불러오기
insert into contest_reply (cseq , userid, nickname , content) 
values (13,'user2' , '서바두턔바쨰' , '너무 이쁜데요오오오오옹??');
insert into contest_reply (cseq , userid, nickname , content) 
values (13,'user1' , '역학계몽요해' , '이 다음에는 저도 참가하고싶네요!!');

