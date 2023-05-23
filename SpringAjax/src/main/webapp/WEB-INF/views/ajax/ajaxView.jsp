<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> <!--모바일 반응형 지원 -->

<title>pizza.jsp</title>
<!--CDN 참조  -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<style type="text/css">
	/* body,h2{
		font-family:돋움,돋움체,verdana;
		color:navy;
	} */
</style>

<script type="text/javascript">
	let request=null;
	
	const init=function(){
		try{
			request=new XMLHttpRequest();
			alert(request);
		}catch(err){
			alert('XMLHttpRequset객체 생성 실패');
		}
	}
		
	const getUserInfo=function(){
		if(request==null) init();	
		//사용자가 입력한 전화번호 받아오기
		let vphone=document.getElementById('phone').value;
		//ajax요청을 보내기 위해 XMLHttpRequest객체가 필요하다
		let url='ajaxPizza?phone='+vphone;//url
		request.open('GET', url, true);//요청을 보낼준비를 하는 함수. true를 주면 비동기적인 방식으로 요청을 보낸다. true가 기본값
		request.onreadystatechange=updataPage//응답왔을때 호출할 콜백함수를 지정
		request.send(null);//서버로 요청을 보내는 함수. get방식일때는 null을 전달	
	}	
	const updataPage=function(){
		//alert(request.readyState+"/"+request.status)
		if(request.readyState==4 && request.status==200){
			//응답이 성공적으로 왔다면
			let res=request.responseText;//xml로 응답을 받으면 responseXML속성을 이용
			//alert(res);
			let data=res.split("|");//구분자를 기준으로 쪼개면 token문자열을 배열에 담아 반환함
			let userNo=data[0];
			let target=document.getElementById('userInfo');//div
			let target2=document.getElementById('nonUser');//display:none
			if(parseInt(userN)==0){
				target.innerHTML="";
				target.style.display='none';
				target2.style.display=''
			}else{
				target.innerHTML='<h3 class="text-primary"> 회원번호:'+data[0]+"</h3>"
				target.innerHTML+='<h3 class="text-primary"> 회원이름: '+data[1]+"</h3>"
				target.innerHTML+='<h3 class="text-primary"> 회원주소: '+data[2]+"</h3>"
				
				target.style.display='block';
				target.style.display='none';
			}
		}
	}
	
		window.onload=init;
</script>

</head>
<body>
<div class="section">
<div class="container">
	<h1>Pizza Order Page</h1>
	<form role="form" class="form-horizontal" 
	name="orderF" id="orderF"
	 action="order.jsp" method="POST">
		<div class="form-group">
			<p class="text-info">
			<b>귀하의 전화번호를 입력하세요:</b>
			<input type="text" size="20" name="phone" id="phone"  onchange="getUserInfo()"class="form-control"/>
			</p>
			<p class="text-danger">
			<b>
				귀하가 주문하신 피자는 아래 주소로 배달됩니다.
			</b>	
			</p>
			<div id="userInfo"></div>
			<div id="address"></div>
			<!-- 비회원 입력 폼 : 비회원일 경우 주소입력 폼을 보여주자.-->
			<div id="nonUser" style="display:none;">
				주소: <input type="text" name="addr" id="addr"
						size="60" style="border:2px solid maroon;" class="form-control"/>
			</div>
			<!-- ------------------------------------------- -->
			<p class="text-info">
			<b>주문 내역을 아래에 기입하세요</b></p>
			<p>
				<textarea name="orderList"
				 id="orderList" rows="6" cols="50" class="form-control"></textarea>
			</p>
			<p>
				<input type="submit" value="Order Pizza" class="btn btn-primary"/>
			</p>
		</div>
	</form>
</div>
</div>
</body>
</html>