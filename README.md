# MAP
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
     - getUserProjects (String id) returns ProjectBean(ArrayList)
       - 유저에 해당되는 모든 프로젝트 정보 불러오기
     - getUserInformation(String userId) returns MemberBean
       - 유저 정보 불러오기
     - quitProject(int projectId, String userId) returns Result (success : 0, error : -1)
       - 프로젝트 탈퇴
     - getUserInformation(String userId) returns MemberBean
       - 사용자 정보
     - updateUserInformation(MemberBean mb) returns Result (success : 0, error: -1)
       - 사용자 정보 업데이트
     - checkIdExists(String Id) returns Result (사용가능 : 0, 사용불가 : 1, 오류: -1)
       - 아이디가 사용중인지 확인
       
   - ProjectMgr
     - getProjectInformation(int projectId) returns ProjectBean
        - 프로젝트 정보 불러오기
     - getProjectMembers(int projectId) returns MemberBean(ArrayList)
        - 프로젝트 구성원 불러오기
     - addProjectMember(int projectId, String memberId) returns Result (success : 0, error : -1)
        - 프로젝트 구성원 추가
     - removeProjectMember(int projectId, String memberId) returns Result (success : 0, error : -1)
        - 프로젝트 구성원 삭제
     - addProject(ProjectBean pb) returns 추가된 프로젝트의 ID
        - 프로젝트 추가
     - removeProject(int projectId) returns Result (success : 0, error : -1)
        - 프로젝트 삭제
     - getUserProjectCount(String memberId) returns ProjectCount
        - 특정 사용자가 소속되어 있는 프로젝트 카운트 
        
        
