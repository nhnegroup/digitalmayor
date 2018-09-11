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