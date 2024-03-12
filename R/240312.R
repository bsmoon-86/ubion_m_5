# dplry 패키지를 사용
library(dplyr)
# 외부의 데이터파일을 로드 
# 현재 디렉토리(./)에서 csv 하위폴더(csv/)로 이동 -> csv_exam.csv
df <- read.csv("./csv/csv_exam.csv")
head(df)

# 파이프 연산자를 이용하여 함수를 호출 
# %>% : Ctrl(Command) + Shift + M 단축키를 사용하시면 자동 완성

# filter(조건식) : 인덱스의 조건식으로 인덱스를 기준으로 필터
df %>% 
  filter(class == 1)
# base 함수를 이용시 
df[['class']] == 1 -> flag
df[flag, ]

# select(조건식) : 컬럼의 조건식으로 컬럼을 기준으로 필터
df %>% 
  select(id, class)
# select 조건식에 컬럼에 '-'를 붙이면 
# 해당하는 컬럼을 제외한다. 
df %>% 
  select(-class)
# 컬럼의 범위를 설정 -> 시작컬럼 : 종료컬럼
df %>% 
  select(math : science)
# base 함수를 이용하여 id와 class 컬럼만 추출 
df[,c('id', 'class')]

# class가 3 이상인 데이터들 중에 (인덱스 조건)
# math, english, science 성적을 확인 (컬럼 조건)
# 패키지 이용
df %>% 
  filter(class >= 3) %>% 
  select(math : science)

# base 함수
flag <- df$class >= 3
df[flag, c('math', 'english', 'science')]

# 정렬을 변경 (오름차순, 내림차순)
# arrange()
df %>% 
  arrange(math)
# 내림차순 정렬
df %>% 
  arrange(desc(math))
df %>% 
  arrange(-math)
# base 함수
df[order(df$math), ]

df[order(df$math, decreasing = TRUE),]
df[order(-df$math),]

# 차순 정렬시 기준이 2개 이상인 경우 
df %>% 
  arrange(desc(class), math)
df %>% 
  arrange(-class, math)

# 그룹화 데이터를 생성
# 특정 컬럼을 선택해서 해당하는 컬럼의 
# 데이터들이 같은 데이터들의 묶음
df %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))
df %>% 
  summarise(mean_math = mean(math))

summarise(
  group_by(df, class), 
  mean_math = mean(math))

## 데이터프레임의 결합 

## 유니언 결합(단순하게 행이나 열을 결합)
df_1 <- data.frame(
  id = 1:3, 
  score = c(80, 70, 90)
)
df_2 <- data.frame(
  id = 2:5, 
  weight = c(60, 70, 50, 65)
)
# rbind() : 행을 추가하는 결합 (컬럼 구조가 다르기 때문에 에러 발생)
rbind(df_1, df_2)
# 패키지에서 bind_rows() 함수를 이용
df_1 %>% 
  bind_rows(df_2)

# 조인 결합
# 집합을 생각해라 
# df_1에 id의 집합 : 1, 2, 3
# df_2에 id의 집합 :    2, 3, 4, 5

# 교집합
inner_join(df_1, df_2, by='id')
# 왼쪽의 데이터를 기준으로 결합
left_join(df_1, df_2, by='id')
# 오른쪽의 데이터를 기준으로 결합
right_join(df_1, df_2, by='id')
# 합집합
full_join(df_1, df_2, by='id')

df_1 %>% 
  inner_join(df_2, by='id')
df_3 <- data.frame(
  id = c(2, 5), 
  gender = c(1, 2)
)
# 2개 이상의 데이터프레임을 유니언 결합
bind_rows(df_1, df_2, df_3)
# 3개의 데이터프레임을 조인 결합
# case1
total_df <- full_join(df_1, df_2, by='id')
full_join(total_df, df_3, by='id')
# case2
df_1 %>% 
  full_join(df_2, by='id') %>% 
  full_join(df_3, by='id')
# case3
full_join(
  full_join(df_1, df_2, by='id'), df_3, by='id'
)

## 예제 문제 
df_a <- data.frame(
  name = c('test', 'test2', 'test3', 'test4'), 
  company = c('A', 'A', 'B', 'C')
)
df_b <- data.frame(
  name = c('test', 'test2', 'test3', 'test4'), 
  sal = c(1000, 1100, 1200, 1300)
)
df_c <- data.frame(
  company = c('A', 'B', 'C', 'D'), 
  loc = c('seoul', 'busan', 'daegu', 'ulsan')
)
## df_a를 기준으로 df_b, df_c 모두 조인 결합
df_a %>% 
  left_join(df_b, by='name') %>% 
  left_join(df_c, by='company')

install.packages('ggplot2')
library(ggplot2)

## 샘플 데이터셋을 로드 
midwest <- ggplot2::midwest
## 데이터프레임의 정보를 출력
str(midwest)
## 데이터프레임의 크기 출력
dim(midwest)
## 상위 6개 데이터 출력
head(midwest)
## 뷰어창에서 테이블을 확인 
View(midwest)

