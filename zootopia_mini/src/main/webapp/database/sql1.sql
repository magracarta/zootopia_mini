INSERT INTO community (vcount, userid , subject, content, recommands, kind, createdate)				
VALUES				
(0, 'user1', '첫 번째 글', '모든 국민은 언론·출판의 자유와 집회·결사의 자유를 가진다. 대통령은 제4항과 제5항의 규정에 의하여 확정된 법률을 지체없이 공포하여야 한다. 제5항에 의하여 법률이 확정된 후 또는 제4항에 의한 확정법률이 정부에 이송된 후 5일 이내에 대통령이 공포하지 아니할 때에는 국회의장이 이를 공포한다.				
국방상 또는 국민경제상 긴절한 필요로 인하여 법률이 정하는 경우를 제외하고는, 사영기업을 국유 또는 공유로 이전하거나 그 경영을 통제 또는 관리할 수 없다.', 0, 1, NOW()),				
(0, 'user2' , '두 번째 글', '헌법개정은 국회재적의원 과반수 또는 대통령의 발의로 제안된다. 모든 국민은 통신의 비밀을 침해받지 아니한다.				
행정권은 대통령을 수반으로 하는 정부에 속한다.', 0, 2, NOW());				

select * from member;
select * from community;
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

INSERT INTO admins (adminid, name, pwd, phone)
VALUES ('admin', '김종호', 'admin', '010-8730-3736');

select * from admins;
