--재난안전 데이터 (dispatch_time을 현재시간보다 3시간 전 안쪽으로 변경)
update tb_safety_occur_list set dispatch_time = to_char(sysdate, 'YYYYMMDDHH24MISS') , process_state = '출동중' where  register_time > '20170613143353'

SELECT * FROM tb_safety_occur_list where  register_time > '20170613143353' AND SAFETY_CATEGORY_CD = '1';

update tb_safety_occur_list set dispatch_time = to_char(sysdate, 'YYYYMMDDHH24MISS') , process_state = '출동중' where  register_time > '20170613143353'

SELECT A.ROWID, A.* FROM tb_safety_occur_list A where  register_time >= '20170613151457' ORDER BY SAFETY_CATEGORY_CD ASC, REGISTER_TIME DESC;
