INSERT INTO member (nickname, userid, pwd, name, phone, email, petname, petgender, kind) VALUES
('역학계몽요해', 'user1', '1111', '홍길동', '010-1234-5678', 'user1@example.com', 'ALEX', 'F' ,'강아지'),
('서바두턔바쨰', 'user2', '2222', '김철수', '010-9876-5432', 'user2@example.com', '카미', 'F', '고양이'),
('서매빠디뿌', 'user3', '3333', '이영희', '010-1111-2222', 'user3@example.com', NULL, NULL, NULL),
('퐤니모', 'user4', '4444', '박미영', '010-3333-4444', 'user4@example.com', NULL, NULL, NULL),
('쭤쥬뢰포', 'user5', '5555', '정영자', '010-5555-6666', 'user5@example.com', '초코', 'F', '강아지'),
('마주잡기', 'user6', '6666', '이성민', '010-7777-8888', 'user6@example.com', NULL, NULL, NULL),
('SunnySmile', 'user7', '7777', '최영수', '010-9999-0000', 'user7@example.com', '뽀삐', 'F', '강아지'),
('일난풍화한', 'user8', '8888', '김미희', '010-1234-5678', 'user8@example.com', '로미', 'F', '고양이'),
('LunaBeam', 'user9', '9999', '박철호', '010-9876-5432', 'user9@example.com', '맥스', 'M', '강아지'),
('WiseOwl', 'user10', '10101010', '이미숙', '010-1111-2222', 'user10@example.com', '마이클', 'M', '고양이');


select * from member;


INSERT INTO community (vcount, userid , subject, content, recommands, kind, createdate)				
VALUES				
(0, 'user1', '첫 번째 글', '모든 국민은 언론·출판의 자유와 집회·결사의 자유를 가진다. 대통령은 제4항과 제5항의 규정에 의하여 확정된 법률을 지체없이 공포하여야 한다. 제5항에 의하여 법률이 확정된 후 또는 제4항에 의한 확정법률이 정부에 이송된 후 5일 이내에 대통령이 공포하지 아니할 때에는 국회의장이 이를 공포한다.				
국방상 또는 국민경제상 긴절한 필요로 인하여 법률이 정하는 경우를 제외하고는, 사영기업을 국유 또는 공유로 이전하거나 그 경영을 통제 또는 관리할 수 없다.', 0, 1, NOW()),				
(0, 'user2' , '두 번째 글', '헌법개정은 국회재적의원 과반수 또는 대통령의 발의로 제안된다. 모든 국민은 통신의 비밀을 침해받지 아니한다.				
행정권은 대통령을 수반으로 하는 정부에 속한다.', 0, 2, NOW());				


select * from community;