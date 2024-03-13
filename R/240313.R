## sav 확장자 파일을 로드 
## 외부의 패키지를 설치 
install.packages('foreign')
library(foreign)
welfare <- read.spss("./csv/Koweps.sav", 
                     to.data.frame = T)
View(welfare)

# 컬럼의 이름을 변경 
library(dplyr)
library(ggplot2)

welfare %>% 
  rename(
    gender = h10_g3, 
    birth = h10_g4, 
    code_job = h10_eco9, 
    income = p1002_8aq1, 
    loc = h10_reg7
  ) -> welfare
## 복사본 데이터를 생성
df <- welfare %>% 
  select(
    gender, birth, loc, code_job, income
  )
## 결측치 확인 : 존재 유무(is) + 결측치(na) -> is.na()
NA == NA
## 결측치는 비교연산자 사용이 불가능하기때문에 함수를 이용
table(is.na(df))
table(is.na(df$gender))
table(is.na(df$birth))
table(is.na(df$loc))
table(is.na(df$code_job))
table(is.na(df$income))

## 데이터를 수정 
## 성별 컬럼의 데이터를 
## 1 : 남자, 2 : 여자,  9 : 무응답
## 성별 컬럼의 데이터의 빈도수를 체크 
table(df$gender)
## 데이터를 1이면 male, 2이면 female
df$gender <- ifelse(
  df$gender == 1, 
  'male', 
  'female'
)
table(df$gender)

##데이터프레임의 base 함수를 이용하여 필터링 
## 남자의 데이터들만 모아서 임금의 평균 
## 여자의 데이터들만 모아서 임금의 평균
male_flag <- df$gender == 'male'
df[male_flag,'income'] -> male_income
mean(male_income, na.rm = T)
female_flag <- df$gender == 'female'
df[female_flag, 'income'] ->female_income
mean(female_income, na.rm=T)
mean(
  df[!male_flag, 'income'], na.rm=T
)

## 패키지를 이용한 방식
# 그룹화 -> 그룹화 연산(결측치를 제외하고 연산)
df %>% 
  group_by(gender) %>% 
  summarise(income_mean = mean(income, na.rm=T))
# 결측치를 제외 -> 그룹화 -> 그룹화 연산
df %>% 
  filter(!is.na(income)) %>% 
  group_by(gender) %>% 
  summarise(income_mean = mean(income))

## income 데이터에서 0, 9999를 결측치로 변환
table(df$income == 0)
table(df$income == 9999)
table(df$income == 0 | df$income == 9999)
table(df$income %in% c(0, 9999))
# case1
ifelse(
  df$income %in% c(0, 9999), 
  NA, 
  df$income
)
#case2
df[
  df$income %in% c(0, 9999),
  'income'
] = NA
table(df$income %in% c(0, 9999))

df %>% 
  filter(!is.na(income)) %>% 
  group_by(gender) %>% 
  summarise(income_mean = mean(income)) -> gender_income
## 그래프 시각화(막대그래프 geom_col() )
ggplot(
  data = gender_income, aes(x = gender, y = income_mean)
) + geom_col()


