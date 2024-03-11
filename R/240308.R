# 주석

# 변수를 생성 
a <- 10
print(a)
"test" -> b
print(b)
c = TRUE
print(c)
# 변수의 타입을 확인
print(typeof(a))
print(typeof(b))
print(typeof(c))
d <- "1"
print(typeof(d))
# 기존에 존재하는 변수에 데이터를 대입 하는 경우
d <- 20
print(d)
print(typeof(d))

# 벡터 데이터 생성 
# 여러 개의 데이터를 하나의 변수에 대입 
# 데이터들의 타입은 모두 같아야한다. 
# c()함수를 이용하여 벡터 데이터를 생성
vector_a <- c(1, 3, 5, 7)
vector_b <- c('test', 'test2', 'test3')
print(vector_a)
print(vector_b)
# 벡터 데이터에서 특정 위치의 데이터만 출력
# vector_a에서 5라는 데이터만 출력
print(vector_a[3])
print(vector_b[2])
print(vector_a[c(2,4)])
# 숫자형태의 데이터를 백터로 생성
vector_c <- 1:10
print(vector_c)

# 행렬 데이터 생성
# 1,2차원 데이터 생성이 가능 
#일반적으로 2차원 데이터 생성시 사용
arr_x = array(1:20, dim=c(4,5))
print(arr_x)
arr_y = array(1:10, dim=c(4,5))
print(arr_y)
arr_z = array(1:20, dim=c(4,4))
print(arr_z)
print(arr_z[2,2])
print(arr_z[3,4])

# 리스트 데이터 생성 
# 벡터 데이터와 흡사한데 여러 타입의 데이터를 대입가능
# 벡터에서는 위치를 기준으로 데이터를 추출한다면 
# 리스트 데이터는 key 값을 기준으로 데이터를 추출할 수 있도록
# 구성되어 있다. 
# 리스트 생성 시 key = value 넣어서 생성
list_a = list(
  name = 'test', 
  age = 20, 
  phone = '01012345678'
)
print(list_a)
print(list_a['name'])

list_b <- list(
  name = c('test', 'test2'),
  age = c(20, 30),
  phone = c('01012345678', '01098765432')
)
print(list_b)
print(list_b['name'])
print(list_b[['age']][2])
df <- data.frame(
  name = c('test', 'test2', 'test3'), 
  age = c(20, 30, 40), 
  loc = c('seoul', 'busan', 'masan')
)
print(df)
print(df[['age']][2])
print(df[2, 'age'])

# 연산자 

# 산술연산자
x <- 10
y <- 3
print(x + y)
print(x - y)
x * y
result <- x / y
result
# 나눈 값의 나머지를 출력
print(x %% y)
# 나눈 값의 몫을 출력
print(x %/% y)

# 비교 연산자 
# 두개의 데이터를 비교하여 참/거짓의 형태로 출력 
z <- 5
print(x == y)
print(x != y)
print(x > y)
print(x < y)
print(y < z)
print(x <= y)
# 에러 발생
print(x =< y)

# 논리 연산자 
# 부정 
print(!TRUE)
# and 연산자 
# 두개의 논리값이 모두 참인 경우에 참 나머지 경우는 거짓
print(TRUE & TRUE)
print(TRUE & FALSE)
print(FALSE & FALSE)
# or 연산자
# 두개의 논리값 중 하나라도 참이라면 참 모두 거짓인 경우에만 거짓
print(TRUE | TRUE)
print(TRUE | FALSE)
print(FALSE | FALSE)

print(TRUE & TRUE & FALSE)
print(TRUE & TRUE | FALSE)

# 조건문 (if문)
x <- 10
# if 조건식
if (x > 5){
  # 위의 조건식이 참인 경우 실행할 코드
  print('x는 5보다 크다')
}
y <- 3
if(y > 5){
  print('y는 5보다 크다')
}

# 참인 경우 실행할 코드와 거짓인 경우 실행할 코드를 모두 작성
if(y > 5){
  # 조건식이 참인 경우
  print('y는 5보다 크다')
}else{
  # 조건식이 거짓인 경우 
  print('y는 5보다 작거나 같다')
}

# 조건식이 여러개인 경우 
score <- 82

if(score >= 90){
  # score가 90점 이상인 경우
  print('A')
}else if(score >= 80){
  print('B')
}else if(score >= 70){
  print('C')
}else{
  print('F')
}

g <- 0
if(g){
  print('True')
}
# 두개의 조건식을 모두 만족해야되는 경우 
input_id <- "test"
input_pass <- "1111"

if( (input_id == 'test') & (input_pass == '1234') ){
  print('로그인 성공')
}else{
  print('로그인 실패')
}

if(input_id == 'test'){
  if (input_pass == '1234'){
    print('로그인 성공')
  }else{
    print('로그인 실패')
  }
}else{
  print('로그인 실패')
}

