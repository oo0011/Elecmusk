DROP INDEX PK_MEMBER;

/* 회원 */
DROP TABLE MEMBER 
  CASCADE CONSTRAINTS;

/* 회원 */
CREATE TABLE MEMBER (
  MEMBER_SEQ NUMBER NOT NULL, /* 회원순번 */
  ID VARCHAR2(20) NOT NULL, /* 아이디 */
  NICKNAME VARCHAR2(20) NOT NULL, /* 닉네임 */
  PASSWORD VARCHAR2(20) NOT NULL, /* 비밀번호 */
  NAME VARCHAR2(10), /* 이름 */
  BIRTH DATE, /* 생년월일 */
  EMAIL VARCHAR2(100), /* 이메일 */
  BACKUP_QUESTION VARCHAR2(100), /* 복구용질문 */
  BACKUP_ANSWER VARCHAR2(100), /* 복구용답변 */
  POINT NUMBER, /* 등급용포인트 */
  JOIN_DATE DATE, /* 가입일 */
  STATUS NUMBER(1) /* 상태(회원/비활성화회원/관리자) */
);

COMMENT ON TABLE MEMBER IS '회원';

COMMENT ON COLUMN MEMBER.MEMBER_SEQ IS '회원순번';

COMMENT ON COLUMN MEMBER.ID IS '아이디';

COMMENT ON COLUMN MEMBER.NICKNAME IS '닉네임';

COMMENT ON COLUMN MEMBER.PASSWORD IS '비밀번호';

COMMENT ON COLUMN MEMBER.NAME IS '이름';

COMMENT ON COLUMN MEMBER.BIRTH IS '생년월일';

COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';

COMMENT ON COLUMN MEMBER.BACKUP_QUESTION IS '복구용질문';

COMMENT ON COLUMN MEMBER.BACKUP_ANSWER IS '복구용답변';

COMMENT ON COLUMN MEMBER.POINT IS '등급용포인트';

COMMENT ON COLUMN MEMBER.JOIN_DATE IS '가입일';

COMMENT ON COLUMN MEMBER.STATUS IS '상태(회원/비활성화회원/관리자)';

CREATE UNIQUE INDEX PK_MEMBER
  ON MEMBER (
    MEMBER_SEQ ASC
  );

ALTER TABLE MEMBER
  ADD
    CONSTRAINT PK_MEMBER
    PRIMARY KEY (
      MEMBER_SEQ
    );
    
--------MEMBER--------------

DROP INDEX PK_BOARD;

/* 게시판 */
DROP TABLE BOARD 
  CASCADE CONSTRAINTS;

/* 게시판 */
CREATE TABLE BOARD (
  BD_SEQ NUMBER(10) NOT NULL, /* 게시판순번 */
  NICKNAME VARCHAR2(20), /* 닉네임 */
  CATEGORY NUMBER(1) NOT NULL, /* 카테고리 */
  TITLE VARCHAR2(100) NOT NULL, /* 제목 */
  CONTENTS CLOB NOT NULL, /* 내용 */
  READ_CNT NUMBER(10), /* 조회수 */
  RECOMMENDATION NUMBER(10), /* 추천수 */
  CSNM VARCHAR2(200), /* 충전소명칭 */
  REG_DT DATE, /* 등록일 */
  REG_ID VARCHAR2(20), /* 등록자(아이디) */
  MOD_DT DATE, /* 수정일 */
  MOD_ID VARCHAR2(20) /* 수정자 */
);

COMMENT ON TABLE BOARD IS '게시판';

COMMENT ON COLUMN BOARD.BD_SEQ IS '게시판순번';

COMMENT ON COLUMN BOARD.NICKNAME IS '닉네임';

COMMENT ON COLUMN BOARD.CATEGORY IS '카테고리';

COMMENT ON COLUMN BOARD.TITLE IS '제목';

COMMENT ON COLUMN BOARD.CONTENTS IS '내용';

COMMENT ON COLUMN BOARD.READ_CNT IS '조회수';

COMMENT ON COLUMN BOARD.RECOMMENDATION IS '추천수';

COMMENT ON COLUMN BOARD.CSNM IS '충전소명칭';

COMMENT ON COLUMN BOARD.REG_DT IS '등록일';

COMMENT ON COLUMN BOARD.REG_ID IS '등록자(아이디)';

COMMENT ON COLUMN BOARD.MOD_DT IS '수정일';

COMMENT ON COLUMN BOARD.MOD_ID IS '수정자';

CREATE UNIQUE INDEX PK_BOARD
  ON BOARD (
    BD_SEQ ASC
  );

