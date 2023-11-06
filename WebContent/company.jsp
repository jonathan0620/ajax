<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.7.1.js"></script>
<script type="text/javascript">
//body 태그에 있는 것 중에서 특정한 것을 선택한 이후에
//선택된 것이 이벤트가 발생했을 때 입력값으로 사용한 이름 없는 함수를 실행시켜줘
//==> 콜백함수.
$(function(){
	$('#b1').click(function() {
		$.ajax({
			url:"data/company.json",
			success: function(arr) {
				alert(arr.length)
				for (var i = 0; i < arr.length; i++) {
					console.log(arr[i].addr)
					console.log(arr[i].domain)
					console.log('-------------')
					$.ajax({
						url: "db_create2.jsp",
						data: {
							id: arr[i].id,
							name: arr[i].name,
							addr: arr[i].addr,
							tel: arr[i].tel,
							domain: arr[i].domain
						},
						success: function(result) {
							console.log(result)
						}
					})
				}
			}
		}) //ajax
	})//b1
	
	$('#b2').click(function(){
		$('#d1').empty()
		$.ajax({
			url:"data/company.xml",
			success: function(xml){
				let list = $(xml).find('record')
				for (let i = 0; i < list.length; i++) {
					let id = $(list[i]).find('id').text() 
					let name = $(list[i]).find('name').text() 
					let addr = $(list[i]).find('addr').text()
					let tel = $(list[i]).find('tel').text()
					let domain = $(list[i]).find('domain').text()
					$('#d1').append(id + " " + name + " " + addr + " " + tel + " " + domain + "<br>")
				}//for
			} //success
		}) //ajax
	}) //b2
})//$
</script>
</head>
<body>
	<button id="b1">company.json 읽어와서 추출하기</button>
	<button id="b2">company.xml 읽어와서 추출하기</button>
	<hr>
	<div id = "d1" style="background: pink"></div>
</body>
</html>