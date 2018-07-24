SELECT * FROM TB_CCTV_INFO WHERE REMARK IS NOT NULL ORDER BY CCTV_IDX;

SELECT REMARK, ALT_URL, IP_URL FROM TB_CCTV_INFO WHERE REMARK IS NOT NULL ORDER BY CCTV_IDX;

SELECT cctv_idx, cctv_name, ALT_URL, IP_URL, REMARK FROM TB_CCTV_INFO order by cctv_idx;

SELECT * FROM TB_CCTV_INFO where cctv_name like '%Ã¢´ö±Ã%';
-- http://210.104.234.205:1935/sd1/ch41.stream/playlist.m3u8 (1)
-- rtsp://172.16.128.183/35/ch41

SELECT * FROM TB_CCTV_INFO where cctv_name like '%°æº¹±Ã¿ª%';
-- http://210.104.234.205:1935/sd2/ch21.stream/playlist.m3u8 (1)
-- rtsp://172.16.128.183/39/ch7

SELECT * FROM TB_CCTV_INFO where cctv_name like '%¶±Àü±³%';
-- http://210.104.234.205:1935/sd1/ch122.stream/playlist.m3u8 (1)
-- rtsp://172.16.128.183/36/ch61


SELECT * FROM TB_CCTV_INFO where cctv_name like '%È¸±â¿ª%';
-- http://210.104.234.205:1935/sd2/ch109.stream/playlist.m3u8 (1)
-- rtsp://172.16.128.183/39/ch65.stream

----------------

SELECT * FROM TB_CCTV_INFO where alt_url = 'http://210.104.234.205:1935/sd1/ch41.stream/playlist.m3u8'; 

-- 3184
select * from tb_cctv_info where cctv_idx = 3184;

update
	tb_cctv_info
set
	inactive_flag = 'y'        
where
	cctv_idx = 3184;        
    
    
    
-- ÅÍ³Î : 251
SELECT REMARK, ALT_URL, IP_URL FROM TB_CCTV_INFO WHERE REMARK IS NOT NULL ORDER BY CCTV_IDX;

-- HLS 644 
SELECT REMARK, ALT_URL, IP_URL FROM TB_CCTV_INFO WHERE ALT_URL IS NOT NULL ORDER BY CCTV_IDX;

-- RTSP 1200 
SELECT REMARK, ALT_URL, IP_URL FROM TB_CCTV_INFO WHERE IP_URL IS NOT NULL ORDER BY CCTV_IDX;




