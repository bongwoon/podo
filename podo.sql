DROP TABLE "TB_MEMBER" CASCADE CONSTRAINTS;
DROP TABLE "TB_REVIEW";
DROP TABLE "TB_LIKE";
DROP TABLE "TB_FILM" CASCADE CONSTRAINTS;
DROP TABLE "TB_DETAIL_FILM" CASCADE CONSTRAINTS;
DROP TABLE "TB_BOARD";
DROP TABLE "TB_RATING_FILM";
DROP TABLE "TB_COMMENT";
DROP TABLE "TB_INQUIRY";
DROP TABLE "TB_NOTICE";
DROP TABLE "TB_COLLECTION" CASCADE CONSTRAINTS;
DROP TABLE "TB_FILM_COLLECTION";
DROP TABLE "TB_REPORT";
DROP TABLE "TB_BLACK_MEMBER";
DROP TABLE "TB_ACTOR" CASCADE CONSTRAINTS;
DROP TABLE "TB_IMAGE";
DROP TABLE "TB_FILM_IMAGE";
DROP TABLE "TB_FILM_ACTOR";
DROP TABLE "TB_RATING_REVIEW";
DROP TABLE "TB_GENRE" CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_MEMBER_ID;
DROP SEQUENCE SEQ_REVIEW_ID;
DROP SEQUENCE SEQ_LIKE_ID;
DROP SEQUENCE SEQ_FILM_ID;
DROP SEQUENCE SEQ_DFILM_ID;
DROP SEQUENCE SEQ_BOARD_ID;
DROP SEQUENCE SEQ_RATING_FILM_ID;
DROP SEQUENCE SEQ_COMMENT_ID;
DROP SEQUENCE SEQ_INQUERY_ID;
DROP SEQUENCE SEQ_NOTICE_ID;
DROP SEQUENCE SEQ_COLLECTION_ID;
DROP SEQUENCE SEQ_REPORT_ID;
DROP SEQUENCE SEQ_BLACK_ID;
DROP SEQUENCE SEQ_ACTOR_ID;
DROP SEQUENCE SEQ_IMAGE_ID;
DROP SEQUENCE SEQ_FIMAGE_ID;
DROP SEQUENCE SEQ_RATING_REVIEW_ID;
DROP SEQUENCE SEQ_GENRE_ID;

CREATE SEQUENCE SEQ_MEMBER_ID;
CREATE SEQUENCE SEQ_REVIEW_ID;
CREATE SEQUENCE SEQ_LIKE_ID;
CREATE SEQUENCE SEQ_FILM_ID;
CREATE SEQUENCE SEQ_DFILM_ID;
CREATE SEQUENCE SEQ_BOARD_ID;
CREATE SEQUENCE SEQ_RATING_FILM_ID;
CREATE SEQUENCE SEQ_COMMENT_ID;
CREATE SEQUENCE SEQ_INQUERY_ID;
CREATE SEQUENCE SEQ_NOTICE_ID;
CREATE SEQUENCE SEQ_COLLECTION_ID;
CREATE SEQUENCE SEQ_REPORT_ID;
CREATE SEQUENCE SEQ_BLACK_ID;
CREATE SEQUENCE SEQ_ACTOR_ID;
CREATE SEQUENCE SEQ_IMAGE_ID;
CREATE SEQUENCE SEQ_FIMAGE_ID;
CREATE SEQUENCE SEQ_RATING_REVIEW_ID;
CREATE SEQUENCE SEQ_GENRE_ID;


