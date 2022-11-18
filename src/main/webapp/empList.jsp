<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
	// 1) Controller
	//session 유효성 검증 코드 후 필요하다면 redirect!
	Object objLoginEmp = session.getAttribute("loginEmp");
	Employee loginEmp = (Employee)objLoginEmp;
	
	String word = request.getParameter("word");
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	String sort = "ASC";
	if(request.getParameter("sort") !=null && request.getParameter("sort").equals("DESC")) {
		sort = "DESC";
	}
	
	// 2) Model
	int rowPerPage = 10;
	// beginRow 알고리즘 코드
	int beginRow = (currentPage-1)*rowPerPage;
	
	// lastPage 알고리즘 코드
	
	// 사원목록
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
	
	// 검색기능 COUNT 알코리즘 코드
	String cntSql = null;
	PreparedStatement cntStmt = null;
	cntSql = "SELECT COUNT(*) cnt FROM employees";
	cntStmt = conn.prepareStatement(cntSql); 
	word="";
	ResultSet cntRs = cntStmt.executeQuery();
	int cnt = 0;
	if(cntRs.next()){
		cnt = cntRs.getInt("cnt");
	}
	int lastPage = (int)(Math.ceil((double)cnt/(double)rowPerPage));
	
	// 오름차순 내림차순 쿼리
	String sql = "SELECT emp_no empNo, first_name firstName, last_name lastName FROM employees ORDER BY first_name ASC LIMIT ?,?";

	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, beginRow);
	stmt.setInt(2, rowPerPage);
	ResultSet rs = stmt.executeQuery();
	ArrayList<Employee> list = new ArrayList<Employee>();
	while(rs.next()) {
		Employee e = new Employee();
		e.setEmpNo(rs.getInt("empNo"));
		e.setFirstName(rs.getString("firstName"));
		e.setLastName(rs.getString("lastName"));
		list.add(e);
	}
	
	// 3) View
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>empList</title>
		<!-- 부트스트랩과의 약속! -->
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
			
	</head>
	<body>
		<div align="center">
			<%=loginEmp.getLastName()%>(<%=loginEmp.getEmpNo()%>)으로 접속하셨습니다.
			<a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
		</div>
		<div><h1 > 사원 목록</h1></div>
		<table class="table table-hover w-auot">
			<tr>
				<th>번호</th>
				<th>
					이름(firstName)
					<%
						if(sort.equals("ASC")) {
					%>
							<a href="<%=request.getContextPath()%>/empList.jsp?currentPage=<%=currentPage%>&sort=DESC">[내림차순]</a>				
					<%		
						} else {
					%>
							<a href="<%=request.getContextPath()%>/empList.jsp?currentPage=<%=currentPage%>&sort=ASC">[오름차순]</a>								
					<%		
						}
					%>
				</th>
				<th>
					이름(lastName)
				</th>
			</tr>
			<%
				for(Employee e : list) {
			%>
					<tr>
						<td><%=e.getEmpNo()%></td>
						<td><%=e.getFirstName()%></td>
						<td><%=e.getLastName()%></td>
					</tr>
			<%
				}
			%>
			<!-- 페이징 -->
			<div>
				
						<a href="<%=request.getContextPath()%>/empList.jsp?currentPage=1&sort=<%=sort%>" style = "text-decoration:none">처음</a>
					 	<%
					 		if(currentPage > 1){
			 			%>		
			 					<a href="<%=request.getContextPath()%>/empList.jsp?currentPage=<%=currentPage-1%>&sort=<%=sort%>" style = "text-decoration:none">이전</a>
			 			<% 
					 		}
					 	%>		
					 			<span><%=currentPage %></span>
					 	<%	
					 		if(currentPage < lastPage){
		 			 	%>
					 			<a href="<%=request.getContextPath()%>/empList.jsp?currentPage=<%=currentPage+1%>&sort=<%=sort%>" style = "text-decoration:none">다음</a>
					 	<%		
					 		}
					 	%>
						<a href="<%=request.getContextPath()%>/empList.jsp?currentPage=<%=lastPage%>&sort=<%=sort%>" style = "text-decoration:none">마지막</a>			
			</div>
		</table>
	</body>
</html>
