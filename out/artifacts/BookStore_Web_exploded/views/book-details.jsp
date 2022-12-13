<%@ page import="Bean.Book" %>
<jsp:include page="_header.jsp"></jsp:include>
<%
  Book book = (Book) request.getAttribute("book");
%>

<h1><%= book.getTitle()%></h1>
<div class="container d-md-flex mb-3" style="gap: 20px">
  <img class="details-img mb-3" src="<%= book.getPhoto() %>">
  <div>
    <h2><%= book.getAuthor()%></h2>
    <p><%= book.getDescription()%></p>
    <a href="basket?id=<%= book.getId() %>" class="btn btn-secondary d-block my-2" style="width: fit-content;">Buy - <span class="card-link"><%= book.getPrice() %> $</span></a>
  </div>
</div>

<jsp:include page="_footer.jsp"></jsp:include>