## 데이터프레임에서 컬럼의 이름을 변경 
## popasian컬럼을 asian
## poptotal 컬럼을 total
## rename(데이터프레임명, 새 컬럼의 이름 = 변경될 컬럼의 이름)
rename(midwest, asian = popasian)
midwest %>% 
  rename(asian = popasian) %>% 
  rename(total = poptotal) -> df
# 특정 컬럼만 추출 
df %>% 
  select(county, total, asian)
df <- df[c('county', 'total', 'asian')]
## 전체 인구수 대비 아시아인의 인구 비율
df$asian / df$total * 100
df %>% 
  mutate(ratio = asian / total * 100) -> df

df[1, 'asian'] / df[1, 'total'] * 100
# 반복문을 이용하여 새로운 컬럼의 데이터 대입 
df[1, 'ratio'] = df[1, 'asian'] / df[1, 'total'] * 100
dim(df)[1] # 데이터프레임의 인덱스의 수
for (i in 1:dim(df)[1]){
  df[i, 'ratio'] = df[i, 'asian'] / df[i, 'total'] * 100
}
df
## while문
## 컬럼을 ratio2를 생성하여 데이터를 대입
i = 1
while (i <= dim(df)[1]){
  df[i, 'ratio2'] = df[i, 'asian'] / df[i, 'total'] * 100
  i = i + 1
}
df
# 특정 컬럼의 제거 (ratio2)
df %>% 
  select(-ratio2)
df %>% 
  select(county:ratio) -> df
## 특정한 조건에 맞춰서 파생변수를 생성하여 데이터 대입
## ratio의 전체 평균 값보다 ratio의 데이터가 크다면 'large'
## 같다면 'middle'
## 작다면 'small'
## 파생변수 group에 대입
df$group <- ifelse(
  df$ratio > mean(df$ratio), 
  'large', 
  ifelse(
    df$ratio == mean(df$ratio), 
    'middle', 
    'small'
  )
)
table(df$group)
qplot(df$group)

# 파이프 연산자를 이용하여 데이터를 정제 
midwest %>% 
  rename(asian = popasian) %>% 
  rename(total = poptotal) %>% 
  select(county, total, asian) %>% 
  mutate(ratio = asian / total * 100) %>% 
  mutate(group = ifelse(
    ratio > mean(ratio), 
    'large', 
    ifelse(ratio == mean(ratio), 'middle', 'small')
    )
  )

## midwest 데이터 정제
## "전체 인구수 대비 미성년자의 인구 비율"


## popadults컬럼의 이름을 adult (rename)
## poptotal 컬럼의 이름을 total (rename)
## county, adult, total 컬럼만 추출 (select)
## child 컬럼을 생성 -> total - adult의 결과를 대입 (mutate)
## child_ratio 컬럼을 생성하여 전체 인구수 대비 미성년자의 인구 비율 대입 (mutate)
## 미성년자의 인구 비율이 높은 상위 5개를 지역을 출력(arrange, head)
midwest %>% 
  rename(adult = popadults) %>% 
  rename(total = poptotal) %>% 
  select(county, adult, total) %>% 
  mutate(child = total - adult) %>% 
  #mutate(child_ratio = child / total * 100)
  mutate(child_ratio = (total - adult) / total * 100) %>% 
  arrange(desc(child_ratio)) %>% 
  head(5) %>% 
  select(county)

## ifelse() 함수와 같은 기능을 하는 함수를 생성
## iftest()함수를 생성
## 매개변수 3개
## c(TRUE, TRUE, FALSE) --> c(2번째인자값, 2번째인자값, 3번째인자값)
iftest <- function(flag, t, f){
  #해당하는 함수를 호출하였을때 결과 값의 타입 -> vector
  result <- c()
  #flag 매개변수는 인자값의 데이터의 타입 : vector
  # flag -> c(TRUE, TRUE, FALSE)
  cnt = 1
  for (i in flag){
    # i변에 대입되는 데이터의 타입 : TRUE|FALSE --> bool
    print(i)
    if (i){
      # i가 TRUE라면 result에 cnt번째의 위치에 t 데이터를 대입
      result[cnt] = t
    }else{
      # i가 FALSE라면 result에 cnt번째의 위치에 f 데이터를 대입
      result[cnt] = f
    }
    cnt = cnt + 1
  }
  return (result)
}
iftest(df$ratio >= mean(df$ratio), 'large', 'small')

iftest(c(TRUE, TRUE, FALSE, FALSE), 'large', 'small')

## 그래프 시각화
mpg <- ggplot2::mpg
View(mpg)
# 산점도 그래프 
ggplot(
  data = mpg, aes(x = displ, y = hwy)
  ) + geom_point()
# 막대 그래프 (빈도수를 기준 막대)
ggplot(
  data = mpg, aes(x = drv)
) + geom_bar()
# 막대 그래프 (x, y 데이터를 모두 대입)
group_data <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))
ggplot(
  data = group_data, 
  aes(x = drv, y = mean_hwy)
) + geom_col()
# 박스플롯
ggplot(
  data = mpg, 
  aes(x = drv, y = hwy)
) + geom_boxplot()

# 라인 그래프 
group_data2 <- mpg %>% 
  group_by(year) %>% 
  summarise(count = n())
group_data2
ggplot(
  data = group_data2, 
  aes(x = year, y=count)
) + geom_line()














