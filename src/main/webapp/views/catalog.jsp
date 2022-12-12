<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Bean.Book" %>
<jsp:include page="_header.jsp"></jsp:include>

    <h1>Catalog</h1>

<div class="container d-flex justify-content-between">
    <jsp:useBean id="books" scope="request" type="java.util.ArrayList"/>
    <c:forEach items="${books}" var="book">
        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title"><c:out value="${book.title}"/></h5>
                <h6 class="card-subtitle mb-2 text-muted"><c:out value="${book.author}"/></h6>
                <p class="card-text"><c:out value="${book.description}"/></p>
                <span class="card-link"><c:out value="${book.price}"/> $</span>
                <a href="#" class="card-link">Buy</a>
            </div>
        </div>

    </c:forEach>
</div>
<jsp:include page="_footer.jsp"></jsp:include>