CREATE TABLE "TB_MEMBER" (
   "ID"   NUMBER      NOT NULL,
   "IMAGE"   VARCHAR2(200)   DEFAULT 'DEFAULT IMAGE PATH'   NOT NULL,
   "EMAIL"   VARCHAR2(30)      NOT NULL,
   "PWD"   VARCHAR2(1000)      NOT NULL,
   "NICKNAME"   VARCHAR2(30)      NOT NULL,
   "STATUS"   VARCHAR2(2)   DEFAULT 'Y'   NOT NULL,
   "ENROLL_DATE"   TIMESTAMP      NOT NULL,
   "MODIFY_DATE"   TIMESTAMP      NOT NULL,
   "GOOGLE_ID"   NUMBER      NULL,
   "KAKAO_ID"   NUMBER      NULL,
  "AUTHO" NUMBER  DEFAULT 1 NOT NULL
);

CREATE TABLE "TB_REVIEW" (
   "ID"   NUMBER      NOT NULL,
   "CONTENT"   CLOB      NOT NULL,
   "INAPPROPRIATE_COUNT"   NUMBER   DEFAULT 0   NOT NULL,
   "SPOILER_COUNT"   NUMBER   DEFAULT 0   NOT NULL,
   "LIKE_COUNT"   NUMBER   DEFAULT 0   NOT NULL,
   "SPOILER_CHECK"   VARCHAR2(2)   DEFAULT 'N'   NOT NULL,
   "STATUS"   VARCHAR2(2)   DEFAULT 'Y'   NOT NULL,
   "MODIFY_DATE"   TIMESTAMP DEFAULT SYSDATE NOT NULL,
   "CREATE_DATE"   TIMESTAMP DEFAULT SYSDATE NOT NULL,
   "FILM_ID"   NUMBER      NOT NULL,
   "MEMBER_ID"   NUMBER      NOT NULL
);

CREATE TABLE "TB_LIKE" (
   "ID"   NUMBER      NOT NULL,
   "TYPE"   NUMBER      NOT NULL,
   "TARGET_ID"   NUMBER      NOT NULL,
   "USER_ID"   NUMBER      NOT NULL
);

CREATE TABLE "TB_FILM" (
   "ID"   NUMBER      NOT NULL,
   "TITLE_KOR"   VARCHAR2(100)      NULL,
   "TITLE_ENG"   VARCHAR2(100)      NULL,
   "DIRECTOR"   VARCHAR2(50)      NULL,
   "RELEASE_YEAR"   NUMBER      NOT NULL,
   "PRODUCTION_COUNTRY"   VARCHAR2(50)      NOT NULL,
   "PRODUCTION_STATUS"   VARCHAR2(30)      NOT NULL,
   "GENRE_ID"   NUMBER      NOT NULL
);

CREATE TABLE "TB_DETAIL_FILM" (
   "ID"   NUMBER      NOT NULL,
   "SYNOPSYS"   CLOB      NULL,
   "TRIVIA"   CLOB      NULL,
   "TRAILER"   VARCHAR2(200)      NULL,
   "FOOTAGE"   VARCHAR2(200)      NULL,
   "STATUS"   VARCHAR2(2)   DEFAULT 'Y'   NOT NULL,
   "INSERTDATE" DATE DEFAULT SYSDATE NOT NULL,
   "MEMBER_ID"   NUMBER      NOT NULL,
   "FILM_ID"   NUMBER      NOT NULL
);

CREATE TABLE "TB_BOARD" (
   "ID"   NUMBER      NOT NULL,
   "TITLE"   VARCHAR2(300)      NOT NULL,
   "CONTENT"   CLOB      NOT NULL,
   "VIEW_COUNT"   NUMBER   DEFAULT 0   NOT NULL,
   "INAPPROPRIATE_COUNT"   NUMBER      NULL,
   "SPOILER_COUNT"   NUMBER      NULL,
   "LIKE_COUNT"   NUMBER      NULL,
   "MODIFY_DATE"   TIMESTAMP      NOT NULL,
   "CREATE_DATE"   TIMESTAMP      NOT NULL,
   "STATUS"   VARCHAR2(2)   DEFAULT 'Y'   NOT NULL,
   "MEMBER_ID"   NUMBER      NOT NULL,
   "IMAGE_ID"   NUMBER      NOT NULL
);

