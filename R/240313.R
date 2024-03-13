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

## 나이에 따른 평균 임금의 차이가 어떻게 되는가?
## 나이(age)라는 컬럼을 생성 : 현재년도(2015) - 태어난 년도(birth)
## income 데이터에서 결측치를 제외
## age를 기준으로 그룹화
## 그룹화 연산 income의 평균값을 출력
## 그래프로 시각화 
## 가장 평균 임금이 높은 나이를 출력
df %>% 
  # 나이라는 컬럼을 생성 
  mutate(age = 2015 - birth) %>% 
  # income의 결측치를 제외
  filter(!is.na(income)) %>% 
  # age를 기준으로 그룹화
  group_by(age) %>% 
  # 그룹화 연산은 income 평균
  summarise(income_mean = mean(income)) -> age_income
## 그래프 시각화
ggplot(
  data = age_income, aes(x = age, y = income_mean)
) + geom_col()
age_income %>% 
  arrange(desc(income_mean)) %>% 
  head(1)

## 연령대별 평균 임금의 차이를 확인
## 나이가 40 미만이면 'young'
## 나이가 40 이상 60 미만이면 'middle'
## 나이가 60 이상이면 'old'
## ageg 컬럼에 대입 
## ageg를 기준으로 그룹화
## 임금의 평균을 출력 
df %>% 
  mutate(age = 2015 - birth, 
         ageg = ifelse(
           age < 40, 
           'young', 
           ifelse(
             age < 60, 
             'middle', 
             'old'
           )
         )) %>% 
  group_by(ageg) %>% 
  summarise(income_mean = mean(income, na.rm = T)
            ) -> ageg_income
# 그래프 시각화 (그래프의 x축의 순서를 커스텀)
ggplot(
  data = ageg_income, aes(
    x = ageg, y = income_mean)
) + geom_col() + scale_x_discrete(
  limits = c('young', 'middle', 'old')
)

## 지역별 평균 임금을 확인하자
df$loc
df %>% 
  filter(!is.na(income)) %>% 
  group_by(loc) %>% 
  summarise(income_mean = mean(income))-> loc_income

ggplot(
  data = loc_income, aes(x = loc, y=income_mean)
) + geom_col()

## 연령대, 성별을 기준으로 평균 임금 그래프 시각화
df %>% 
  mutate(age = 2015 - birth, 
         ageg = ifelse(
           age < 40, 'young', ifelse(
             age < 60, 
             'middle', 
             'old'
           )
         )) %>% 
  group_by(ageg, gender) %>% 
  summarise(income_mean = mean(income, na.rm=T)
            ) -> ageg_gender_income
ggplot(
  data = ageg_gender_income, 
  aes(x = ageg, y = income_mean, fill = gender)
) + geom_col(
  position='dodge'
) + scale_x_discrete(
  limits = c('young', 'middle', 'old')
)

## 직업별 평균 임금 
## df에는 직업코드만 존재 
## codebook 파일에 2번째 시트에 직업코드별 직업명
## codebook 파일을 로드 
# 엑셀 데이터 로드하기 위한 패키지 설치 
install.packages('readxl')
library(readxl)
code_book <- read_excel("./csv/Koweps_codebook.xlsx", 
                        sheet = 2)
code_book

## df와 code_book를 조인 결합 (left_join)
total_df <- left_join(df, code_book, by='code_job')
head(total_df)

## 직업 별로 평균 임금 
## 월급이 높은 상위 10개의 직업을 확인 
## 10개의 데이터를 그래프로 표시 
total_df %>% 
  filter(!is.na(income) & !is.na(job)) %>% 
  group_by(job) %>% 
  summarise(income_mean = mean(income)) %>% 
  arrange(desc(income_mean)) %>% 
  head(10) -> top10
ggplot(
  data = top10, aes(x = reorder(job, income_mean), 
                    y = income_mean)
) + geom_col() + coord_flip()

## 나이, 성별 그룹화 라인 그래프 시각화
df %>% 
  filter(!is.na(income)) %>% 
  mutate(age = 2015 - birth) %>% 
  group_by(age, gender) %>% 
  summarise(income_mean = mean(income)) -> age_income
# 라인 그래프 
ggplot(
  data = age_income, aes(
    x = age, y = income_mean, color=gender)
) + geom_line() -> a

total_df %>% 
  arrange(-income) %>% 
  head(1)

# 인터렉티브 그래프를 위한 패키지 
install.packages('plotly')
library(plotly)
ggplotly(a)

