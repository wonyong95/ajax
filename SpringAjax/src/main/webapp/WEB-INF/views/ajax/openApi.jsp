<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>openApi.jsp</title>
<!-- CDN 참조-------------------------------------- -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- ------------------------------------------------- -->
<script type="text/javascript">
	$(function(){
		//자바스크립트 cors 정책에 위배되어 네트워크 통신 불가능
		//==>대신 자바로 네이버에 요청을 보내보자. NaverBookProxy.java
		let url='https://openapi.naver.com/v1/search/book.json?query=Ajax'
		$.ajax({
			type='GET',
			url:url,
			dataType:'json',
			cache:false,
			headers:{
				'X-Naver-Client-Id:':'BQhy7sidsTLESCmN0MCC',
				'X-Naver-Client-Secret:':'vunTa3TkS0'
			}
		})
		.done((res)=>{
			alert(res)
		})
		.fail((res)=>{
			alert('error: '+res.status+", message: "+res.responseText)
		})
	})
</script>
</head>
<body>
<div class="section">
	<div class="container">
		<h1>Naver Open Api Book</h1>
	
		<div class="col-md-1 col-md-offset-1">
		<label>도서검색</label>
		</div>
		<div class="col-md-8">
		<input type="text" name="book" class="form-control">
		</div>
		<div class="col-md-2">
		<button id="search" class="btn btn-primary">검색</button>
		</div>
		<div id="msg"></div>
		<div id="paging"></div>
		<div id="result"></div>
	</div>
</div>
</body>
</html>