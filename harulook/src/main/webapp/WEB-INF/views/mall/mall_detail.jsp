<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
쇼핑몰 디테일

<table>
         <tbody>
             <tr>
                <td>상품번호 :</td>
                <td>${dto.mallProNo}</td>
               </tr>
            <tr>
                   <td>상품 카테고리 :</td>
                   <td>${dto.mallProCate}</td>
            </tr>
            <tr>
                   <td>상품가격 :</td>
                   <td>${dto.mallProPrice}</td>
            </tr>
            <tr>
                   <td>상품이름 :</td>
                   <td>${dto.mallProName}</td>
            </tr>
            
        </tbody>
        <input type="button" value="구입하기">
    </table>


</body>
</html>