<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
		String path = request.getContextPath();
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看所有案例信息</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/jh_admin_style.css">
<script type="text/javascript" src="<%=path %>/js/jh_javascript.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${empty(sessionScope.company) }">
			<h3 style="color: red;">当前账号已失效，请重新登入</h3>
		</c:when>
		<c:when test="${!empty(requestScope.errorMes) }">
			<h3 style="color: red;">${requestScope.errorMes }</h3>
			<a href="<%=path %>/company/company_case_page">返回</a>
		</c:when>
		<c:when test="${empty(requestScope.companyCases) }">
			<h3 style="color: red;">暂无案例信息</h3>
		</c:when>
		<c:otherwise>
			<div>
				<h3>根据条件查找：</h3>
				<form action="<%=path %>/company/condition_query_company_case" method="post">
					<em>公司名称：</em>
					<input type="text" name="companyName" placeholder="请输入公司名称查找" />
					<em>案例名称：</em>
					<input type="text" name="caseName" placeholder="请输入案例名称查找" />
					<em>小区名称：</em>
					<input type="text" name="plotName" placeholder="请输入小区名称查找" />
					<input type="submit" value="查找" />
				</form>
				<br />
				<table class="table">
					<tr class="title">
						<td>编号</td>
						<td>装修公司</td>
						<td>案例名称</td>
						<td>小区名称</td>
						<td>装修风格</td>
						<td>商品图片1</td>
						<td>商品图片2</td>
						<td>商品图片3</td>
						<td>商品图片4</td>
						<td>商品图片5</td>
						<td>商品描述</td>
						<td>创建时间</td>
						<td style="width: 150px;">操作</td>
					</tr>
					<c:forEach items="${requestScope.companyCases }" var="companyCase" begin="0" varStatus="s">
						<tr>
							<td>${s.index + 1 }</td>
							<td>${companyCase.company.name }</td>
							<td>${companyCase.name }</td>
							<td>${companyCase.plot_name }</td>
							<td>${companyCase.style }</td>
							<td>
								<a href="javascript:;" onclick="checkImg('<%=path %>/${companyCase.image1 }')"><img style="width: 100px; height: 100px;" src="<%=path %>/${companyCase.image1 }" /></a>
							</td>
							<td>
								<a href="javascript:;" onclick="checkImg('<%=path %>/${companyCase.image2 }')"><img style="width: 100px; height: 100px;" src="<%=path %>/${companyCase.image2 }" /></a>
							</td>
							<td>
								<a href="javascript:;" onclick="checkImg('<%=path %>/${companyCase.image3 }')"><img style="width: 100px; height: 100px;" src="<%=path %>/${companyCase.image3 }" /></a>
							</td>
							<td>
								<a href="javascript:;" onclick="checkImg('<%=path %>/${companyCase.image4 }')"><img style="width: 100px; height: 100px;" src="<%=path %>/${companyCase.image4 }" /></a>
							</td>
							<td>
								<a href="javascript:;" onclick="checkImg('<%=path %>/${companyCase.image5 }')"><img style="width: 100px; height: 100px;" src="<%=path %>/${companyCase.image5 }" /></a>
							</td>
							<td>${companyCase.des }</td>
							<td>${companyCase.created_time }</td>
							<td>
								<a href="<%=path %>/company/company_update_case_page?id=${companyCase.id }">修改</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div style="text-align: right; padding: 60px;">
				<a href="<%=path %>/company/query_case_all_page">首页</a>
				<a href="<%=path %>/company/query_case_all_page?pageNo=${requestScope.currentPage - 1 }&pageSize=${requestScope.currentPageSize }">上一页</a>
				<a href="<%=path %>/company/query_case_all_page?pageNo=${requestScope.currentPage + 1 }&pageSize=${requestScope.currentPageSize }">下一页</a>
				<a href="<%=path %>/company/query_case_all_page?pageNo=${requestScope.totalPage }&pageSize=${requestScope.currentPageSize }">尾页</a>
				<span>${requestScope.currentPage }</span>/<span>${requestScope.totalPage }</span>
				<span>每页显示数据</span>
				<input type="text" name="pageSize" style="width: 50px;" value="${requestScope.currentPageSize }" form="skip" />
				<input type="submit" value="跳转" form="skip" />
				<input type="text" name="pageNo" style="width: 30px;" form="skip" />
				<span>页</span>
				<form id="skip" action="<%=path %>/company/query_case_all_page" method="post"></form>
			</div>
		</c:otherwise>
	</c:choose>
	<div id="check_img" class="check_img" onclick="cancel()"></div>
</body>
</html>