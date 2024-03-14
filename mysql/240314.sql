# 데이터베이스를 선택 
use ubion1;
# 데이터베이스에서 emp table의 데이터를 모두 출력
select * from emp;
# emp table에서 SAL 컬럼의 데이터가 1500 이상인 사원의 
# 정보 출력
SELECT * FROM emp where SAL >= 1500;

# emp table에서 job이 manager이고 sal이 1500 이상인
# 사원의 이름을 출력
# 컬럼 조건식 (SELECT 뒤) : 사원의 이름
# 인덱스 조건식 (WHERE) : JOB = 'MANAGER', SAL >= 1500
SELECT `ENAME` FROM `emp` 
WHERE `JOB` = 'MANAGER'
AND 
`SAL` >= 1500;

# emp table에서 SAL이 1500이상이고 2500이하인 
# 사원의 정보를 출력
# CASE1
SELECT * FROM `emp` 
WHERE `SAL` >= 1500 AND `SAL` <= 2500;
# CASE2
SELECT * FROM `emp`
WHERE `SAL` BETWEEN 1500 AND 2500;

# emp table에서 JOB이 MANAGER이거나 SALESMAN인 
# 사원의 정보를 출력
# CASE1
SELECT * FROM `emp`
WHERE `JOB` = 'MANAGER'
OR
`JOB` = 'SALESMAN';
# CASE2
SELECT * FROM `emp`
WHERE `JOB` IN ('MANAGER', 'SALESMAN');

# 사원의 이름이 특정 문자(s)로 시작하는 사원의 정보를 출력 
SELECT * FROM `emp`
WHERE `ENAME` LIKE 'S%';
# 사원의 이름에 특정 문자가 포함되어있는 사원의 정보를 출력
SELECT * FROM `emp`
WHERE `ENAME` LIKE '%A%';
# 사원의 이름이 특정 문자로 끝이 나는 사원이 정보를 출력
SELECT * FROM `emp`
WHERE `ENAME` LIKE '%S';

# 두개의 테이블을 특정 조건에 맞게 열 결합(조인결합)
SELECT * FROM 
`emp` INNER JOIN `dept`
ON `emp`.`DEPTNO` = `dept`.`DEPTNO`
WHERE `LOC` = 'CHICAGO';

# 두개의 테이블을 특정 조건에 맞게 열 결합 
# -> 부서번호가 20인 사원 정보 출력
SELECT * FROM 
`emp` LEFT JOIN `dept`
ON `emp`.`DEPTNO` = `dept`.`DEPTNO`
WHERE `emp`.`DEPTNO` = 20;

## 부서의 지역이 NEW YORK인 사원의 정보만 출력
# case1
# dept table에서 지역이 new york인 부서의 정보를 확인 
SELECT `DEPTNO` FROM `dept` 
WHERE `LOC` = 'NEW YORK';  # 10
SELECT * FROM `emp` 
WHERE `DEPTNO` = 10;
# CASE2 ( JOIN )
SELECT `EMPNO`, `ENAME`, `JOB` FROM 
`emp` INNER JOIN `dept`
ON `emp`.`DEPTNO` = `dept`.`DEPTNO`
WHERE `LOC` = 'NEW YORK';
# CASE3 ( SUB QUERY )
SELECT * FROM `emp` 
WHERE `DEPTNO` IN (
	SELECT `DEPTNO` FROM `dept` 
	WHERE `LOC` = 'NEW YORK');

# 단순한 행 결합 ( 유니언 결합 )
SELECT * FROM `tran_1`
UNION
SELECT * FROM `tran_2`;

# ``를 사용하는 이유 
# table의 이름이나 컬럼의 이름에 공백이 존재하는경우
SELECT * FROM `sales records`;
SELECT `Item Type`, `Sales Channel` 
FROM `sales records`;

## 그룹화 
# 그룹화
# 조건을 처리하고 그룹
# 조건 처리 그룹 조건 처리 
# 조건 처리 그룹 조건 처리 정렬 변경

# sales records에서 대륙별 총이윤의 합계
SELECT 
`Region`, 
SUM(`Total Profit`) as `sum`
FROM `sales records`
GROUP BY `Region`
ORDER BY `sum` DESC;

## 국가(Country)별 총 이윤(Total Profit)의 합계를 구하고
## 총 이윤을 기준으로 내림차순 정렬
SELECT `Country`, SUM(`Total Profit`) as `sum`
FROM `sales records`
GROUP BY `Country`
HAVING `sum` > 28000000
ORDER BY `sum` DESC
LIMIT 3;

## 아시아의 국가들 중 총 이윤의 합계 높은 5개 국가를 출력
SELECT 
`Country` as `국가`, SUM(`Total Profit`) as `총 이윤`
FROM 
`sales records`
WHERE `Region` = 'Asia'
GROUP BY `Country`
ORDER BY `총 이윤` DESC
LIMIT 5;








    















