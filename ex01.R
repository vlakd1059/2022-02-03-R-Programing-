# 데이터 전처리 할때 주로 사용하는 패키지 dplyr

install.packages("dplyr")
library(dplyr)
install.packages("readxl")
library(readxl)

list.files()
score = read_excel("score_10차시.xlsx")
score

# DataFrame의 컬럼명을 바꾸는 함수 -> rename() 
score=score %>% rename(id=학번, grade= 학년, mid = 중간고사, fin= 기말고사, assign= 과제제출, att=출석점수)  
#  %>% : 단축키 ctrl+shift+m

score

# 조건에 맞는 행만 추출하기 filter()
# 조건의 결과가 TRUE인 행만 추출
score
# grade가 1인 행만 출력하기
score %>% filter(grade == 1)
# grade가 1이고 mid점수가 25점 이상인 학생의 행만 출력
score %>% filter(grade ==1 & mid >=25)
## 똑같은결과 - >
# score %>%  filter(grade==1) %>%  filter(mid>=25)

# 원하는 컬럼만 추출하는 함수 select()
names(score) 
score %>% select(grade)
score %>% select(grade,mid)

# 문제 , 1학년 학생들의 중간, 기말 점수 출력
score
score %>% filter(grade==1) %>% select(mid,fin)

# 정렬할때 사용하는 함수 arrange()
score %>% arrange(desc(mid)) # 내림차순
score %>% arrange(mid, fin)


# 4학년 학생들의 기말고사 점수만 내림차순으로 출력하시오
score %>% filter(grade==4) %>% select(fin)%>% arrange(desc(fin))

# 파생변수 만드는 함수 mutate()함수
score=score %>%  mutate(total = mid+fin+assign+att)
score

# 조건을 통해 파생변수 만들고 값 넣기
score = score %>%  mutate(fp = ifelse(total>=60, "pass","fail"))
score

library(dplyr)

list.files()
