
select * from member;


INSERT INTO member (nickname, userid, pwd, name, phone, email, petname, petgender, kind) VALUES
('닉네임1', 'user1', '0000', '홍길동', '010-1234-5678', 'user1@example.com', 'ALEX', 'F' ,'강아지'),
('닉네임2', 'user2', '0000', '김철수', '010-9876-5432', 'user2@example.com', '카미', 'F', '고양이'),
('닉네임3', 'user3', '0000', '이영희', '010-1111-2222', 'user3@example.com', '뽀삐', 'F', '강아지'),
('닉네임4', 'user4', '0000', '박미영', '010-3333-4444', 'user4@example.com', '맥스', 'M', '강아지');


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