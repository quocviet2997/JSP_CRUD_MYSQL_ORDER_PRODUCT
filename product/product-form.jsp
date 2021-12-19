<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../layout/header.jsp"%>
<%@ include file="../layout/navbar.jsp"%>
	
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${action == 1}">
					<form action="update" method="post" enctype="multipart/form-data">
				</c:if>
				
				<c:if test="${action == 2}">
					<form action="add" method="post" enctype="multipart/form-data">
				</c:if>

				<caption>
					<h2>
						<c:if test="${product != null}">
            			Edit Product
            		</c:if>
						<c:if test="${product == null}">
            			Add New Product
            		</c:if>
					</h2>
				</caption>
				
				<c:if test="${product != null}">
					<input type="hidden" name="id" value="<c:out value='${product.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label for="productName">Product Name</label> 
					<input type="text" id="productName" value="<c:out value='${product.name}' />"
						class="form-control" name="name" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label for="productDescription">Product Description</label>
					<input type="text" id="productDescription" value="<c:out value='${product.description}' />"
						class="form-control" name="description">
				</fieldset>

				<fieldset class="form-group">
					<label for="productType">Product Type</label> 
					<select name="type" id="productType" class="form-control">
						<c:forEach var="productType" items="${listProductType}">
							<option value="${productType.id}">${productType.name }</option>
						</c:forEach>
					</select>
				</fieldset>

				<fieldset class="form-group">
					<label for="productInStock">Product In Stock</label> 
					<input type="text" id="productInStock" value="<c:out value='${product.inStock}' />" 
						class="form-control" name="inStock" aria-describedby="inStockValidate">
					<c:if test="${productInStock == false}">
						<small id="inStockValidate" class="form-text text-muted">Vui lòng nhập số lượng tồn kho</small>
					</c:if>
				</fieldset>
				
				<fieldset class="form-group">
					<label for="productPrice">Product Price</label> 
					<input type="text" id="productPrice" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="2" value="${product.price }"/>"
						class="form-control" name="price" aria-describedby="priceValidate">
					<c:if test="${productPrice == false}">
						<small id="priceValidate" class="form-text text-muted">Vui lòng nhập giá sản phẩm</small>
					</c:if>
				</fieldset>
				
				<fieldset class="form-group">
					<label for="productImage">Product Image</label> 
					<input type="file" id="productImage" value="<c:out value='${product.image}' />" 
						name="image" accept="image/*">
					
				</fieldset>
				
				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
<%@ include file="../layout/footer.jsp"%>	