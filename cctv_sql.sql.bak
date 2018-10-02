SELECT * FROM TB_CCTV_INFO;

DROP TABLE TB_CCTV_CHECK_LOG;

CREATE TABLE TB_CCTV_CHECK_LOG (
	CCTV_IDX	NUMBER	NOT NULL,		-- cctv idx
	CHK_DTTM	VARCHAR2(16)	NOT NULL,	-- 체크일시
	CHK_TP		VARCHAR2(1)	NOT NULL,	-- 체크타입(0 : AUTO, 1 : MANUAL)
	EQUIP_TP	VARCHAR2(1)	NOT NULL,	-- 장비타입(1 : 시연장비, 2 : 시장실)
	DEFECT_YN	VARCHAR2(1)	NOT NULL,	-- 장애여부(Y/N)
	DEFECT_REASON	VARCHAR2(2000),			-- 장애이유
	CHK_CMT		VARCHAR2(2000),			-- 체크코멘트
	CHK_IMG		CLOB,				-- 체크이미지
	WR_USR_TP	VARCHAR2(1),			-- 작성자구분(0 : admin, 1 : front)
	WR_USR_ID	VARCHAR2(20),			-- 작성자아이디
	WR_DTTM		VARCHAR2(14)			-- 작성일시
)
TABLESPACE DIGITALCITY;

COMMENT ON TABLE DIGITALMAYOR.TB_CCTV_CHECK_LOG IS 'CCTV체크로그';

COMMENT ON COLUMN TB_CCTV_CHECK_LOG.CCTV_IDX IS 'CCTV index';
COMMENT ON COLUMN TB_CCTV_CHECK_LOG.CHK_DTTM IS '체크일시';
COMMENT ON COLUMN TB_CCTV_CHECK_LOG.CHK_TP IS '체크타입(0 : AUTO, 1 : MANUAL)';
COMMENT ON COLUMN TB_CCTV_CHECK_LOG.EQUIP_TP IS '장비타입(1 : 시연장비, 2 : 시장실)';
COMMENT ON COLUMN TB_CCTV_CHECK_LOG.DEFECT_YN IS '장애여부(Y/N)';
COMMENT ON COLUMN TB_CCTV_CHECK_LOG.DEFECT_REASON IS '장애이유';
COMMENT ON COLUMN TB_CCTV_CHECK_LOG.CHK_CMT IS '체크코멘트';
COMMENT ON COLUMN TB_CCTV_CHECK_LOG.CHK_IMG IS '체크이미지';
COMMENT ON COLUMN TB_CCTV_CHECK_LOG.WR_USR_TP IS '작성자구분(0 : admin, 1 : front)';
COMMENT ON COLUMN TB_CCTV_CHECK_LOG.WR_USR_ID IS '작성자아이디';
COMMENT ON COLUMN TB_CCTV_CHECK_LOG.WR_DTTM IS '작성일시';

CREATE UNIQUE INDEX "IX_CCTV_CHECK_LOG_1" ON TB_CCTV_CHECK_LOG
(CCTV_IDX, CHK_DTTM)
LOGGING
TABLESPACE DIGITALCITY
;

ALTER TABLE TB_CCTV_CHECK_LOG ADD (
  CONSTRAINT "IX_CCTV_CHECK_LOG_1"
 PRIMARY KEY
(CCTV_IDX, CHK_DTTM));


INSERT INTO TB_CCTV_CHECK_LOG (
	CCTV_IDX,
	CHK_DTTM,
	CHK_TP,
	EQUIP_TP,
	DEFECT_YN,
	DEFECT_REASON,
	CHK_CMT,
	CHK_IMG,
	WR_USR_TP,
	WR_USR_ID,
	WR_DTTM
)
VALUES (
	#{cctvIdx},
	TO_CHAR(SYSTIMESTAMP, 'YYYYMMDDHH24MISSFF2'),
	#{chkTp},
	#{equipTp},
	#{defectYn},
	#{defectReason},
	#{chkCmt},
	#{chkImg},
	#{wrUsrTp},
	#{wrUsrId},
	TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
)

DELETE FROM
	TB_CCTV_CHECK_LOG
WHERE
	CCTV_IDX = #{cctvIdx}
	AND CHK_DTTM = #{chkDtm}


SELECT
	CCTV_IDX,
	CHK_DTTM,
	CHK_TP,
	EQUIP_TP,
	DEFECT_YN,
	DEFECT_REASON,
	CHK_CMT,
	CHK_IMG,
	WR_USR_TP,
	WR_USR_ID,
	WR_DTTM
