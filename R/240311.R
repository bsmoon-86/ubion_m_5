# 함수 생성 
func_1 <- function(){
  print('Hello R')
}

# 함수 호출
func_1()
# 인자값을 저장 시킬 공간이 존재하지 않기때문에 에러 발생
func_1('test')

# 매개변수가 존재하는 함수를 생성
func_2 <- function(x, y){
  result <- x ^ y 
  return (result)
}
# 함수 호출 
res <- func_2(5, 2)

for (i in 1:10){
  print(i)
}
# 변수의 종류 
# 전역 변수
  # 어디서든 사용이 가능한 변수 
  # 오브젝트 뷰어에 저장이 되는 변수 
  # 비휘발성 변수
# 지역 변수
  # 특정 구역에서만 사용이 가능한 변수 
  # 오브젝트 뷰어에는 표시가 되지 않는다. 
  # 휘발성 변수 (특정 지역에서 한번 사용이 되고 결과는 사라진다.)
  # 메모리를 효율적으로 관리하기 위해 만들어진 변수 
  # 매개변수, 함수 안에서 생성된 변수 

# 함수 생성 매개변수에 기본값이 설정 
func_3 <- function(x, y=3){
  result = x ^ y
  return(result)
}
# func_3(x = 10, y =3) --> result = 10 ^ 3
# return (1000)
print(func_3(10))
# x = 10, y = 2 --> result = 10 ^ 2
# return (100)
print(func_3(10, 2))
func_4 <- function(x){
  y = 3
  result = x ^ y
  return (result)
}
print(func_4(10))
# 매개변수가 1개인 함수에 인자를 2개 넣는다면 에러 발생
print(func_4(10, 2))

array(1:20, dim = c(4, 5))

# 함수 생성 매개변수 3개 기본값이 2개인 경우
func_5 <- function(x, y = 3, z = 2){
  result = (x - y) ^ z
  return (result)
}
print(func_5(10))
print(func_5(10, 3, 3))
print(func_5(10, z = 3))

# 인자의 개수가 가변인 경우 
func_6 <- function(...){
  print(c(...))
}
func_6(1,2,3,4,5)
func_6()
func_6(1,3)
func_7 <- function(x){
  print(x)
}
func_7(c(1, 2, 3))
# 매개변수에 저장이 될 데이터가 존재하지 않기때문에 에러 발생
func_7()

## 함수 생성 매개변수 2개 
## 매개변수 2개의 사이의 값들의 합을 구하는 함수 
func_8 <- function(start, end){
  ## 합계라는 변수 하나 생성 초기값을 0
  result <- 0
  for (i in start:end){
    result <- result + i
  }
  return (result)
}
func_8(1, 10)
func_8(10, 1)

## func_8과 같이 start부터 end까지의 누적합을 구하는 함수를 
## while문으로 생성
func_9 <- function(start, end){
  # 합계 변수 생성 
  result = 0
  ## start가 end보다 작은 경우
  if (start <= end){
    # 초기값
    i = start
    while(i <= end){
      result = result + i
      i = i + 1
    }
  } else{
    i = start
    while(i >= end){
      result = result + i
      i = i -1
    }
  }

  return (result)
}
func_9(1, 10)
func_9(10, 1)

func_10 <- function(start, end){
  result = 0
  # 시작값 : start와 end중에 작은 데이터 
  i <- min(start, end)
  while (i <= max(start, end)){
    result = result + i
    i = i + 1
  }
  return (result)
}
func_10(1, 10)
func_10(10, 1)

min(4, 2, 7, 1)
## 평균을 구하는 함수 
## 매개변수는 가변
## 모든 인자 값들은 합 / 인자의 개수
c_mean <- function(...){
  # 합계를 구하는 변수를 하나 생성
  sum <- 0
  # 개수를 구하는 변수를 하나 생성
  cnt <- 0
  for (i in c(...)){
    sum = sum + i
    cnt = cnt + 1
  }
  if (cnt == 0) {
    result = 0
  }else{
    result = sum / cnt
  }
  return (result)
}
c_mean(1,2,3,4,5)
c_mean(10, 30, 40, 50)
c_mean()

c_mean2 <- function(...){
  sum2 <- sum(c(...))
  len2 <- length(c(...))
  if(len2 == 0){
    result = 0
  }else{
    result = sum2 / len2
  }
  return (result)
}
c_mean2(1,2,3,4,5)
c_mean2(10, 20, 30, 40)
c_mean2()

## 커스텀 연산자 
"%a%" <- function(x, y){
  result <- (x + y) ^ y
  return (result)
}
4 %a% 2
5 %a% 3

## 데이터프레임
name <- c('test', 'test2', 'test3', 'test4')
grade <- c(1, 1, 3, 2)
# 벡터 데이터를 이용해서 데이터프레임 생성
student <- data.frame(name, grade)
student

# 벡터데이터를 이용하여 행렬 데이터를 생성 
midturm <- c(80, 90, 70, 40)
final <- c(90, 70, 100, 80)
cbind(midturm, final) -> score