CREATE TABLE "TB_RATING_FILM" (
   "ID"   NUMBER      NOT NULL,
   "STAR"   NUMBER      NULL,
   "SAW"   VARCHAR2(2)   DEFAULT 'N'   NOT NULL,
   "MEMBER_ID"   NUMBER      NOT NULL,
   "FILM_ID"   NUMBER      NOT NULL
);

CREATE TABLE "TB_COMMENT" (
   "ID"   NUMBER      NOT NULL,
   "TYPE"   NUMBER      NOT NULL,
   "CONTENT"   CLOB      NOT NULL,
   "INAPPROPRIATE_COUNT"   NUMBER   DEFAULT 0   NOT NULL,
   "SPOILER_COUNT"   NUMBER   DEFAULT 0   NOT NULL,
   "LIKE_COUNT"   NUMBER   DEFAULT 0   NOT NULL,
   "CREATE_DATE"   TIMESTAMP      NOT NULL,
   "MODIFY_DATE"   TIMESTAMP      NOT NULL,
   "STATUS"   VARCHAR2(2)   DEFAULT 'Y'   NOT NULL,
   "LEVEL"   NUMBER   DEFAULT 0   NOT NULL,
   "MEMBER_ID"   NUMBER      NULL,
   "BOARD_ID"   NUMBER      NULL,
   "REVIEW_ID"   NUMBER      NULL
);

CREATE TABLE "TB_INQUIRY" (
   "ID"   NUMBER      NOT NULL,
   "TYPE"   NUMBER      NOT NULL,
   "CONTENT"   CLOB      NOT NULL,
   "CREATE_DATE"   TIMESTAMP      NOT NULL,
   "STATUS"   VARCHAR2(2)   DEFAULT 'Y'   NOT NULL,
   "USER_ID"   NUMBER      NOT NULL,
   "ANSWER"   CLOB      NULL,
   "ANSWER_DATE"   TIMESTAMP      NULL,
   "ADMIN_ID"   NUMBER      NOT NULL
);

CREATE TABLE "TB_NOTICE" (
   "ID"   NUMBER      NOT NULL,
   "TITLE"   VARCHAR2(100)      NOT NULL,
   "CONTENT"   CLOB      NOT NULL,
   "VIEW_COUNT"   NUMBER   DEFAULT 0   NOT NULL,
   "CREATE_DATE"   TIMESTAMP      NOT NULL,
   "MODIFY_DATE"   TIMESTAMP      NOT NULL,
   "IMAGE_ID"   NUMBER      NOT NULL,
   "ADMIN_ID"   NUMBER      NOT NULL
);

CREATE TABLE "TB_COLLECTION" (
   "ID"   NUMBER      NOT NULL,
   "TITLE"   VARCHAR2(100)      NOT NULL,
   "CONTENT"   CLOB      NULL,
   "LIKE_COUNT"   NUMBER   DEFAULT 0   NOT NULL,
   "INAPPROPRIATE_COUNT"   NUMBER   DEFAULT 0   NOT NULL,
   "SPOILER_COUNT"   NUMBER   DEFAULT 0   NOT NULL,
   "CREATE_DATE"   TIMESTAMP      NOT NULL,
   "MODIFY_DATE"   TIMESTAMP      NOT NULL,
   "STATUS"   VARCHAR2(2)   DEFAULT 'Y'   NOT NULL,
   "PRIVATE"   VARCHAR2(2)   DEFAULT 'N'   NOT NULL,
   "MEMBER_ID"   NUMBER      NOT NULL
);

CREATE TABLE "TB_FILM_COLLECTION" (
   "COLLECTION_ID"   NUMBER      NOT NULL,
   "FILM_ID"   NUMBER      NOT NULL
);

CREATE TABLE "TB_REPORT" (
   "ID"   NUMBER      NOT NULL,
   "TYPE"   NUMBER      NOT NULL,
   "TARGET_ID"   NUMBER      NOT NULL,
   "CONTENT"   NUMBER      NOT NULL,
   "REPORT_ID"   NUMBER      NOT NULL,
   "REPORTED_ID"   NUMBER      NOT NULL
);

