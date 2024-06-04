INSERT INTO qnareply (qseq, subject, content, reply, userid, createdate)
VALUES 
    (1, '샘플 제목 1', '샘플 내용 1', '샘플 답변 1', 'user1', NOW()),
    (2, '샘플 제목 2', '샘플 내용 2', '샘플 답변 2', 'user4', NOW()),
    (3, '샘플 제목 3', '샘플 내용 3', '샘플 답변 3', 'user3', NOW()),
    (4, '샘플 제목 4', '샘플 내용 4', '샘플 답변 4', 'user4', NOW()),
    (5, '샘플 제목 5', '샘플 내용 5', '샘플 답변 5', 'user2', NOW()),
    (6, '샘플 제목 6', '샘플 내용 6', '샘플 답변 6', 'user2', NOW()),
    (7, '샘플 제목 7', '샘플 내용 7', '샘플 답변 7', 'user5', NOW()),
    (8, '샘플 제목 8', '샘플 내용 8', '샘플 답변 8', 'user2', NOW()),
    (9, '샘플 제목 9', '샘플 내용 9', '샘플 답변 9', 'user1', NOW()),
    (10, '샘플 제목 10', '샘플 내용 10', '샘플 답변 10', 'user1', NOW());
    
SELECT * FROM qnareply;

drop table qnareply;