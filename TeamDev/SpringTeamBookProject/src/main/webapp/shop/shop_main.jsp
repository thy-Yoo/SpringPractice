<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=887e79943135c942ddc000c57f528937"></script>


<style>
	.shop_bar{
	    border-top: outset;
		overflow:auto;
		height:450px;
	}
	.shop_bar::-webkit-scrollbar-thumb{
    	background-color: #dddddd;
    }
    .shop_bar::-webkit-scrollbar {
    width: 4px;
    
	}
	.shop{
		position:relative;
	}
	.store_search_wrapper .store_search_layer {
    position: absolute;
    left: 20px;
    top: 20px;
    z-index: 3;
    width: 340px;
    height: 678px;
    padding: 0 29px;
    background-color: #fffffff0;
    border: 1px solid #dddddd;
}
.bookstore {
    position: absolute;
    left: 375px;
    top: 20px;
    z-index: 3;
    width: 340px;
    height: 378px;
    padding: 0 29px;
    background-color: #fffffff0;
    border: 1px solid #dddddd;
	}
	.bookstore th{
		width:80px;
	}
	.bookstore td{
		width:200px;
	}
	.content{
		position: relative;
	}
	.search__sidebar__item span {
    font-size: 13px;
    color: #999999;
    display: block;
    letter-spacing: -0.045em;
    line-height: 23px;
    
}
	h6.name{
	    color: #292929;
	    font-size: 18px;
	    font-weight: bold;
	    padding-bottom: 14px;
	    display: block;
    }
    b.page:hover{
		cursor:pointer;
    }
    
button.float-right {
    right: 5px;
    height: 30px;
    position: absolute;
    background-color:white;
}
.blog__sidebar__search input {
    width: 100%;
    height: 46px;
    font-size: 16px;
    color: #6f6f6f;
    padding-left: 15px;
    border: 1px solid #e1e1e1;
    border-radius: 20px;
}
.blog__sidebar__search button {
    font-size: 16px;
    color: #6f6f6f;
    background: transparent;
    border: none;
    position: absolute;
    right: 0;
    top: 0;
    height: 100%;
    padding: 0px 18px
;
}

</style>
</head>
<body>
<div class="content">

	<div class="store_search_wrapper">
	    <div id="map" style="width:100%; height:700px"></div>
	 	<div class="store_search_layer">
	 			<h4 class="text-center" style="padding:15px"><b>매장찾기</b></h4>
				<div class="blog__sidebar__search">
						<form onsubmit="return false">
						<input type="text" placeholder="지역 또는 매장 찾기" v-model="ss">
						<button v-on:click="searchList(),pageRiset()">
							<span class="icon_search"></span>
						</button>
						</form>
				</div>
				<div style="margin-bottom: 10px;" v-if="shop_data.length!=0">검색결과 총 {{total}}건</div>
				<div style="margin-bottom: 10px;" v-else>검색결과가 없습니다</div>
				<div class="search__sidebar__item">
						<div class="search__sidebar__recent shop_bar">
							<div v-for="(vo,index) in shop_data" :key="vo.id">
								 <div class="search__sidebar__recent__item" v-on:click="clickData(index)">
									<div class="search__sidebar__recent__item__text">
										<h6 class=name>{{vo.name}}</h6>
										<span>{{vo.addr}}<br></span>
										<span>연락처: {{vo.tel}}</span>
										<span v-if="vo.open">영업시간: {{vo.open}} - {{vo.close}}</span>
										<hr>
									</div>
								</div>
							</div>
						</div>
				</div>
			<div class="page" style="text-align:center">
				<b class="page" href="#" v-on:click="paging(page-1)" v-show="page>1">&lt;</b>{{page}}/{{totalpage}}<b class="page" href="#" v-on:click="paging(page+1)" v-show="page<totalpage">&gt;</b>
			</div>
			</div>
						
						<div class="row bookstore" v-if="show">
							<h4 style="padding:0px">{{shop_detail.name}}</h4>
							<table class="table" style="table-layout:fixed; height:320px">
									<button class="float-right" v-on:click="show=false">X</button>
								<tr>
									<th width=20%>영업</th>
									<td width=80% v-if="shop_detail.open">{{shop_detail.open}} ~ {{shop_detail.close}}</td>
									<td width=80% v-if="!shop_detail.open">등록된 영업시간이<br> 없습니다</td>
								</tr>
								<tr>
									<th width=20%>휴무</th>
									<td width=80%>{{shop_detail.hday}}</td>
								</tr>
								<tr>
									<th width="20%">주소</th>
									<td width=80%>{{shop_detail.addr}}</td>
								</tr>
								<tr>
									<th width="20%">번호</th>
									<td width=80%>{{shop_detail.tel}}</td>
								</tr>
								<tr>
									<th width=20%>소개</th>
									<td width=80%>{{shop_detail.optn}}</td>
								</tr>							
							</table>
						</div>
					</div>
	   </div>
	   <jsp:include page="${shop_board}"></jsp:include>
</body>
<script>
	new Vue({
		el:'.store_search_wrapper',
		data:{
			la:37.2758569,
			lo:127.1512767,
			shop_data:[],
			shop_detail:{},
			ss:"",
			total:"",
			totalpage:"",
			page:1,
			show:false,
			tag:""
		},
		mounted:function(){
			// default 출력
			this.commonFunc();
			this.kakaoMap(this.la,this.lo);
		},
		// 사용자 정의 함수=> 이벤트 처리
		methods:{
			
			commonFunc:function(){
				axios.get("http://localhost:8080/web/shop/shop_main.do",{
					params:{
						page:this.page
					}
				}).then(res=>{
					console.log(res.data);
					this.shop_data=res.data;
					this.totalpage=res.data[0].totalpage;
					this.total=res.data[0].total;
				})
			},
			searchList:function(){
				axios.get("http://localhost:8080/web/shop/shop_search.do",{
					params:{
						ss:this.ss,
						page:this.page
					}
				}).then(res=>{
					console.log(res.data);
					this.shop_data=res.data;
					this.totalpage=res.data[0].totalpage;
					this.total=res.data[0].total;
				})
				
			},
 			clickData:function(index){
 					
					this.shop_detail=this.shop_data[index];
					console.log(this.shop_detail);
					this.kakaoMap(this.shop_detail.la,this.shop_detail.lo);
					this.show=true;

			},
			kakaoMap:function(la,lo){
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			    mapOption = { 
			        center: new kakao.maps.LatLng(la, lo), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };

				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var map = new kakao.maps.Map(mapContainer, mapOption);
					var markerPosition = new kakao.maps.LatLng(la, lo); 

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
					    position: markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
			
			},
 			paging:function(p){
				this.page=p;
				this.searchList();
 			},
 			pageRiset:function(){
 				this.page=1;
 			}

			
 		}
 		
	})
	
</script>
</html>