CREATE TABLE "TB_BLACK_MEMBER" (
   "ID"   NUMBER      NOT NULL,
   "BLACKDATE"   TIMESTAMP   DEFAULT SYSDATE   NOT NULL,
   "TARGET_ID"   NUMBER      NOT NULL
);

CREATE TABLE "TB_ACTOR" (
   "ID"   NUMBER      NOT NULL,
   "NAME"   VARCHAR2(50)      NOT NULL,
   "PROFILE_IMG"   VARCHAR2(300)      NOT NULL
);

CREATE TABLE "TB_IMAGE" (
   "ID"   NUMBER      NOT NULL,
   "PATH"   VARCHAR2(1000)      NOT NULL,
   "ORIGINAL_NAME"   VARCHAR2(1000)      NOT NULL,
   "CHANGE_NAME"   VARCHAR2(1000)      NOT NULL,
   "TYPE"   NUMBER      NOT NULL
);

CREATE TABLE "TB_FILM_IMAGE" (
   "ID"   NUMBER      NOT NULL,
   "TYPE"   NUMBER      NOT NULL,
   "CHANGE_NAME"   VARCHAR2(1000) DEFAULT 'podoposter.jpg'      NOT NULL,
   "DFILM_ID"   NUMBER      NOT NULL
);

CREATE TABLE "TB_FILM_ACTOR" (
   "ACTOR_ID"   NUMBER      NOT NULL,
   "DFILM_ID"   NUMBER      NOT NULL
);

CREATE TABLE "TB_RATING_REVIEW" (
   "ID"   NUMBER      NOT NULL,
   "RATING_SOUND"   NUMBER      NOT NULL,
   "RATING_VISUAL"   NUMBER      NOT NULL,
   "RATING_ACTING"   NUMBER      NOT NULL,
   "RATING_POP"   NUMBER      NOT NULL,
   "RATING_SCRIPT"   NUMBER      NOT NULL,
   "RATING_DIRECT"   NUMBER      NOT NULL,
   "REVIEW_ID"   NUMBER      NOT NULL,
   "MEMBER_ID"   NUMBER      NOT NULL
);

CREATE TABLE "TB_GENRE" (
   "ID"   NUMBER      NOT NULL,
   "NAME"   VARCHAR2(30)      NOT NULL
);

ALTER TABLE "TB_MEMBER" ADD CONSTRAINT "PK_TB_MEMBER" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_REVIEW" ADD CONSTRAINT "PK_TB_REVIEW" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_LIKE" ADD CONSTRAINT "PK_TB_LIKE" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_FILM" ADD CONSTRAINT "PK_TB_FILM" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_DETAIL_FILM" ADD CONSTRAINT "PK_TB_DETAIL_FILM" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_BOARD" ADD CONSTRAINT "PK_TB_BOARD" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_RATING_FILM" ADD CONSTRAINT "PK_TB_RATING_FILM" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_COMMENT" ADD CONSTRAINT "PK_TB_COMMENT" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_INQUIRY" ADD CONSTRAINT "PK_TB_INQUIRY" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_NOTICE" ADD CONSTRAINT "PK_TB_NOTICE" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_COLLECTION" ADD CONSTRAINT "PK_TB_COLLECTION" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_FILM_COLLECTION" ADD CONSTRAINT "PK_TB_FILM_COLLECTION" PRIMARY KEY (
   "COLLECTION_ID",
   "FILM_ID"
);

