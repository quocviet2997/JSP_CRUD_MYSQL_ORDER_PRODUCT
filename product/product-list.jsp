<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../layout/header.jsp"%>
<%@ include file="../layout/navbar.jsp"%>	

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">List of Products</h3>
			<hr>
			<div class="container text-left">
				<a href="<%=request.getContextPath()%>/product/new" class="btn btn-success">Add New Product</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Description</th>
						<th>Type</th>
						<th>InStock</th>
						<th>Price</th>
						<th>Image</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="product" items="${listProduct}">

						<tr>
							<td><c:out value="${product.id}" /></td>
							<td><c:out value="${product.name}" /></td>
							<td><c:out value="${product.description}" /></td>
							<td><c:out value="${product.type}" /></td>
							<td><c:out value="${product.inStock}" /></td>
							<td><fmt:formatNumber type="number" maxFractionDigits="2" value="${product.price}"/></td>
							<td>
								<c:if test="${product.image == null}">
									<img src="<%=request.getContextPath()%>/resources/images/demo_photo.png" alt="No image" width="400" height="200"/>
								</c:if>
								<c:if test="${product.image != null}">
									<img src="<%=request.getContextPath()%>/resources/images/products/${product.image}" alt="No image" width="400" height="200"/>
								</c:if>
							</td>
							<td><a href="edit?id=<c:out value='${product.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?id=<c:out value='${product.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>
<%@ include file="../layout/footer.jsp"%>	