ALTER TABLE BOARD
  ADD
    CONSTRAINT PK_BOARD
    PRIMARY KEY (
      BD_SEQ
    );
    
--------BOARD--------------

DROP INDEX PK_BD_COMMENT;

/* 댓글 */
DROP TABLE BD_COMMENT 
  CASCADE CONSTRAINTS;

/* 댓글 */
CREATE TABLE BD_COMMENT (
  CM_SEQ NUMBER(10) NOT NULL, /* 댓글순번 */
  BD_SEQ NUMBER(10) NOT NULL, /* 게시판순번 */
  CONTENTS CLOB, /* 내용 */
  REG_DT DATE /* 등록일 */
);

COMMENT ON TABLE BD_COMMENT IS '댓글';

COMMENT ON COLUMN BD_COMMENT.CM_SEQ IS '댓글순번';

COMMENT ON COLUMN BD_COMMENT.BD_SEQ IS '게시판순번';

COMMENT ON COLUMN BD_COMMENT.CONTENTS IS '내용';

COMMENT ON COLUMN BD_COMMENT.REG_DT IS '등록일';

CREATE UNIQUE INDEX PK_BD_COMMENT
  ON BD_COMMENT (
    CM_SEQ ASC
  );

ALTER TABLE BD_COMMENT
  ADD
    CONSTRAINT PK_BD_COMMENT
    PRIMARY KEY (
      CM_SEQ
    );

ALTER TABLE BD_COMMENT
  ADD
    CONSTRAINT FK_BOARD_TO_BD_COMMENT
    FOREIGN KEY (
      BD_SEQ
    )
    REFERENCES BOARD (
      BD_SEQ
    );
    
--------COMMENT--------------

DROP INDEX PK_CMN_CODE;

/* 공통코드 */
DROP TABLE CMN_CODE 
  CASCADE CONSTRAINTS;

/* 공통코드 */
CREATE TABLE CMN_CODE (
  MST_CODE VARCHAR2(30) NOT NULL, /* 마스터 코드 */
  DET_CODE VARCHAR2(30) NOT NULL, /* 디테일 코드 */
  MST_NAME VARCHAR2(50 CHAR), /* 마스터명 */
  DET_NAME VARCHAR2(50 CHAR), /* 디테일명 */
  SEQ NUMBER(5), /* 순서 */
  USE_YN CHAR(1 BYTE) DEFAULT '1', /* 사용여부 */
  REG_DT DATE DEFAULT SYSDATE, /* 등록일 */
  REG_ID VARCHAR2(20), /* 등록자 */
  MOD_DT DATE DEFAULT SYSDATE, /* 수정일 */
  MOD_ID VARCHAR2(20) /* 수정자 */
);

COMMENT ON TABLE CMN_CODE IS '공통코드';

COMMENT ON COLUMN CMN_CODE.MST_CODE IS '마스터 코드';

COMMENT ON COLUMN CMN_CODE.DET_CODE IS '디테일 코드';

COMMENT ON COLUMN CMN_CODE.MST_NAME IS '마스터명';

COMMENT ON COLUMN CMN_CODE.DET_NAME IS '디테일명';

COMMENT ON COLUMN CMN_CODE.SEQ IS '순서';

COMMENT ON COLUMN CMN_CODE.USE_YN IS '사용여부';

COMMENT ON COLUMN CMN_CODE.REG_DT IS '등록일';

COMMENT ON COLUMN CMN_CODE.REG_ID IS '등록자';

COMMENT ON COLUMN CMN_CODE.MOD_DT IS '수정일';

COMMENT ON COLUMN CMN_CODE.MOD_ID IS '수정자';

CREATE UNIQUE INDEX PK_CMN_CODE
  ON CMN_CODE (
    MST_CODE ASC,
    DET_CODE ASC
  );

ALTER TABLE CMN_CODE
  ADD
    CONSTRAINT PK_CMN_CODE
    PRIMARY KEY (
      MST_CODE,
      DET_CODE
    );
    
--------CMN_CODE--------------

DROP INDEX PK_EVCAR;

/* 자동차 */
DROP TABLE EVCAR 
  CASCADE CONSTRAINTS;