ALTER TABLE "TB_REPORT" ADD CONSTRAINT "PK_TB_REPORT" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_BLACK_MEMBER" ADD CONSTRAINT "PK_TB_BLACK_MEMBER" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_ACTOR" ADD CONSTRAINT "PK_TB_ACTOR" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_IMAGE" ADD CONSTRAINT "PK_TB_IMAGE" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_FILM_IMAGE" ADD CONSTRAINT "PK_TB_FILM_IMAGE" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_FILM_ACTOR" ADD CONSTRAINT "PK_TB_FILM_ACTOR" PRIMARY KEY (
   "ACTOR_ID",
   "DFILM_ID"
);

ALTER TABLE "TB_RATING_REVIEW" ADD CONSTRAINT "PK_TB_RATING_REVIEW" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_GENRE" ADD CONSTRAINT "PK_TB_GENRE" PRIMARY KEY (
   "ID"
);

ALTER TABLE "TB_FILM_COLLECTION" ADD CONSTRAINT "FK_FILM_COLLECTION_C" FOREIGN KEY (
   "COLLECTION_ID"
)
REFERENCES "TB_COLLECTION" (
   "ID"
);

ALTER TABLE "TB_FILM_COLLECTION" ADD CONSTRAINT "FK_FILM_COLLECTION_F" FOREIGN KEY (
   "FILM_ID"
)
REFERENCES "TB_FILM" (
   "ID"
);

ALTER TABLE "TB_FILM_ACTOR" ADD CONSTRAINT "FK_FILM_ACTOR_A" FOREIGN KEY (
   "ACTOR_ID"
)
REFERENCES "TB_ACTOR" (
   "ID"
);

ALTER TABLE "TB_FILM_ACTOR" ADD CONSTRAINT "FK_FILM_ACTOR_D" FOREIGN KEY (
   "DFILM_ID"
)
REFERENCES "TB_DETAIL_FILM" (
   "ID"
);

ALTER TABLE "TB_FILM" ADD CONSTRAINT "FK_FILM_GENRE" FOREIGN KEY (
   "GENRE_ID"
)
REFERENCES "TB_GENRE" (
   "ID"
);


-- �帣
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '���');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '�׼�');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '��ť���͸�');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '������');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '�̽��͸�');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '����');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '����');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '������');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '�θǽ�');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, 'SF');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '��Ÿ��');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '����');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '�ڹ̵�');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '����');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '���α�');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '�ִϸ��̼�');
INSERT INTO TB_GENRE VALUES(SEQ_GENRE_ID.NEXTVAL, '����');

-- ��ȭ
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '���ʰ��� �׳�', 'A Little Princess', '���ι�', 2019, '�ѱ�', '��������', 1);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '�ȳ� ���ϸ�', 'A Dog'||CHR(39)||'s Journey', '���� ������', 2019, '�̱�', '����', 14);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '�����', 'PARASITE', '����ȣ', 2019, '�ѱ�', '����', 1);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '��Ŀ', 'JOKER', '��� �ʸ���', 2019, '�̱�', '����', 1);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '������ �߷�', 'Gravity of the Tea', '������', 2018, '�ѱ�', '��������', 3);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '�����: ���Ǵ�Ƽ ��', 'Avengers: Infinity War', '�ȼҴ� ���,�� ���', 2018, '�̱�', '����', 11);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, 'ī�޶� ���߸� �� ��!', 'One Cut of the Dead', '�쿡�� ����ġ��', 2017, '�Ϻ�', '����', 13);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '�� ��° ����', 'The Third Murder', '�������� ����ī��', 2017, '�Ϻ�', '����', 4);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '�ʴ� ���⿡ ������', 'You Were Never Really Here', '�� ����', 2017, '�̱�', '����', 1);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '��󷣵�', 'La La Land', '���̹̾� ����', 2016, '�̱�', '����', 8);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '���� �̸���.', 'your name.', '��ī�� ������', 2016, '�Ϻ�', '����', 16);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '���ξ�', 'The Mermaid', '�ּ�ġ', 2016, '�߱�', '����', 13);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '�� ��ġ', 'The Witch', '�ι�Ʈ ���Ž�', 2015, '�̱�', '����', 7);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '5���� ����', 'Coming Home', '�忹��', 2014, '�߱�', '����', 9);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '�׷��� �δ��佺Ʈ ȣ��', 'The Grand Budapest Hotel', '���� �ش���', 2014, '�̱�', '����', 5);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '����Ʈ ũ�ѷ�', 'Nightcrawler', '�� �����', 2014, '�̱�', '����', 6);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '�ŵ� �ƽ�: �г��� ����', 'Mad Max: Fury Road', '���� �з�', 2015, '�̱�', '����', 2);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '�׳�', 'Her', '������ũ ����', 2013, '�̱�', '����', 9);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '�� �� ���� ���� ����', 'Call Me by Your Name', '��ī ���ƴٴϳ�', 2017, '�̱�', '����', 9);
INSERT INTO TB_FILM
VALUES(SEQ_FILM_ID.NEXTVAL, '�̵峪�� �� �ĸ�', 'Midnight In Paris', '��� �ٷ�', 2011, '�̱�', '����', 13);