# which문
# 자료형 데이터에서 조건식과 일치하는 데이터의 위치를 출력 
name <- c('test', 'test2', 'test3')
name == 'test2'
which(name == 'test2')
name != 'test2'
which(name != 'test2')

arr_x = array(1:10, dim=c(4, 5))
print(arr_x)
arr_x == 4
which(arr_x == 4)
which(arr_x == 11)

# 반복문 
# for문
array_a = 1:10

for (i in array_a){
  print(i)
}

array_b = c('test', 'test2', 'test3')

for (i in array_b){
  print(i)
}

# 1부터 10까지의 합계를 구한다. 
# 합계의 기본값 0을 가진 변수를 생성 
res = 0
array_a = 1:100
for (i in array_a){
  # 첫번째 반복 : i = 1, res = 0 ::: res = 0 + 1 -> res = 1
  # 두번째 반복 : i = 2, res = 1 ::: res = 1 + 2 -> res = 3
  # 세번째 반복 : i = 3, res = 3 ::: res = 3 + 3 -> res = 6
  # 네번째 반복 : i = 4, res = 6 ::: res = 6 + 4 -> res = 10
  명
}
res

# 문제 
# 1부터 100까지의 숫자 중에 짝수인 숫자들의 누적합계 

# 합계라는 초기값0을 가진 변수를 생성
res = 0
# 1부터 100까지의 벡터 데이터(array_a)를 생성 
array_a = 1:100
# for문을 이용하여 array_a 만큼 반복을 하는 반복문을 생성
for (i in array_a){
  # i의 값이 짝수인지 조건식(2로 나눈 나머지 값이 0인 경우) 작성
  if ( i %% 2 == 0 ){
    # 조건식이 참인 경우에는 합계라는 변수에 i의 값을 누적합
    res = res + i 
  }
}
# 합계를 출력
print(res)

# case2
res2 = 0
array_b = 1:50
for (i in array_b){
  res2 = res2 + (2 * i - 1)
}
print(res2)

# while문
# while 뒤의 조건식이 거짓이 될때까지 반복 실행
i <- 1
while (i <= 10){
  print(i)
  i = i + 1
}
# break : 반복문을 강제로 종료
i <- 1
while (TRUE){
  print(i)
  if (i == 10){
    break
  }
  i = i + 1
}

# while문 이용하여 1부터 10까지의 합계
# 합계 초기값
res = 0
# 반복문에 사용할 변수의 초기값
i = 1
while (i <= 10){
  # 첫번째 반복 : i = 1, res = 0 ::: res = 0 + 1 -> res = 1
  # 두번째 반복 : i = 2, res = 1 ::: res = 1 + 2 -> res = 3
  # 세번째 반복 : i = 3, res = 3 ::: res = 3 + 3 -> res = 6
  # ...
  # 열번째 반복 : i = 10, res = 45  ::: res = 45 + 10 -> res = 55
  res = res + i
  # 첫번째 반복 : i = 1 + 1 -> i = 2
  # 두번째 반복 : i = 2 + 1 -> i = 3
  # 세번째 반복 : i = 3 + 1 -> i = 4
  # ...
  # 열번째 반복 : i = 10 + 1 -> i = 11
  i = i + 1
}
print(res)

res = 0 
i = 1
while (i <= 10){
  # 첫번째 반복 : i = 1 ::: i = 1 + 1 -> i = 2 
  # 두번째 반복 : i = 2 ::: i = 2 + 1 -> i = 3
  # ...
  # 열번째 반복 : i = 10 ::: i = 10 + 1 -> i = 11
  i = i + 1
  # 첫번째 반복 : i = 2, res = 0 ::: res = 0 + 2 -> res = 2
  # 두번째 반복 : i = 3, res = 2 ::: res = 2 + 3 -> res = 5
  # ...
  # 열번째 반복 : i = 11, res = 54 ::: res = 54 + 11 -> res = 65
  res = res + i
}
print(res)

## 다중 for문
## 구구단을 출력하라
## 2단부터 9단까지를 출력 

# 첫번째 반복문에서는 2부터 9까지 반복을 하는 반복문을 생성 
for (i in 2:9){    # 8번 반복
  # print(i)
  # 두번째 반복문에서는 1부터 9까지 반복을 하는 반복문을 생성
  for (j in 1:9){   # 9번 반복
    # print(j)
    print(c(i, j, i * j))
  }
}

## 문제 
## 2개의 주사위를 굴려서 합이 7인 경우의 수를 모두 출력하시오

## 첫번째 주사위의 경우의 수를 반복문으로 생성 

  ## 두번째 주사위의 경우의 수를 반복문으로 생성 

    ## 2개의 주사위의 합이 7이라면? 조건식 생성
    
      ## 조건식이 참인 경우 첫번째 주사위와 
      ##두번째 주사위의 값을 출력
for (i in 1:6){
  # print(i)
  for (j in 1:6){
    # print(c(i, j))
    if ( i + j == 7 ){
      print(c(i, j))
    }
  }
}