/* 자동차 */
CREATE TABLE EVCAR (
  CAR_NO NUMBER(5) NOT NULL, /* 자동차순번 */
  NAME VARCHAR2(200) NOT NULL, /* 자동차명 */
  IMAGE VARCHAR2(500), /* 사진URL */
  PRICE VARCHAR2(30) NOT NULL, /* 가격(만원) */
  MANUFACTURE VARCHAR2(100) NOT NULL, /* 제조사 */
  PRODUCT_YEAR NUMBER(5), /* 연식 */
  APPEARANCE VARCHAR2(20), /* 외형 */
  MODEL VARCHAR2(20), /* 차종 */
  MAX_DISTANCE VARCHAR2(30), /* 최대주행거리 */
  BATTERY_TYPE VARCHAR2(30), /* 배터리종류 */
  BATTERY_CAPACITY VARCHAR2(30), /* 배터리용량 */
  MAX_SPEED NUMBER(5), /* 최고속도 */
  OUTPUT VARCHAR2(30) /* 출력 */
);

COMMENT ON TABLE EVCAR IS '자동차';

COMMENT ON COLUMN EVCAR.CAR_NO IS '자동차순번';

COMMENT ON COLUMN EVCAR.NAME IS '자동차명';

COMMENT ON COLUMN EVCAR.IMAGE IS '사진URL';

COMMENT ON COLUMN EVCAR.PRICE IS '가격(만원)';

COMMENT ON COLUMN EVCAR.MANUFACTURE IS '제조사';

COMMENT ON COLUMN EVCAR.PRODUCT_YEAR IS '연식';

COMMENT ON COLUMN EVCAR.APPEARANCE IS '외형';

COMMENT ON COLUMN EVCAR.MODEL IS '차종';

COMMENT ON COLUMN EVCAR.MAX_DISTANCE IS '최대주행거리';

COMMENT ON COLUMN EVCAR.BATTERY_TYPE IS '배터리종류';

COMMENT ON COLUMN EVCAR.BATTERY_CAPACITY IS '배터리용량';

COMMENT ON COLUMN EVCAR.MAX_SPEED IS '최고속도';

COMMENT ON COLUMN EVCAR.OUTPUT IS '출력';

CREATE UNIQUE INDEX PK_EVCAR
  ON EVCAR (
    CAR_NO ASC
  );

ALTER TABLE EVCAR
  ADD
    CONSTRAINT PK_EVCAR
    PRIMARY KEY (
      CAR_NO
    );
    
--------EVCAR--------------

DROP INDEX PK_SUBSIDY;

/* 보조금 */
DROP TABLE SUBSIDY 
  CASCADE CONSTRAINTS;

/* 보조금 */
CREATE TABLE SUBSIDY (
  SUBSIDY_SEQ NUMBER(10) NOT NULL, /* 보조금순번 */
  NAME VARCHAR2(200) NOT NULL, /* 자동차명 */
  MODEL VARCHAR2(20), /* 차종(소형,중형,대형) */
  SUBSIDY NUMBER(6) NOT NULL, /* 보조금 */
  MANUFACTURER VARCHAR2(100), /* 제조사 */
  MADEBY VARCHAR2(20) /* 생산지 */
);

COMMENT ON TABLE SUBSIDY IS '보조금';

COMMENT ON COLUMN SUBSIDY.SUBSIDY_SEQ IS '보조금순번';

COMMENT ON COLUMN SUBSIDY.NAME IS '자동차명';

COMMENT ON COLUMN SUBSIDY.MODEL IS '차종(소형,중형,대형)';

COMMENT ON COLUMN SUBSIDY.SUBSIDY IS '보조금';

COMMENT ON COLUMN SUBSIDY.MANUFACTURER IS '제조사';

COMMENT ON COLUMN SUBSIDY.MADEBY IS '생산지';

CREATE UNIQUE INDEX PK_SUBSIDY
  ON SUBSIDY (
    SUBSIDY_SEQ ASC
  );

ALTER TABLE SUBSIDY
  ADD
    CONSTRAINT PK_SUBSIDY
    PRIMARY KEY (
      SUBSIDY_SEQ
    );
    
CREATE SEQUENCE  "SUBSIDY_SEQ"  
 MINVALUE 1 
 MAXVALUE 99999999
 INCREMENT BY 1 
 START WITH 1 
 CACHE 20 
 NOORDER  
 NOCYCLE  
 NOKEEP  
 NOSCALE  
 GLOBAL ;
    
--------SUBSIDY--------------

DROP INDEX PK_CHARGER;

/* 충전기 */
DROP TABLE CHARGER 
  CASCADE CONSTRAINTS;

/* 충전기 */
CREATE TABLE CHARGER (
  CHARGER_NO NUMBER(5) NOT NULL, /* 충전기순번 */
  CONNECTOR VARCHAR2(50) NOT NULL, /* 충전기명 */
  IMAGE VARCHAR2(500), /* 사진URL */
  EV_CURRENT VARCHAR2(50), /* 충전전류 */
  EV_VOLTAGE VARCHAR2(50), /* 충전전압 */
  EV_POWER VARCHAR2(50), /* 충전전력 */
  EV_LEVEL VARCHAR2(50), /* 충전레벨 */
  EV_SUPPORT VARCHAR2(100) /* 지원차량 */
);