-- ���
INSERT INTO TB_MEMBER
VALUES(SEQ_MEMBER_ID.NEXTVAL, DEFAULT, 'admin01@gmail.com', 'admin01', '������01', DEFAULT, SYSDATE, SYSDATE, DEFAULT, DEFAULT, 2);
INSERT INTO TB_MEMBER
VALUES(SEQ_MEMBER_ID.NEXTVAL, DEFAULT, 'admin02@gmail.com', 'admin02', '������02', DEFAULT, SYSDATE, SYSDATE, DEFAULT, DEFAULT, 2);
INSERT INTO TB_MEMBER
VALUES(SEQ_MEMBER_ID.NEXTVAL, DEFAULT, 'user01@naver.com', 'user01', '�����01', DEFAULT, SYSDATE, SYSDATE, DEFAULT, DEFAULT, 1);
INSERT INTO TB_MEMBER
VALUES(SEQ_MEMBER_ID.NEXTVAL, DEFAULT, 'user02@naver.com', 'user02', '�����01', DEFAULT, SYSDATE, SYSDATE, DEFAULT, DEFAULT, 1);
INSERT INTO TB_MEMBER
VALUES(SEQ_MEMBER_ID.NEXTVAL, DEFAULT, 'user03@naver.com', 'user03', '�����01', DEFAULT, SYSDATE, SYSDATE, DEFAULT, DEFAULT, 1);
INSERT INTO TB_MEMBER
VALUES(SEQ_MEMBER_ID.NEXTVAL, DEFAULT, 'user04@naver.com', 'user04', '�����01', DEFAULT, SYSDATE, SYSDATE, DEFAULT, DEFAULT, 1);
INSERT INTO TB_MEMBER
VALUES(SEQ_MEMBER_ID.NEXTVAL, DEFAULT, 'user05@naver.com', 'user05', '�����01', DEFAULT, SYSDATE, SYSDATE, DEFAULT, DEFAULT, 1);
INSERT INTO TB_MEMBER
VALUES(SEQ_MEMBER_ID.NEXTVAL, DEFAULT, 'test@test.test', '$2a$10$Qniqrgu.rkuttWzD7Opn3e/HF.UbcwGEenI2jOANJYIyLd0J7qmW.', 'test', DEFAULT, SYSDATE, SYSDATE, DEFAULT, DEFAULT, 1);

-- ���
INSERT INTO TB_ACTOR
VALUES(SEQ_ACTOR_ID.NEXTVAL, 'ȣ��Ų �Ǵн�', 'NULL');

