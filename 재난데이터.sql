--�糭���� ������ (dispatch_time�� ����ð����� 3�ð� �� �������� ����)
update tb_safety_occur_list set dispatch_time = to_char(sysdate, 'YYYYMMDDHH24MISS') , process_state = '�⵿��' where  register_time > '20170613143353'

SELECT * FROM tb_safety_occur_list where  register_time > '20170613143353' AND SAFETY_CATEGORY_CD = '1';

update tb_safety_occur_list set dispatch_time = to_char(sysdate, 'YYYYMMDDHH24MISS') , process_state = '�⵿��' where  register_time > '20170613143353'

SELECT A.ROWID, A.* FROM tb_safety_occur_list A where  register_time >= '20170613151457' ORDER BY SAFETY_CATEGORY_CD ASC, REGISTER_TIME DESC;
