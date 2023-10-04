# java, rJava 설치
install.packages("multilinguer")
# 이때 mac 사용자는 데스크톱 비밀번호를 물어봅니다. 입력해줘야 설치가 진행됩니다.
library(multilinguer)
install_jdk()
# 의존성 패키지 설치
install.packages(c('stringr', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'), type = "binary")
# github 버전 설치
install.packages("remotes")
# 64bit 에서만 동작함
remotes::install_github('haven-jeon/KoNLP', upgrade = "never",INSTALL_opts=c("--no-multiarch"))
