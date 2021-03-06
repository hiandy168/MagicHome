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
<title>建材商品</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/jh_admin_style.css">
<script type="text/javascript" src="<%=path %>/js/jh_javascript.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${empty(sessionScope.admin) }">
			<h3 style="color: red;">当前账号已失效，请重新登入</h3>
		</c:when>
		<c:when test="${empty(requestScope.products) }">
			<h3 class="h3_red">暂无商品信息</h3>
		</c:when>
		<c:otherwise>
			<div>
				<h3>根据条件查找：</h3>
				<form action="<%=path %>/admin/condition_query_product" method="post">
					<em>建材商：</em>
					<input type="text" name="supply" placeholder="请输入建材商查找" />
					<em>商品名称：</em>
					<input type="text" name="name" placeholder="请输入商品名称查找" />
					<input type="submit" value="查找" />
				</form>
				<br />
				<table class="table">
					<tr class="title">
						<td>编号</td>
						<td>建材商</td>
						<td>商品名称</td>
						<td>商品价格</td>
						<td>折后价格</td>
						<td>商品</td>
						<td>商品介绍</td>
						<td>创建时间</td>
						<td>是否可用（上架/下架）</td>
					</tr>
					<c:forEach items="${requestScope.products }" var="product" varStatus="s">
						<tr>
							<td>${s.index + 1 }</td>
							<td>${product.supply.name }</td>
							<td>${product.name }</td>
							<td>${product.price }</td>
							<td>${product.sale_price }</td>
							<td class="case_img">
								<a href="javascript:;" onclick="checkImg('<%=path %>/${product.image }')"><img src="<%=path %>/${product.image }" /></a>
							</td>
							<td>${product.des }</td>
							<td>${product.created_time }</td>
							<td>
								<c:choose>
									<c:when test="${product.status == 'Y'}">
										上架
									</c:when>
									<c:when test="${product.status == 'N'}">
										下架
									</c:when>
									<c:otherwise>
									
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div style="text-align: right; padding: 60px;">
				<a href="<%=path %>/admin/query_supply_product_page?pageSize=${requestScope.currentPageSize }">首页</a>
				<a href="<%=path %>/admin/query_supply_product_page?pageNo=${requestScope.currentPage - 1 }&pageSize=${requestScope.currentPageSize }">上一页</a>
				<a href="<%=path %>/admin/query_supply_product_page?pageNo=${requestScope.currentPage + 1 }&pageSize=${requestScope.currentPageSize }">下一页</a>
				<a href="<%=path %>/admin/query_supply_product_page?pageNo=${requestScope.totalPage }&pageSize=${requestScope.currentPageSize }">尾页</a>
				<span>${requestScope.currentPage }</span>/<span>${requestScope.totalPage }</span>
				<span>每页显示数据</span>
				<input type="text" name="pageSize" style="width: 50px;" value="${requestScope.currentPageSize }" form="skip" />
				<input type="submit" value="跳转" form="skip" />
				<input type="text" name="pageNo" style="width: 30px;" form="skip" />
				<span>页</span>
				<form id="skip" action="<%=path %>/admin/query_supply_product_page" method="post"></form>
			</div>
		</c:otherwise>
	</c:choose>
	<div id="check_img" class="check_img" onclick="cancel()"></div>
</body>
</html>