# 벡터데이터들끼리의 합
total <- midturm + final

## 데이터프레임 + 행렬 + 벡터 데이터를 결합하여 새로운 데이터프레임
## 조건 : 데이터프레임과 행렬은 행의 수가 같아야하고 
## 벡터데이터는 데이서의 개수가 같아야한다. 
students <- data.frame(student, score, total)
students

## 벡터데이터와 단일 숫자와의 합
midturm + 5
5 + midturm

# students에 새로운 컬럼을 추가 
gender = c('F', 'M', 'F', 'M')
students <- cbind(students, gender)

## R에서 기본적으로 제공해주는 데이터프레임의 필터링
## 특정 컬럼의 데이터를 출력
## 데이터프레임명$컬럼명
## 데이터프레임명[[컬럼명]]
## 데이터프레임명[[컬럼위치]]
students$final
students[['midturm']]
students[[1]]
## []를 이용하여 데이터 필터 
## 데이터프레임명[ 행의 조건식, 열의 조건식 ]
# 중간성적과 기말성적을 출력
students[,c('midturm','final')]
students[1,]
students[c(1,4),]

## 중간 성적이 70점 이상인 학생의 정보를 확인하자
flag <- students$midturm >= 70
students[flag, ]

## 행의 조건 : 중간 성적이 70점 이상 (그리고) 전체 점수가 170이상인 
## 열의 조건 : 학생의 이름을 출력
flag2 <- students$midturm >= 70 & students$total >= 170
students[flag2, 'name']

## 행을 추가 하는 함수 
## rbind()
## 데이터프레임의 구조가 같은 행 데이터를 결합
new_student <- data.frame(name = 'test5', 
                          grade = 2, 
                          midturm = 80, 
                          final = 70, 
                          total = 150,
                          gender = 'M')
new_student
students <- rbind(students, new_student)

new_student2 <- data.frame(name = 'test6', 
                           midturm = 90, 
                           final = 70, 
                           total = 160, 
                           grade = 1, 
                           gender = 'F')
rbind(students, new_student2)

## 차순 정렬 
## 데이터프레임의 행의 순서를 변경 
## order()
## 오름차순 정렬 
order_flag <- order(students$midturm)
students[order_flag, ]
## 내림차순 정렬
order_flag2 <- order(students$midturm, decreasing = TRUE)
students[order_flag2, ]
order_flag3 <- order(-students$midturm)
students[order_flag3, ]

### 경로
# 절대 경로
  # 절대적인 주소를 의미한다. 
  # 환경(컴퓨터)이 변하더라도 같은 위치를 지정
  # ex) window : c:/users/admin/document/csv/a.csv
  #     mac : ~/admin/document/csv/a.csv
  #     url : https://www.google.com
# 상대 경로
  # 상대적인 주소를 의미한다. 
  # 환경이 변할때마다 위치도 같이 변화
  # 현재 위치(working directory)에서 상위나 하위 폴더로 이동
  # ex) ./ : 현재 작업중인 디렉토리 
  #     ../ : 상위 디렉토리로 이동 
  #     디렉토리명/ : 하위 디렉토리로 이동

# 상대 경로 (현재 경로(./) -> csv 하위 디렉토리 이동(csv/) -> csv_exam.csv)
df <- read.csv("csv/csv_exam.csv")
df
# 절대 경로
df2 <- read.csv("C:\\Users\\moons\\Documents\\GitHub\\ubion_m_5\\R\\csv\\csv_exam.csv")
df2

# 데이터프레임에서 상위 n개의 데이터를 출력 
head(df)
head(df, 2)
# 데이터프레임에서 하위 n개의 데이터를 출력
tail(df)
tail(df, 1)
# 데이터프레임의 크기를 출력하는 함수 
dim(df)
# 데이터프레임의 기본 정보를 출력하는 함수 
str(df)
# 데이터프레임의 뷰어창에서 확인 
View(df)
# 통계 요약 정보를 출력
summary(df)

## df 에서 english, math, science 데이터들의 합을 구해서 
## df에 total 컬럼에 데이터를 대입 
## mean_score 컬럼에 total를 3으로 나눈 데이터를 대입 
# cbind()
total <- df$english + df[['math']] + df[[5]]
df <- cbind(df, total)
df$mean_score <- df$total / 3
df

## 평균 성적을 기준으로 합격 여부를 판단하는 컬럼을 생성
## 조건식을 이용한 파생 변수를 생성
## mean_score가 65점 이상인 경우에는 pass
## 65점 미만인 경우 fail
## ifelse(조건식, 참일때의데이터, 거짓일때의데이터)
df$check <- ifelse(df$mean_score >= 65, 'pass', 'fail')
df
## 평균 성적이 65 초과(df$mean_score > 65)인 경우 pass
## 성적이 65점 이라면(df$mean_score == 65) hold
## 65점 미만이라면 fail
df$check2 <- ifelse(df$mean_score > 65, 
       'pass', 
       ifelse(
         df$mean_score == 65, 
         'hold', 
         'fail'
       ))



