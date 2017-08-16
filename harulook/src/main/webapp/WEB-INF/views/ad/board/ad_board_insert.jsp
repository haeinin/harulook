<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#imgInp").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }


    </script>
</head>
<body>
<h2>광고 게시물 등록하기</h2>
<form>
날씨
<select>
<option value="sunny">맑음</option>
<option value="cloud">흐림</option>
<option value="little cloud">구름조금</option>
<option value="rain">비</option>
<option value="snow">눈</option>
<option></option>
</select>	
<br>
이미지
		<img id="blah" src="#" alt="your image" width="100px" height="100px"/>
        <input type='file' id="imgInp" />
</form>        


</body>
</html>