-- ��ȭ ������
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '�̰��� �ó�ý�', '�̰��� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 21, 4);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '���ʰ����׳� �ó�ý�', '���ʰ����׳� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 1);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '�ȳ纣�ϸ� �ó�ý�', '�ȳ纣�ϸ� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 2);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '����� �ó�ý�', '����� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 3);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '�������߷� �ó�ý�', '�������߷� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 5);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '�����:���Ǵ�Ƽ�� �ó�ý�', '�����:���Ǵ�Ƽ�� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 6);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, 'ī�޶� ���߸� �ȵ� �ó�ý�', 'ī�޶� ���߸�ȵ� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 7);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '����°���� �ó�ý�', '����°���� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 8);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '�ʴ¿��⿡������ �ó�ý�', '�ʴ¿��⿡������ Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 9);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '��󷣵� �ó�ý�', '��󷣵� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 10);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '�����̸��� �ó�ý�', '�����̸��� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 11);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '���ξ� �ó�ý�', '���ξ� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 12);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '����ġ �ó�ý�', '����ġ Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 13);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '5���Ǹ��� �ó�ý�', '5���Ǹ��� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 14);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '�׷���δ��佺Ʈȣ�� �ó�ý�', '�׷���δ��佺Ʈȣ�� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 15);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '����Ʈũ�ѷ� �ó�ý�', '����Ʈũ�ѷ� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 16);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '�ŵ�ƽ� �ó�ý�', '�ŵ�ƽ� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 17);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '�׳� �ó�ý�', '�׳� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 18);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '�ݹ̹���������� �ó�ý�', '�ݹ̹���������� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 19);
INSERT INTO TB_DETAIL_FILM
VALUES(SEQ_DFILM_ID.NEXTVAL, '�̵峪�����ĸ� �ó�ý�', '�̵峪�����ĸ� Ʈ�����', 'https://www.youtube.com/watch?v=x60mB0zXZ38', null, DEFAULT, DEFAULT, 1, 20);




-- ��ȭ������ <->  ���
INSERT INTO TB_FILM_ACTOR
VALUES(1,1);

-- ��ȭ ������ ����
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, 'joker.jpg', 1);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '���ʰ����׳�.jpg', 2);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '�ȳ纣�ϸ�.jpg', 3);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '�����.jpg', 4);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '�������߷�.jpg', 5);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '��������Ǵ�Ƽ��.jpg', 6);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, 'ī�޶󸦸��߸�ȵ�.jpg', 7);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '����°����.jpg', 8);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '�ʴ¿��⿡������.jpg', 9);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '��󷣵�.jpg', 10);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '�����̸���.jpg', 11);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '���ξ�.jpg', 12);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '����ġ.jpg', 13);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '5���Ǹ���.jpg', 14);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '�׷���δ��佺Ʈȣ��.jpg', 15);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '����Ʈũ�ѷ�.jpg', 16);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '�ŵ�ƽ�.jpg', 17);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '�׳�.jpg', 18);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '�ݹ̹����������.jpg', 19);
INSERT INTO TB_FILM_IMAGE
VALUES(SEQ_FIMAGE_ID.NEXTVAL, 1, '�̵峪�����ĸ�.jpg', 20);


-- ����
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '���䳻�� 1', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default ,2, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '���� ���� 2', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 1, 2);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '���� ���� 03', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 4, 1);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '��� ���� 04', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 5, 5);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '���� ���� 05', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 6, 6);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '�̰��� ���� ���� 06', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 2, 8);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '�̰��� ���� ���� 07', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 3, 6);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '�̰��� ���� ���� 08', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 4, 4);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '�̰��� ���� ���� 09', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 2, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '�̰��� ���� ���� 10', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 3, 2);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '�̰��� ���� ���� 11', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 4, 1);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '�̰��� ���� ���� 12', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 2, 2);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '�̰��� ���� ���� 13', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 6, 3);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '�̰��� ���� ���� 14', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 7, 4);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '�̰��� ���� ���� 15', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 8, 5);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '�̰��� ���� ���� 16', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 9, 6);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '�̰��� ���� ���� 17', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 10, 7);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '�̰��� ���� ���� 18', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 2, 8);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '�̰��� ���� ���� 19', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default ,3, 1);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '�̰��� ���� ���� 20', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 4, 2);
INSERT INTO TB_REVIEW
VALUES(SEQ_REVIEW_ID.NEXTVAL, '���䳻���̹ٲ����մϴ�.', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, default , default , 4, 9);


