# SpringPractice

### BookStore
###### 개인적으로 도서 사이트를 제작해보고, 팀에서 담당하지 않았던 부분들을 만들어보기 위해 만든 장소입니다. 
##### 01 
- 알라x 사이트에서 국내 도서 - 소설/시/희곡 데이터 크롤링 작업

---

### TeamDev 
###### 팀 프로젝트 완성본과 제가 제작한 부분을 저장해둔 장소입니다. <br>

### TeamMyDev
###### 팀프로젝트에서 제가 제작한 부분을 기록하고 복습하기 위한 장소입니다.
##### 01
- 신간 도서페이지 Spring 토대 작업, Book List 출력, 페이징처리, 상세페이지 연결, 리뷰DB 연결.
##### 02
- 동적 쿼리를 이용한 카테고리별 출력 기능 구현 (form 태그와 jsp파일 데이터 주고받기). 
- 해야할 일 : 페이징 처리 수정, Login Sesseion 이용하여 리뷰 입력 구현, form없이 a태그-Javascript 이용해서 주고받는 방식 공부. 

---



### 스프링을 사용하는 목적
#### DI (의존성 주입 Dependency Injection) ⭐⭐⭐ 
구성 요소 간의 __의존도를 소스코드 내부를 통해서가 아닌 외부 설정을 통해서__ 이루어지도록 개발하여 <br>
의존성이 있는 경우 프레임워크를 통해 연결시켜주어 코드 재사용성의 효율을 높이고, <br>
결합도를 낮추어서 한 요소가 작동하지 않더라도 다른 요소에 영향을 최소화 한다. <br>


---

### 각 파일 기능 설명
#### 구조
- __package com.sist.crawler__ : 웹에서 데이터를 수집하여 VO에 저장하고, 저장한 데이터를 Oracle DB에 넣는 기능들을 구현하는 패키지. <br>
(제작할 페이지와 독립적으로 데이터를 수집하는 부분이라서 .dao와 다른 패키지로 분류해보았다.)<br>
- __package com.sist.dao__ : 페이지에서 데이터를 사용하기 위해 DB에 접근하는 기능들을 구현하는 패키지. <br>
기존 DB에 저장된 데이터 출력 기능, 컨트롤러를 통해 페이지로부터 전송받은 데이터를 DB에 입력하고 수정하는 기능 등 <br> 
- __package com.sist.vo__ : 데이터 저장 객체들 모음.
- __package com.sist.web__ : 웹과 데이터를 주고받는 Controller 기능들을 구현하는 패키지.
- __package com.sist.mapper__ : XML에 설정해둔 정보를(SQL접근) 이용하기 위한 Mapper기능들을 구현하는 패키지. <br>
(Java기반 -> Config.java , XML기반 -> web/config/*.xml)

__WEB-INF/config/application-datasource.xml__ : 데이터베이스 관련 정보를 등록하는 파일.  <br>
OracleDB, 트랜젝션, MyBatis, Mapper 관련 정보를 설정한다. 