COMMENT ON TABLE CHARGER IS '충전기';

COMMENT ON COLUMN CHARGER.CHARGER_NO IS '충전기순번';

COMMENT ON COLUMN CHARGER.CONNECTOR IS '충전기명';

COMMENT ON COLUMN CHARGER.IMAGE IS '사진URL';

COMMENT ON COLUMN CHARGER.EV_CURRENT IS '충전전류';

COMMENT ON COLUMN CHARGER.EV_VOLTAGE IS '충전전압';

COMMENT ON COLUMN CHARGER.EV_POWER IS '충전전력';

COMMENT ON COLUMN CHARGER.EV_LEVEL IS '충전레벨';

COMMENT ON COLUMN CHARGER.EV_SUPPORT IS '지원차량';

CREATE UNIQUE INDEX PK_CHARGER
  ON CHARGER (
    CHARGER_NO ASC
  );

ALTER TABLE CHARGER
  ADD
    CONSTRAINT PK_CHARGER
    PRIMARY KEY (
      CHARGER_NO
    );
    
--------CHARGER--------------

DROP INDEX PK_CHARGING_FEE;

/* 충전요금 */
DROP TABLE CHARGING_FEE 
  CASCADE CONSTRAINTS;

/* 충전요금 */
CREATE TABLE CHARGING_FEE (
  PROVIDER_NO NUMBER(5) NOT NULL, /* 사업자순번 */
  IMAGE VARCHAR2(500), /* 사진URL */
  ENTERPRENUER VARCHAR2(50) NOT NULL, /* 사업자명 */
  RAPID_BELOW100 NUMBER(6,2), /* 급속100kW미만 */
  RAPID_ABOVE100 NUMBER(6,2), /* 급속100kW이상 */
  SLOW_FEE NUMBER(6,2) /* 완속충전요금 */
);

COMMENT ON TABLE CHARGING_FEE IS '충전요금';

COMMENT ON COLUMN CHARGING_FEE.PROVIDER_NO IS '사업자순번';

COMMENT ON COLUMN CHARGING_FEE.IMAGE IS '사진URL';

COMMENT ON COLUMN CHARGING_FEE.ENTERPRENUER IS '사업자명';

COMMENT ON COLUMN CHARGING_FEE.RAPID_BELOW100 IS '급속100kW미만';

COMMENT ON COLUMN CHARGING_FEE.RAPID_ABOVE100 IS '급속100kW이상';

COMMENT ON COLUMN CHARGING_FEE.SLOW_FEE IS '완속충전요금';

CREATE UNIQUE INDEX PK_CHARGING_FEE
  ON CHARGING_FEE (
    PROVIDER_NO ASC
  );

ALTER TABLE CHARGING_FEE
  ADD
    CONSTRAINT PK_CHARGING_FEE
    PRIMARY KEY (
      PROVIDER_NO
    );
    
--------CHARGING_FEE--------------

DROP INDEX PK_REGIONAL_COUNT;

/* 지역별현황정보 */
DROP TABLE REGIONAL_COUNT 
  CASCADE CONSTRAINTS;

/* 지역별현황정보 */
CREATE TABLE REGIONAL_COUNT (
  STANDARD_DATE VARCHAR2(50) NOT NULL, /* 기준일 */
  GANGWON NUMBER(10), /* 강원 */
  GYEONGGI NUMBER(10), /* 경기 */
  GYEONGNAM NUMBER(10), /* 경남 */
  GYEONGBUK NUMBER(10), /* 경북 */
  GWANGJU NUMBER(10), /* 광주 */
  DAEGU NUMBER(10), /* 대구 */
  DAEJEON NUMBER(10), /* 대전 */
  BUSAN NUMBER(10), /* 부산 */
  SEOUL NUMBER(10), /* 서울 */
  SEJONG NUMBER(10), /* 세종 */
  ULSAN NUMBER(10), /* 울산 */
  INCHEON NUMBER(10), /* 인천 */
  JEONNAM NUMBER(10), /* 전남 */
  JEONBUK NUMBER(10), /* 전북 */
  JEJU NUMBER(10), /* 제주 */
  CHOONGNAM NUMBER(10), /* 충남 */
  CHOONGBUK NUMBER(10), /* 충북 */
  SUM NUMBER(10) /* 합계 */
);

COMMENT ON TABLE REGIONAL_COUNT IS '지역별현황정보';

