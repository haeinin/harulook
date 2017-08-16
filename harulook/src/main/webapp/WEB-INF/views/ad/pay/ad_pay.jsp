<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- bootstrap�� ����ϱ� ���� CDN�ּ� -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery�� ����ϱ����� CDN�ּ� -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript�ҽ��� ����ϱ� ���� CDN�ּ� -->
<!-- Latest compiled and minified JavaScript -->
<!-- jQuery UI CSS����  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- jQuery �⺻ js���� -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- jQuery UI ���̺귯�� js���� -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
 
<script>
    $(function() {
    	var selectedday;
    	$("#date").change(function(){
    		selectedday = this.value;
    		alert(selectedday);
    		document.getElementById('total').innerHTML = selectedday*50000;
    	});
        $("#testDatepicker" ).datepicker({
        	minDate: +0,
        });
    
    });
    	
</script>
<title>BOARD ADD(spring mvc + mybatis ���)</title>
</head>
<body>
<div class="container">
    <h1>���� ����(spring mvc + mybatis ���)</h1>
    <form id="addForm" action="${pageContext.request.contextPath}/boardAdd" method="post">
    <div class="form-group">
            <label for="boardPw">������ġ</label>
            <select id="adPlace3">
            <option value=""></option>
            <option value="1">ù��°</option>
            <option value="2">�ι�°</option>
            <option value="3">����°</option>
            </select> 
        </div>
    <div class="form-group">
            <label for="boardPw">����ϼ�</label>
            <select id="date">
            <option value=""></option>
            <option value="3">3��</option>
            <option value="7">7��</option>
            <option value="30">30��</option>
            </select> 
        </div>
        <div class="form-group">
            <label for="boardPw">��������</label>
            <input type="text" id="testDatepicker">  
        </div>
        
        <div class="form-group">
            <label for="boardContent">�Ϸ�� ����ݾ� :</label>
            50000
        </div>
        <div class="form-group">
            <label for="boardName">�� �ݾ� :</label>
            <span id="total"></span>
        </div>
        <div>
            <input class="btn btn-default" id="addButton" type="button" value="���Է�"/>
            <input class="btn btn-default" type="reset" value="�ʱ�ȭ"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/boardList">�۸��</a>
        </div>
    </form>
</div>
</body>
</html>