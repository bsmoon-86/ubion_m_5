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

