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
values ('joha','Y','조타 콘테스트 4' , '테스트입니다' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('jota','Y','조타 콘테스트 5' , '테스트입니다' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('jota','Y','조타 콘테스트 6' , '테스트입니다' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('jota','Y','조타 콘테스트 7' , '테스트입니다' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('jota','Y','조타 콘테스트 8' , '테스트입니다' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));

-- 종료된 콘테스트 
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('jota','Y','종료된 콘테스트 테스트3' , '기간이 종료 되었습니다!!' ,
DATE_SUB(NOW(), INTERVAL 3 DAY));
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('jota','Y','종료된 콘테스트 테스트4' , '기간이 종료 되었습니다!!' ,
DATE_SUB(NOW(), INTERVAL 3 DAY));
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('jota','Y','종료된 콘테스트 테스트5' , '기간이 종료 되었습니다!!' ,
DATE_SUB(NOW(), INTERVAL 3 DAY));

insert into contest_pet (userid  , cseq , content , image, saveimage) values 
('jota', 9 ,'종료된 콘테스트에 참가했었어요' , 'joha11.jpg','joha11.jpg' );



update member set useyn = 'Y' where userid = 'joha';

delete from contestpetiv_view where cpseq = 16;



select * from contestpet_view;

select * from community_reply;
select * from contest_reply;
select * from community;

INSERT INTO community (vcount, userid, subject, content, recommands, kind, createdate) VALUES
(10, 'jota', '첫 번째 글입니다.', '첫 번째 글의 내용입니다.', 5, 1, NOW()),
(8, 'jota', '두 번째 글입니다.', '두 번째 글의 내용입니다.', 3, 1, NOW()),
(15, 'jota', '세 번째 글입니다.', '세 번째 글의 내용입니다.', 7, 2, NOW()),
(12, 'jota', '네 번째 글입니다.', '네 번째 글의 내용입니다.', 4, 2, NOW()),
(20, 'jota', '다섯 번째 글입니다.', '다섯 번째 글의 내용입니다.', 8, 2, NOW()),
(14, 'jota', '여섯 번째 글입니다.', '여섯 번째 글의 내용입니다.', 6, 1, NOW()),
(18, 'jota', '일곱 번째 글입니다.', '일곱 번째 글의 내용입니다.', 9, 2, NOW()),
(11, 'jota', '여덟 번째 글입니다.', '여덟 번째 글의 내용입니다.', 7, 1, NOW()),
(25, 'jota', '아홉 번째 글입니다.', '아홉 번째 글의 내용입니다.', 12, 2, NOW()),
(10, 'jota', '열 번째 글입니다.', '열 번째 글의 내용입니다.', 5, 1, NOW()),
(12, 'jota', '열한 번째 글입니다.', '열한 번째 글의 내용입니다.', 8, 2, NOW()),
(15, 'jota', '열두 번째 글입니다.', '열두 번째 글의 내용입니다.', 10, 1, NOW()),
(18, 'jota', '열세 번째 글입니다.', '열세 번째 글의 내용입니다.', 6, 2, NOW()),
(20, 'jota', '열네 번째 글입니다.', '열네 번째 글의 내용입니다.', 9, 1, NOW()),
(16, 'jota', '열다섯 번째 글입니다.', '열다섯 번째 글의 내용입니다.', 7, 2, NOW()),
(14, 'jota', '열여섯 번째 글입니다.', '열여섯 번째 글의 내용입니다.', 11, 1, NOW()),
(17, 'jota', '열일곱 번째 글입니다.', '열일곱 번째 글의 내용입니다.', 8, 2, NOW()),
(19, 'jota', '열여덟 번째 글입니다.', '열여덟 번째 글의 내용입니다.', 12, 1, NOW()),
(11, 'jota', '열아홉 번째 글입니다.', '열아홉 번째 글의 내용입니다.', 9, 2, NOW()),
(13, 'jota', '스무 번째 글입니다.', '스무 번째 글의 내용입니다.', 7, 1, NOW());


INSERT INTO community_reply (userid, gseq, content, createdate) 
VALUES ('jota', 4, '이 게시글 정말 좋네요!', '2024-06-01 10:00:00');
INSERT INTO community_reply (userid, gseq, content, createdate) 
VALUES ('jota', 5, '이 게시글 정말 좋네요!', '2024-06-01 10:00:00');
INSERT INTO community_reply (userid, gseq, content, createdate) 
VALUES ('jota', 1, '이 게시글 정말 좋네요!', '2024-06-01 10:00:00');
INSERT INTO community_reply (userid, gseq, content, createdate) 
VALUES ('jota', 2, '이 게시글 정말 좋네요!', '2024-06-01 10:00:00');
INSERT INTO community_reply (userid, gseq, content, createdate) 
VALUES ('jota', 3, '이 게시글 정말 좋네요!', '2024-06-01 10:00:00');
INSERT INTO community_reply (userid, gseq, content, createdate) 
VALUES ('jota', 4, '이 게시글 정말 좋네요!', '2024-06-01 10:00:00');
INSERT INTO community_reply (userid, gseq, content, createdate) 
VALUES ('jota', 5, '이 게시글 정말 좋네요!', '2024-06-01 10:00:00');
INSERT INTO community_reply (userid, gseq, content, createdate) 
VALUES ('jota', 6, '이 게시글 정말 좋네요!', '2024-06-01 10:00:00');


    
-- 내 댓글 조회를 위한 저장 프로시저 생성

CREATE PROCEDURE get_user_comments(IN input_userId VARCHAR(255))
BEGIN
    SELECT 
        'community' AS source,
        userid AS user_id,
        gseq AS post_id,
        grseq AS reply_id,
        content AS reply_content,
        createdate AS reply_date,
    FROM 
        community_reply
    WHERE 
        userid = input_userId

    UNION ALL

    SELECT 
        'contest' AS source,
        userid AS user_id,
        cseq AS post_id,
        crseq AS reply_id,
        content AS reply_content,
        createdate AS reply_date
    FROM 
        contest_reply
    WHERE 
        userid = input_userId
    ORDER BY 
        reply_date DESC;
END //

DELIMITER ;


CALL get_user_comments('jota');

DROP PROCEDURE get_user_comments;

--community_reply 테이블에서 글 제목을 가져오기 위해 community 테이블을 조인하였고, 
--contest_reply 테이블에서 글 제목을 가져오기 위해 contest 테이블을 조인
CREATE PROCEDURE get_user_comments(IN input_userId VARCHAR(255))
BEGIN
    SELECT 
        'community' AS source,
        cr.userid AS user_id,
        cr.gseq AS post_id,
        cr.grseq AS reply_id,
        cr.content AS reply_content,
        cp.subject AS subject, 
        cr.createdate AS reply_date
    FROM 
        community_reply cr
    INNER JOIN community cp ON cr.gseq = cp.gseq 
    WHERE 
        cr.userid = input_userId

    UNION ALL

    SELECT 
        'contest' AS source,
        ct.userid AS user_id,
        ct.cseq AS post_id,
        ct.crseq AS reply_id,
        ct.content AS reply_content,
        cp.subject AS subject,
        ct.createdate AS reply_date
    FROM 
        contest_reply ct
    INNER JOIN contest cp ON ct.cseq = cp.cseq 
    WHERE 
        ct.userid = input_userId
    ORDER BY 
        reply_date DESC;
END;

---총 댓글수 구하는 거 추가
CREATE PROCEDURE get_user_comments(
    IN input_userId VARCHAR(255),
    OUT total_comments INT
)
BEGIN
    -- Community 댓글 수 계산
    SET @community_comments = (
        SELECT COUNT(*)
        FROM community_reply cr
        WHERE cr.userid = input_userId
    );

    -- Contest 댓글 수 계산
    SET @contest_comments = (
        SELECT COUNT(*)
        FROM contest_reply ct
        WHERE ct.userid = input_userId
    );

    -- 총 댓글 수 계산
    SET total_comments = @community_comments + @contest_comments;

    -- 나머지 프로시저 로직
    SELECT 
        'community' AS source,
        cr.userid AS user_id,
        cr.gseq AS post_id,
        cr.grseq AS reply_id,
        cr.content AS reply_content,
        cp.subject AS subject, 
        cr.createdate AS reply_date
    FROM 
        community_reply cr
    INNER JOIN community cp ON cr.gseq = cp.gseq 
    WHERE 
        cr.userid = input_userId

    UNION ALL

    SELECT 
        'contest' AS source,
        ct.userid AS user_id,
        ct.cseq AS post_id,
        ct.crseq AS reply_id,
        ct.content AS reply_content,
        cp.subject AS subject,
        ct.createdate AS reply_date
    FROM 
        contest_reply ct
    INNER JOIN contest cp ON ct.cseq = cp.cseq 
    WHERE 
        ct.userid = input_userId
    ORDER BY 
        reply_date DESC;
END;



select * from community_reply;
select * from contest_reply;
