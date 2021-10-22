# SpringPractice
스프링 프레임워크 공부용

### 스프링을 사용하는 목적
#### DI (의존성 주입 Dependency Injection) ⭐⭐⭐ 
구성 요소 간의 __의존도를 소스코드 내부를 통해서가 아닌 외부 설정을 통해서__ 이루어지도록 개발하여 <br>
의존성이 있는 경우 프레임워크를 통해 연결시켜주어 코드 재사용성의 효율을 높이고, <br>
결합도를 낮추어서 한 요소가 작동하지 않더라도 다른 요소에 영향을 최소화 한다. <br>


---

### 각 파일 기능 설명
__WEB-INF/config/application-datasource.xml__ : 데이터베이스 관련 정보를 등록하는 파일.  <br>
OracleDB, 트랜젝션, MyBatis, Mapper 관련 정보를 설정한다. 