FROM
	TB_CCTV_CHECK_LOG
WHERE
	CCTV_IDX = #{cctvIdx}
	AND CHK_DTTM = #{chkDtm}

20180828094411317
2018082809450842

<insert id="insertCctvCheckLog" parameterType="caseMap">
	INSERT INTO TB_CCTV_CHECK_LOG (
		CCTV_IDX,
		CHK_DTTM,
		CHK_TP,
		EQUIP_TP,
		DEFECT_YN,
		DEFECT_REASON,
		CHK_CMT,
		CHK_IMG,
		WR_USR_TP,
		WR_USR_ID,
		WR_DTTM
	)
	VALUES (
		#{cctvIdx},
		TO_CHAR(SYSTIMESTAMP, 'YYYYMMDDHH24MISSFF2'),
		#{chkTp},
		#{equipTp},
		#{defectYn},
		#{defectReason},
		#{chkCmt},
		#{chkImg},
		#{wrUsrTp},
		#{wrUsrId},
		TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
	)
</insert>


$.ajax({
	type : "get",
	url : "/mgnt/insertCctvCheckLogAjax",
	data : {
		"defect_sys" : serv,
		"idx" : idx,
		"defect_flag" : changeV,
		"chkTp" : "0",
		"equipTp" : ((serv == 'place1') ? "1" : "2"),
		"defectYn" : changeV,
		"defectReason" : "",
		"chkCmt" : "",
		"chkImg" : imageData,
		"wrUsrTp" : "1",
		"wrUsrId" : "digitalmayor",
		"saveAudit" : "0"
	},
	beforeSend: function() {},
	error : function(x, e) {},
	success : function(result) {
		if(result.resultcode == "OK") {
			
		}
	},
	complete: function() { 

	}
});

