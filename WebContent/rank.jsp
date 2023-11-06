<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$(function() { 
		$('#b1').click(function() {
			$.ajax({
				url: "data/rank.xml" ,
				success: function(xml) {
					console.log(xml)
					//rank태그를 찾아라 -> 배열 [rank태그, rank태그, rank태그]
					//반복문 이용해서 추출 
					//rank태그내에서도 또 태그가 있다. 또 찾아주어야 한다.
					//name태그, tel태그
					//태그 찾을 때는 find()사용한다. 
					list = $(xml).find('rank')
					$('#d1').empty()
					for(let i = 0; i < list.length; i++){
						name = $(list[i]).find('name').text() //김연아
						tel = $(list[i]).find('tel').text() //010
						console.log(name + " " + tel)
						$('#d1').append(name + " " + tel + "<br>")
					}
				}
			})
		}) //b1
	}) //$
</script>
</head>
<body>
<button id="b1">rank.xml읽어오기</button> <br>
<div id="d1" style="background: yellow">xml결과 넣는 곳</div>
</body>
</html>