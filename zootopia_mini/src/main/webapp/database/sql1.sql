INSERT INTO community (vcount, userid , subject, content, recommands, kind, createdate)				
VALUES				
(0, 'user1', '첫 번째 글', '모든 국민은 언론·출판의 자유와 집회·결사의 자유를 가진다. 대통령은 제4항과 제5항의 규정에 의하여 확정된 법률을 지체없이 공포하여야 한다. 제5항에 의하여 법률이 확정된 후 또는 제4항에 의한 확정법률이 정부에 이송된 후 5일 이내에 대통령이 공포하지 아니할 때에는 국회의장이 이를 공포한다.				
국방상 또는 국민경제상 긴절한 필요로 인하여 법률이 정하는 경우를 제외하고는, 사영기업을 국유 또는 공유로 이전하거나 그 경영을 통제 또는 관리할 수 없다.', 0, 1, NOW()),				
(0, 'user2' , '두 번째 글', '헌법개정은 국회재적의원 과반수 또는 대통령의 발의로 제안된다. 모든 국민은 통신의 비밀을 침해받지 아니한다.				
행정권은 대통령을 수반으로 하는 정부에 속한다.', 0, 2, NOW());				

select * from member;
select * from community;
select * from community_reply;
INSERT INTO member (nickname, userid, pwd, name, phone, email, petname, petgender, kind) VALUES
('닉네임1', 'user1', '0000', '홍길동', '010-1234-5678', 'user1@example.com', 'ALEX', 'F' ,'강아지'),
('닉네임2', 'user2', '0000', '김철수', '010-9876-5432', 'user2@example.com', '카미', 'F', '고양이'),
('닉네임3', 'user3', '0000', '이영희', '010-1111-2222', 'user3@example.com', '뽀삐', 'F', '강아지'),
('닉네임4', 'user4', '0000', '박미영', '010-3333-4444', 'user4@example.com', '맥스', 'M', '강아지');
INSERT INTO member (nickname, userid, pwd, name, phone, email, petname, petgender, kind) VALUES
('닉네임5', 'user5', '0000', '최영희', '010-5555-6666', 'user5@example.com', '초코', 'M', '고양이'),
('닉네임6', 'user6', '0000', '정수빈', '010-7777-8888', 'user6@example.com', '루디', 'M', '강아지'),
('닉네임7', 'user7', '0000', '신지영', '010-9999-0000', 'user7@example.com', '뿌랑', 'F', '토끼'),
('닉네임8', 'user8', '0000', '이기희', '010-1122-3344', 'user8@example.com', '미미', 'F', '고양이'),
('닉네임9', 'user9', '0000', '김영철', '010-5566-7788', 'user9@example.com', '루나', 'F', '강아지'),
('닉네임10', 'user10', '0000', '박민수', '010-1122-3344', 'user10@example.com', '맥', 'M', '고양이'),
('닉네임11', 'user11', '0000', '강서영', '010-5566-7788', 'user11@example.com', '코코', 'F', '햄스터'),
('닉네임12', 'user12', '0000', '장현우', '010-1122-3344', 'user12@example.com', '흰둥이', 'M', '고양이'),
('닉네임13', 'user13', '0000', '이동진', '010-5566-7788', 'user13@example.com', '호빵', 'F', '햄스터'),
('닉네임14', 'user14', '0000', '김미경', '010-1122-3344', 'user14@example.com', '뚱이', 'M', '고양이'),
('닉네임15', 'user15', '0000', '박지수', '010-5566-7788', 'user15@example.com', '까미', 'F', '강아지'),
('닉네임16', 'user16', '0000', '최민주', '010-1122-3344', 'user16@example.com', '몽땅이', 'M', '고양이'),
('닉네임17', 'user17', '0000', '이영진', '010-5566-7788', 'user17@example.com', '쿠키', 'F', '햄스터'),
('닉네임18', 'user18', '0000', '김은주', '010-1122-3344', 'user18@example.com', '루루', 'M', '고양이'),
('닉네임19', 'user19', '0000', '한지은', '010-5566-7788', 'user19@example.com', '오리', 'F', '강아지'),
('닉네임20', 'user20', '0000', '송민석', '010-1122-3344', 'user20@example.com', '웰시', 'M', '고양이'),
('닉네임21', 'user21', '0000', '장순영', '010-5566-7788', 'user21@example.com', '리틀', 'F', '햄스터'),
('닉네임22', 'user22', '0000', '고현정', '010-1122-3344', 'user22@example.com', '포포', 'M', '고양이'),
('닉네임23', 'user23', '0000', '서재용', '010-5566-7788', 'user23@example.com', '꼬부기', 'F', '강아지'),
('닉네임24', 'user24', '0000', '양재경', '010-1122-3344', 'user24@example.com', '리나', 'M', '고양이'),
('닉네임25', 'user25', '0000', '황인수', '010-5566-7788', 'user25@example.com', '냥이', 'F', '고양이'),
('닉네임26', 'user26', '0000', '신재영', '010-1122-3344', 'user26@example.com', '나비', 'M', '강아지'),
('닉네임27', 'user27', '0000', '한현진', '010-5566-7788', 'user27@example.com', '릴리', 'F', '고양이'),
('닉네임28', 'user28', '0000', '권순영', '010-1122-3344', 'user28@example.com', '냥이', 'M', '강아지'),
('닉네임29', 'user29', '0000', '박재현', '010-5566-7788', 'user29@example.com', '연', 'F', '고양이'),
('닉네임30', 'user30', '0000', '이주영', '010-1122-3344', 'user30@example.com', '돌이', 'M', '강아지');

UPDATE member SET image='joha10.jpg', saveimage='joha10.jpg' WHERE userid = 'user1';


INSERT INTO member (nickname, userid, pwd, name, phone, email, petname, petgender, kind , image , saveimage) VALUES
('닉네임5', 'user5', '0000', '홍길동', '010-1234-5678', 'user1@example.com', 'ALEX', 'F' ,'강아지' , 'profileimage1.jpg' , 'profileimage1.jpg');


INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('user1','Y','누가 더 사랑스러운 반려동물을 가지고 있는가!' , '사랑스러운 반려동물들을 찾아보세요!! 지금 바로 여러분의 귀여운 동물 사진들을 올려주세요!' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));

insert into contest_pet (userid  , cseq , content , image, saveimage ) values 
('user2', 1 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image2.jpg','pet_image2.jpg' );
insert into contest_pet (userid  , cseq , content , image, saveimage) values 
('user1', 1 ,'저희 강아지좀 보세요 대박이에요.' , 'pet_image1.jpg','pet_image1.jpg' );

insert into contest_pet (userid  , cseq , content , image, saveimage) values 
('user2', 1 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image2.jpg','pet_image2.jpg' );
insert into contest_pet (userid  , cseq , content , image, saveimage) values 
('user1', 1 ,'저희 강아지좀 보세요 대박이에요.' , 'pet_image1.jpg','pet_image1.jpg' );

INSERT INTO admins (adminid, name, pwd, phone)
VALUES ('admin', '김종호', 'admin', '010-8730-3736');

select * from admins;
