<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Bean.Book" %>
<jsp:include page="_header.jsp"></jsp:include>

    <h1>Catalog</h1>


<div class="container d-md-flex" style="gap: 20px">
    <jsp:useBean id="books" scope="request" type="java.util.ArrayList"/>
    <c:forEach items="${books}" var="book">
    <a class="card-link-container" href="details?id=${book.id}">
        <div class="card mr-4 mt-4 flex-wrap" style="flex: 1;">
            <img src="${book.photo}" class="card-img-top" alt="${book.title}">
            <div class="card-body">
                <h5 class="card-title"><c:out value="${book.title}"/></h5>
                <h6 class="card-subtitle mb-2 text-muted"><c:out value="${book.author}"/></h6>
                <div class="text-truncate-container"><p class="card-text"><c:out value="${book.description}"/></p></div>
                <a href="basket?id=${book.id}" class="btn btn-secondary d-block my-2">Buy - <span class="card-link"><c:out value="${book.price}"/> $</span></a>
            </div>
        </div>
    </a>
    </c:forEach>
</div>
<jsp:include page="_footer.jsp"></jsp:include>
