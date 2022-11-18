<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   // session 유효성 검증 코드 후 필요하다면 redirect!
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginForm</title>
		<!-- 부트스트랩과의 약속! -->
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
		
		<!--스타일 -->
		<style>
		
		.table {
		    width: 60%;
		    height: 100px;
		    margin: auto;
		    text-algin:center;
		 }   
		
		.btn_login .btn_text {
		    font-size: 20px;
		    font-weight: 700;
		    line-height: 24px;
		    color: #483D8B;
		}
		.btn_text1 {
		    font-size: 20px;
		    font-weight: 700;
		    line-height: 24px;
		    color: #6495ED; 
		}
		
		</style>
	</head>
	<body>
		<div align="center">
		   <h1>로그인</h1>
			   <form action="<%=request.getContextPath()%>/loginAction.jsp">
			      <table border="1">
			         <tr>
			            <td><span class="btn_text1"> 사원번호 </span></td>
			            <td><input type="text" name="empNo"></td>
			         </tr>
			         <tr>
			           <td><span class="btn_text1">퍼스트네임</span></td>
			            <td><input type="text" name="firstName"></td>
			         </tr>
			         <tr>
			             <td><span class="btn_text1">라스트네임</span></td>
			            <td><input type="text" name="lastName"></td>
			         </tr>
			      </table>
			      <button type="submit" class="btn_login"><span class="btn_text">로그인</span></button>
			   </form>
	   </div>
	</body>
</html>