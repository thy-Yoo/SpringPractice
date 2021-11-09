### 개인기록용

#### 기능 추가 1 - 카테고리별 데이터 출력 기능

##### DAO
```Java
//2-2. 신간 - 도서목록 출력기능 + 카테고리 선택기능
public List<BookVO> bookNewListData_SelectCate(HashMap<String, Object> map) {
	return mapper.bookNewListData_SelectCate(map);
}
```

##### Mapper
직접 크롤링한 데이터가 아닌, 팀원이 넣어둔 데이터 였기에 함부로 DB를 수정할 수 없었다. <br>
중복값과 일부 비어있는 null값들이 테이블에 많아서 조건절로 제외해주었다. 
```Java
//2-2. 신간 - 도서목록 출력기능. + 카테고리 선택기능.
@Select("SELECT bno,title,image,sale,pubdate,genre,cno2,num "
			+"FROM (SELECT bno,title,image,sale,pubdate,genre,cno2,rownum as num "
			+"FROM (SELECT bno,title,image,sale,pubdate,genre,cno2 "
			+"FROM book_data "
			+ "WHERE pubdate IS NOT NULL AND cno2 IS NOT NULL AND genre LIKE '%'||#{cate}||'%' "
			+ "ORDER BY pubdate DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<BookVO> bookNewListData_SelectCate(HashMap<String,Object> map);
  
  // cno2 IS NOT NULL: DB내 중복 제거. 
  // pubdate IS NOT NULL: 신간 도서 페이지 이기 때문에 출판일 정보 없는 책은 제외.
  // #cate: jsp에서 사용자가 메뉴를 클릭하여 전송한 값을 받아오는 변수.
```

	
##### Controller	
jsp의 form 태그를 통해 받아온 데이터를 적절히 활용하여, Mapper 클래스에서 이용할 수 있도록 하였다. 	
  
```Java
	//카테고리 선택 - 목록출력			
	@RequestMapping("book/newlistSelectCate.do")
		public String book_menu_category(String page, Model model, int select) {
		HashMap<String, Object> map=new HashMap<String, Object>();
				
		//카테고리 선택
		int whatCate = select;	
		//System.out.println("whatCate에 들어간 값은"+whatCate+"입니다.");
		if(whatCate==1) {
			map.put("cate", "소설");
		}
		else if(whatCate==2){
			map.put("cate", "시/에세이");
		}
		else if(whatCate==3){
			map.put("cate", "인문");
		}
		else if(whatCate==4){
			map.put("cate", "사회과학");
		}
		else if(whatCate==5){
			map.put("cate", "예술/대중문화");
		}
		else if(whatCate==6){
			map.put("cate", "가정과 생활");
		}
		else if(whatCate==7){
			map.put("cate", "유아");
		}
		else if(whatCate==8){
			map.put("cate", "국어/외국어/사전");
		}
		else if(whatCate==9){
			map.put("cate", "자기계발");
		}			
		else { //값이 들어오지 않았을 때 확인 용.
			System.out.println("select에 들어간 값은"+select+"입니다.");
			//System.out.println("데이터형은"+select.getClass().getName()+"입니다.");
		}
		
		List<BookVO> list=dao.bookNewListData_SelectCate(map);
     /* ... 페이징 처리 구문, 미완성이라 생략 ... */
	  
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../book/newlist.jsp");				
		return "main/main";
	}
```
  
##### jsp
- Controller로 데이터를 전송하기 위해 form 태그를 사용하였다. <br>
	기존 레이아웃은 li,a 태그로 이루어져있었는데, form 없이 a 태그의 onclick 이벤트로 데이터를 전송하려 하였으나 실패하여 수정하였다. <br>
	Javascript는 필요할 때 검색해보는 정도로 공부하였는데 기초를 다져야겠다. <br>
- 의문점 : "1"이 아닌 "소설"이라는 단어를 전송하자 <br>
	println(select)에서는 데이터가 읽어졌으나, if(select=="소설")에서는 null값으로 처리되었다. <br>
	println(select.getClass().getName())로 출력해본 데이터형은 String이었는데, 왜 인식이 안되는지 공부해야한다. <br>
	unicode 한글변환과 관련이 있는건가? <br>

```HTML
<h4>분류</h4>
	<form action="newlistSelectCate.do" type="post">
		<input type="hidden" name="select" value="1" />
		<input type="submit" class="category_menus" value="소설">
	</form>
	<form action="newlistSelectCate.do" type="post">
		<input type="hidden" name="select" value="2" />
		<input type="submit" class="category_menus" value="시/에세이">
	</form>
	
	<!-- 3-7 생략, hidden으로 input태그를 숨겨서 필요한 데이터를 전송하도록 구현하였다.-->

	<form action="newlistSelectCate.do" type="post">
		<input type="hidden" name="select" value="8" />
		<input type="submit" class="category_menus" value="국어/외국어/사전">
	</form>
	<form action="newlistSelectCate.do" type="post">
		<input type="hidden" name="select" value="9" />
		<input type="submit" class="category_menus" value="자기계발">
	</form>
```