COMMENT ON COLUMN REGIONAL_COUNT.STANDARD_DATE IS '기준일';

COMMENT ON COLUMN REGIONAL_COUNT.GANGWON IS '강원';

COMMENT ON COLUMN REGIONAL_COUNT.GYEONGGI IS '경기';

COMMENT ON COLUMN REGIONAL_COUNT.GYEONGNAM IS '경남';

COMMENT ON COLUMN REGIONAL_COUNT.GYEONGBUK IS '경북';

COMMENT ON COLUMN REGIONAL_COUNT.GWANGJU IS '광주';

COMMENT ON COLUMN REGIONAL_COUNT.DAEGU IS '대구';

COMMENT ON COLUMN REGIONAL_COUNT.DAEJEON IS '대전';

COMMENT ON COLUMN REGIONAL_COUNT.BUSAN IS '부산';

COMMENT ON COLUMN REGIONAL_COUNT.SEOUL IS '서울';

COMMENT ON COLUMN REGIONAL_COUNT.SEJONG IS '세종';

COMMENT ON COLUMN REGIONAL_COUNT.ULSAN IS '울산';

COMMENT ON COLUMN REGIONAL_COUNT.INCHEON IS '인천';

COMMENT ON COLUMN REGIONAL_COUNT.JEONNAM IS '전남';

COMMENT ON COLUMN REGIONAL_COUNT.JEONBUK IS '전북';

COMMENT ON COLUMN REGIONAL_COUNT.JEJU IS '제주';

COMMENT ON COLUMN REGIONAL_COUNT.CHOONGNAM IS '충남';

COMMENT ON COLUMN REGIONAL_COUNT.CHOONGBUK IS '충북';

COMMENT ON COLUMN REGIONAL_COUNT.SUM IS '합계';

CREATE UNIQUE INDEX PK_REGIONAL_COUNT
  ON REGIONAL_COUNT (
    STANDARD_DATE ASC
  );

ALTER TABLE REGIONAL_COUNT
  ADD
    CONSTRAINT PK_REGIONAL_COUNT
    PRIMARY KEY (
      STANDARD_DATE
    );
    
--------REGIONAL_COUNT--------------

DROP INDEX PK_STATION_DATA;

/* 충전소정보 */
DROP TABLE STATION_DATA 
  CASCADE CONSTRAINTS;

/* 충전소정보 */
CREATE TABLE STATION_DATA (
  STATION_SEQ NUMBER(10) NOT NULL, /* 충전소순번 */
  ADDR VARCHAR2(200), /* 주소 */
  CHARGETP VARCHAR2(100), /* 충전기타입 */
  CPID NUMBER(10), /* 충전기ID */
  CPNM VARCHAR2(20), /* 충전기명칭 */
  CPSTAT VARCHAR2(100), /* 충전기상태 */
  CPTP VARCHAR2(100), /* 충전방식 */
  CSID NUMBER(10) NOT NULL, /* 충전소ID */
  CSNM VARCHAR2(100) NOT NULL, /* 충전소명칭 */
  LAT VARCHAR2(50), /* 위도 */
  LONGI VARCHAR2(50), /* 경도 */
  STATUPDATETIME VARCHAR2(100) /* 갱신시간 */
);

COMMENT ON TABLE STATION_DATA IS '충전소정보';

COMMENT ON COLUMN STATION_DATA.STATION_SEQ IS '충전소순번';

COMMENT ON COLUMN STATION_DATA.ADDR IS '주소';

COMMENT ON COLUMN STATION_DATA.CHARGETP IS '충전기타입';

COMMENT ON COLUMN STATION_DATA.CPID IS '충전기ID';

COMMENT ON COLUMN STATION_DATA.CPNM IS '충전기명칭';

COMMENT ON COLUMN STATION_DATA.CPSTAT IS '충전기상태';

COMMENT ON COLUMN STATION_DATA.CPTP IS '충전방식';

COMMENT ON COLUMN STATION_DATA.CSID IS '충전소ID';

COMMENT ON COLUMN STATION_DATA.CSNM IS '충전소명칭';

COMMENT ON COLUMN STATION_DATA.LAT IS '위도';

COMMENT ON COLUMN STATION_DATA.LONGI IS '경도';

COMMENT ON COLUMN STATION_DATA.STATUPDATETIME IS '갱신시간';

CREATE UNIQUE INDEX PK_STATION_DATA
  ON STATION_DATA (
    STATION_SEQ ASC
  );

ALTER TABLE STATION_DATA
  ADD
    CONSTRAINT PK_STATION_DATA
    PRIMARY KEY (
      STATION_SEQ
    );
    
--------STATION_DATA--------------