<sql id="re-ref_pagingHeader">
	SELECT
		Y.*
	FROM (
			SELECT
				X.*,
				ROWNUM AS RNUM
			FROM (
</sql>

<sql id="re-reg_getCctvListSearch">
	<if test = "idx != NULL and idx != ''"> AND B.CCTV_IDX = #{idx}</if>
	<if test = "type != NULL and type != '' " > AND NVL(B.INACTIVE_FLAG, 'n') = #{type}</if>

	<if test = "searchOption == 1 and searchKeyword != NULL and searchKeyword != ''">
		AND B.CCTV_NAME LIKE '%' || #{searchKeyword} || '%'
	</if>
	<if test = "searchOption == 2 and searchKeyword != NULL and searchKeyword != ''">
		AND B.IP_URL LIKE '%' || #{searchKeyword} || '%'
	</if>
	<if test = "searchOption == 3 and searchKeyword != NULL and searchKeyword != ''">
		AND B.ALT_URL LIKE '%' || #{searchKeyword} || '%'
	</if>
	<if test = "searchOption == NULL and searchKeyword != NULL and searchKeyword != ''">
		AND ((B.CCTV_NAME LIKE '%' || #{searchKeyword} || '%') OR (B.IP_URL LIKE '%' || #{searchKeyword} || '%') OR (B.ALT_URL LIKE '%' || #{searchKeyword} || '%'))
	</if>
</sql>

<select id="getCctvList" parameterType="caseMap" resultType="caseMap">
	<include refid="common.re-ref_pagingHeader"/>
			SELECT
				X.*,
				ROWNUM AS RNUM
			FROM (
					SELECT
						A.*
					FROM
						TB_CCTV_INFO A
					WHERE
						1 = 1
						<include refid="re-reg_getCctvListSearch"/>

					ORDER BY
						A.CCTV_IDX DESC
				<include refid="common.re-ref_pagingFooter"/>
</select>

<sql id="re-ref_pagingFooter">
				) X
			WHERE
				1 = 1
				<if test = 'current_page != NULL and once_display_count != NULL'>AND ROWNUM <![CDATA[<=]]> (#{current_page} * #{once_display_count})</if>
		) Y
	WHERE
		1 = 1
		<if test = 'firstNum != NULL and search_is_del != ""'>AND RNUM <![CDATA[>]]> #{firstNum}</if>
</sql>

-------------------------------------------------------------------------------------------------------------
	SELECT
		Y.*
	FROM (
			SELECT
				X.*,
				ROWNUM AS RNUM
			FROM (
					SELECT
						A.*
					FROM
						TB_CCTV_INFO A
					WHERE
						1 = 1
						<include refid="reg_getCctvListSearch"/>

					ORDER BY
						A.CCTV_IDX DESC
				) X
			WHERE
				1 = 1
				<if test = 'current_page != NULL and once_display_count != NULL'>AND ROWNUM <![CDATA[<=]]> (#{current_page} * #{once_display_count})</if>
		) Y
	WHERE
		1 = 1
		<if test = 'firstNum != NULL and search_is_del != ""'>AND RNUM <![CDATA[>]]> #{firstNum}</if>		


CCTV_IDX,
DECODE(B.CCTV_NAME2, NULL, B.CCTV_NAME, B.CCTV_NAME2) AS CCTV_NAME,
B.LATITUDE,
B.LONGITUDE,
B.CCTV_TYPE,
B.IP_URL,
B.PORT,
B.PROTOCOL,
B.ADDR,
B.DIVISION,
B.DAMDANGJA,
B.DAMDANG_PHONE,
B.CCTV_ID,
B.CCTV_PW,
B.REMARK,
B.DEV_MAKER,
B.DEV_MODEL,
B.CODEC,
B.DIVISION_CD,
DECODE(B.ALT_URL , NULL , ' ', B.ALT_URL) AS ALT_URL,
B.TUNL_YN


public static String getCurrentDate() {
	SimpleDateFormat sdf = null;
	sdf = new SimpleDateFormat ("yyyyMMdd");
	Date currentDate = new Date();
	String dateString = sdf.format(currentDate);

	return dateString;
}

======================================================================================
-- 데이터 변경 로그
DROP TABLE TB_MNG_DATA_CHANGE_LOG;

CREATE TABLE TB_MNG_DATA_CHANGE_LOG (
	CHG_IDX		NUMBER		NOT NULL,	-- 변경 INDEX
	CHG_DTTM	VARCHAR2(14)	NOT NULL,	-- 변경일시(YYYYMMDDHH24MISS)
	CHG_TP		VARCHAR2(2)	NOT NULL,	-- 변경타입(CUD)
	CHG_TGT_TBL_NM	VARCHAR2(50)	NOT NULL,	-- 대상(TABLE)
	PRI_KEY_NM	VARCHAR2(120)	NOT NULL,	-- 키(Primary : 콤마 구분)
	PREV_D_CNTS	CLOB,				-- 변경전데이터(JSON, CLOB)
	CHG_D_CNTS	CLOB,				-- 변경후데이터(JSON, CLOB)
	CHG_D_KEY_VAL	VARCHAR2(500),			-- 변경데이터키값
	WHERE_CONDI_STMT	VARCHAR2(4000),		-- WHERE 조건절
	WR_USR_TP	VARCHAR2(1),			-- 작성자구분(0 : admin, 1 : front)
	WR_USR_ID	VARCHAR2(20),			-- 작성자아이디
	WR_DTTM		VARCHAR2(14)			-- 작성일시
);

COMMENT ON TABLE DIGITALMAYOR.TB_MNG_DATA_CHANGE_LOG IS '데이터변경로그';

--COMMENT ON COLUMN TB_MNG_DATA_CHANGE_LOG. IS '';
COMMENT ON COLUMN TB_MNG_DATA_CHANGE_LOG.CHG_IDX IS '변경 INDEX';		
COMMENT ON COLUMN TB_MNG_DATA_CHANGE_LOG.CHG_DTTM IS '변경일시(YYYYMMDDHH24MISS)';	
COMMENT ON COLUMN TB_MNG_DATA_CHANGE_LOG.CHG_TP IS '변경타입(CUD)';	
COMMENT ON COLUMN TB_MNG_DATA_CHANGE_LOG.CHG_TGT_TBL_NM IS '대상(TABLE)';	
COMMENT ON COLUMN TB_MNG_DATA_CHANGE_LOG.PRI_KEY_NM IS '키(Primary : 콤마 구분)';	
COMMENT ON COLUMN TB_MNG_DATA_CHANGE_LOG.PREV_D_CNTS IS '변경전데이터(JSON)';	
COMMENT ON COLUMN TB_MNG_DATA_CHANGE_LOG.CHG_D_KEY_VAL IS '변경데이터키값';	
COMMENT ON COLUMN TB_MNG_DATA_CHANGE_LOG.WHERE_CONDI_STMT IS 'WHERE 조건절';	

COMMENT ON COLUMN TB_MNG_DATA_CHANGE_LOG.CHG_D_CNTS IS '변경후데이터(JSON)';	
COMMENT ON COLUMN TB_MNG_DATA_CHANGE_LOG.WR_USR_TP IS '작성자구분(0 : admin, 1 : front)';	
COMMENT ON COLUMN TB_MNG_DATA_CHANGE_LOG.WR_USR_ID IS '작성자아이디';	
COMMENT ON COLUMN TB_MNG_DATA_CHANGE_LOG.WR_DTTM IS '작성일시';		

CREATE UNIQUE INDEX "IX_DATA_CHANGE_LOG_1" ON TB_MNG_DATA_CHANGE_LOG
(CHG_IDX)
LOGGING
TABLESPACE DIGITALCITY
;

CREATE UNIQUE INDEX "IX_DATA_CHANGE_LOG_2" ON TB_MNG_DATA_CHANGE_LOG
(CHG_IDX, CHG_D_KEY_VAL)
LOGGING
TABLESPACE DIGITALCITY
;

ALTER TABLE TB_MNG_DATA_CHANGE_LOG ADD (
  CONSTRAINT "IX_DATA_CHANGE_LOG_1"
 PRIMARY KEY
(CHG_IDX));

DROP SEQUENCE DIGITALMAYOR.DATA_CHANGE_LOG_SEQ;

CREATE SEQUENCE DIGITALMAYOR.DATA_CHANGE_LOG_SEQ
  START WITH 1
  MAXVALUE 999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;

/*
CHG_IDX		
CHG_DTTM	
CHG_TGT_TBL_NM	
PRI_KEY_NM	
PREV_D_CNTS	
CHG_D_CNTS	
WR_USR_TP	
WR_USR_ID	
WR_DTTM	
*/

INSERT INTO TB_MNG_DATA_CHANGE_LOG (
	CHG_IDX, 
	CHG_DTTM, 
	CHG_TGT_TBL_NM, 
	PRI_KEY_NM, 
	PREV_D_CNTS, 
	CHG_D_CNTS, 
	WR_USR_TP, 
	WR_USR_ID, 
	WR_DTTM
)
VALUES (
	DATA_CHANGE_LOG_SEQ.NEXTVAL,
	TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'),
	?,
	?,
	?,
	?,
	?,
	?,
	TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
)

chg_idx
chg_dttm
${chg_tgt_tbl_nm},
${pri_key_nm},
${prev_d_cnts},
${chg_d_cnts},
${wr_usr_tp},
${wr_usr_id},
wr_dttm


<selectKey keyProperty="lastRowVal" resultType="int" order="BEFORE">
	SELECT DATA_CHANGE_LOG_SEQ.NEXTVAL FROM DUAL
</selectKey>


INSERT INTO TBL_MNG_DATA_ROW (
	mng_data_row_idx,
	mng_data_schema_idx,
	mng_data_row_key,
	mng_data_input_data,
	reg_date
)
VALUES (
	#{lastRowVal},
	#{schema_idx},
	#{row_key},
	<choose>
		<when test="input_data != NULL and input_data != ''">
			#{input_data},
		</when>
		<otherwise>
			' ',
		</otherwise>
	</choose>
	sysdate
)


MNG_DATA_SCHEMA_IDX	MNG_DATA_MASTER_IDX	COLUMN_NAME	COLUMN_TEXT	COLUMN_TYPE	COLUMN_IS_NULL	COLUMN_LENGTH	CODE_VALUE

1761	1614	TYPEOFJOB	일자리구분	10107	10109	20	MNG_TYPE_TEXT
1762	1614	GOAL	목표	10106	10109	20	MNG_TYPE_NUMBER
1763	1614	RESULT	실적	10106	10109	20	MNG_TYPE_NUMBER

<select id="getTblMngDataRowList" parameterType="caseMap" resultType="caseMap">
	SELECT
		MNG_DATA_ROW_IDX,
		MNG_DATA_SCHEMA_IDX,
		MNG_DATA_ROW_KEY,
		MNG_DATA_INPUT_DATA,
		REG_DATE
	FROM
		TBL_MNG_DATA_ROW
	WHERE
		MNG_DATA_SCHEMA_IDX IN (
			SELECT
				MNG_DATA_SCHEMA_IDX
			FROM
				TBL_MNG_DATA_SCHEMA
			WHERE
				MNG_DATA_MASTER_IDX = #{idx}
		)
	ORDER BY
		MNG_DATA_ROW_IDX ASC
</select>


SELECT
	A.TABLE_NAME,
	A.COLUMN_ID,
	A.COLUMN_NAME,
	A.DATA_TYPE,
	B.COMMENTS
FROM
	ALL_TAB_COLUMNS A,
	ALL_COL_COMMENTS B
WHERE
	A.TABLE_NAME = B.TABLE_NAME
	AND A.COLUMN_NAME = B.COLUMN_NAME
	AND A.OWNER = B.OWNER
	AND UPPER(A.OWNER) = UPPER('DIGITALMAYOR')
	AND UPPER(A.TABLE_NAME) = UPPER('TBL_MNG_DATA_ROW')
ORDER BY
	A.COLUMN_ID 


SELECT
	A.TABLE_NAME,
	A.COLUMN_ID,
	A.COLUMN_NAME,
	A.DATA_TYPE,
	B.COMMENTS
FROM
	USER_TAB_COLUMNS A,
	ALL_COL_COMMENTS B
WHERE
	A.TABLE_NAME = B.TABLE_NAME
	AND A.COLUMN_NAME = B.COLUMN_NAME
	AND UPPER(B.OWNER) = UPPER('DIGITALMAYOR')
	AND UPPER(A.TABLE_NAME) = UPPER('TBL_MNG_DATA_ROW')
ORDER BY
	A.COLUMN_ID ASC

SELECT
	INDEX_NAME
FROM
	USER_CONSTRAINTS
WHERE
	UPPER(TABLE_NAME) = UPPER('TBL_MNG_DATA_ROW')
	AND CONSTRAINT_TYPE = 'P';

SELECT
	INDEX_NAME,
        COLUMN_NAME,
        COLUMN_POSITION,
        DESCEND
FROM
	USER_IND_COLUMNS
WHERE
	UPPER(TABLE_NAME) = UPPER('TBL_MNG_DATA_ROW')
ORDER BY
	INDEX_NAME ASC,
	COLUMN_POSITION ASC
;

SELECT
	INDEX_NAME,
        COLUMN_NAME,
        COLUMN_POSITION,
        DESCEND
FROM
	USER_IND_COLUMNS
WHERE
	INDEX_NAME = (
                SELECT
                	INDEX_NAME
                FROM
                	USER_CONSTRAINTS
                WHERE
                	UPPER(TABLE_NAME) = UPPER('TBL_MNG_DATA_ROW')
                	AND CONSTRAINT_TYPE = 'P'        
        )
ORDER BY
	INDEX_NAME ASC,
	COLUMN_POSITION ASC 


/**
* 프로젝트명	: 디지털 시민시장실
* 파일명		: 
* 생성자(일자)	: Administrator ( 2016. 4. 21. )
* 목적		:
* 프로그램 설명	:
* 수정자(일자)	: Administrator ( 2016. 4. 21. )
* 내용		: 
* COPYRIGHT 2016 ~ 2018 Why Data and Service All Rights Reserved.
*/


SEQ_MNG_DATA_MASTER
SEQ_MNG_DATA_ROW
SEQ_MNG_DATA_ROW_KEY
SEQ_MNG_DATA_SCHEMA

SELECT MAX(MNG_DATA_IDX) FROM TBL_MNG_DATA_MASTER;

DROP SEQUENCE DIGITALMAYOR.SEQ_MNG_DATA_MASTER;

CREATE SEQUENCE DIGITALMAYOR.SEQ_MNG_DATA_MASTER
  START WITH 1615
  MAXVALUE 99999999999
  MINVALUE 1000
  NOCYCLE
  CACHE 20
  NOORDER;
  
  
-- 116385  
SELECT MAX(MNG_DATA_ROW_IDX) FROM TBL_MNG_DATA_ROW;


DROP SEQUENCE DIGITALMAYOR.SEQ_MNG_DATA_ROW;

CREATE SEQUENCE DIGITALMAYOR.SEQ_MNG_DATA_ROW
  START WITH 116386
  MAXVALUE 9999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;
    
  
SELECT MAX(MNG_DATA_ROW_KEY) FROM TBL_MNG_DATA_ROW;
  
-- TBL_MNG_DATA_ROW
DROP SEQUENCE DIGITALMAYOR.SEQ_MNG_DATA_ROW_KEY;

CREATE SEQUENCE DIGITALMAYOR.SEQ_MNG_DATA_ROW_KEY
  START WITH 13733
  MAXVALUE 9999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;


SELECT MAX(MNG_DATA_SCHEMA_IDX) FROM TBL_MNG_DATA_SCHEMA;

-- TBL_MNG_DATA_SCHEMA
DROP SEQUENCE DIGITALMAYOR.SEQ_MNG_DATA_SCHEMA;

CREATE SEQUENCE DIGITALMAYOR.SEQ_MNG_DATA_SCHEMA
  START WITH 2325
  MAXVALUE 99999999999
  MINVALUE 1000
  NOCYCLE
  CACHE 20
  NOORDER;
    

======================================================================================


	
