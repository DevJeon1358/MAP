# Make-A-Face
2018 DGSW 나르샤 - 2학기

DataBase API Information
 - DB.Bean
    - MemberBean
    - ProjectBean
    - FileBean
    - TimeLineBean
    
 - DB.Api
   - AccountMgr
    - ProcLogin(String userId, String password) returns MemberBean
     - 로그인 수행
    - ProcRegister (MemberBean member) returns Result (success : 0, error : -1)
     - 회원가입 수행
    - getUserProjects (String id) returns ArrayList<ProjectBean>
     - 유저에 해당되는 모든 프로젝트 정보 불러오기
  
