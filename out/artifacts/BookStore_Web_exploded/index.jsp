<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="views/_header.jsp"></jsp:include>

        <h1><%= "Welcome to BookStore !" %></h1>
        <br/>

        <div class="container">

                <jsp:useBean id="books" scope="request" type="java.util.ArrayList"/>
                <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
                        <h2>Latest items</h2>
                        <div class="carousel-indicators">
                                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                                <c:forEach items="${books}" var="book">
                                        <c:choose>
                                                <c:when test="${ books.get(0) == book }"><div class="carousel-item active"></c:when>
                                                <c:otherwise><div class="carousel-item"></c:otherwise>
                                        </c:choose>
                                                <img src="${book.photo}" class="d-block w-100" alt="${book.title}">
                                                <div class="carousel-caption d-none d-md-block">
                                                        <h5>${book.title}</h5>
                                                        <p>${book.description}</p>
                                                </div>
                                        </div>

                                </c:forEach>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                        </button>
                </div>
        </div>
        <a href="catalog">All books</a>

<jsp:include page="views/_footer.jsp"></jsp:include>