-- ���� ����
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,1,2,3,4,5,6,1,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,1,2,3,4,5,6,2,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,5,5,5,5,6,3,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,4,4,3,4,5,6,4,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,3,4,5,4,5,6,5,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,6,5,3,4,5,6,6,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,6,4,3,4,5,6,7,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,1,5,4,4,5,6,8,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,9,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,10,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,11,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,12,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,13,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,14,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,15,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,16,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,17,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,18,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,19,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,20,1);
INSERT INTO TB_RATING_REVIEW
VALUES (SEQ_RATING_REVIEW_ID.NEXTVAL,5,1,2,3,5,6,21,9);

-- ��ȭ ����
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 3, 1);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 3, 2);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 3, 3);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 3, 4);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 3, 5);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 3, 6);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 3, 7);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 3, 8);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 3, 9);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 3, 10);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 3, 11);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 3, 12);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 3, 13);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 3, 14);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 3, 15);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 3, 16);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 3, 17);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 3, 18);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 3, 19);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 3, 20);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 4, 1);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 4, 3);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 4, 5);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 4, 7);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 4, 9);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 4, 11);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 4, 13);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 4, 15);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 4, 17);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 4, 19);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 4, 2);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 4, 4);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 4, 6);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 4, 8);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 4, 10);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 4, 12);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 4, 14);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 4, 16);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 4, 18);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 4, 20);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 5, 2);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 5, 4);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 5, 6);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 5, 8);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 5, 10);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 5, 12);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 5, 14);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 5, 16);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 5, 18);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 5, 20);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 5, 1);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 5, 3);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 5, 5);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 5, 7);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 5, 9);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 5, 11);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 5, 13);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 5, 15);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 5, 17);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 5, 19);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 6, 1);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 6, 4);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 6, 7);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 6, 10);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 6, 13);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 6, 16);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 6, 19);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 7, 4);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 7, 10);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 7, 12);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 7, 14);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 7, 16);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 7, 18);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 7, 20);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 7, 2);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 7, 6);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 7, 8);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 8, 20);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 8, 19);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 8, 18);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 8, 17);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 8, 16);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 8, 15);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 8, 14);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 8, 13);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 8, 12);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 5, 'Y', 8, 11);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 8, 10);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 8, 9);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 8, 8);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 8, 7);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 8, 6);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 2, 'Y', 8, 5);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 1, 'Y', 8, 4);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 8, 3);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 3, 'Y', 8, 2);
INSERT INTO TB_RATING_FILM (ID, STAR, SAW, MEMBER_ID, FILM_ID) 
VALUES (SEQ_RATING_FILM_ID.NEXTVAL, 4, 'Y', 8, 1);

DROP VIEW VI_FILM_AVG_STAR;
-- ��ȭ�� ��� ���� ��ȸ VIEW
CREATE OR REPLACE VIEW VI_FILM_AVG_STAR
AS SELECT R.*, FF.GENRE_ID, FF.RELEASE_YEAR, G.NAME AS NAME, FI.CHANGE_NAME
   FROM (SELECT F.ID AS FILM_ID, F.TITLE_KOR AS TITLE_KOR, ROUND(AVG(STAR), 1) AS AVG_STAR
        FROM TB_RATING_FILM RT
        JOIN TB_FILM F ON (RT.FILM_ID = F.ID)
        GROUP BY F.ID, F.TITLE_KOR) R
   JOIN TB_FILM FF ON (FILM_ID = FF.ID)
   JOIN TB_GENRE G ON (FF.GENRE_ID = G.ID)
   JOIN TB_DETAIL_FILM DF ON (FF.ID = DF.FILM_ID)
   JOIN TB_FILM_IMAGE FI ON (DF.ID = FI.DFILM_ID);

COMMIT;