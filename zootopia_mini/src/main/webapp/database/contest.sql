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

