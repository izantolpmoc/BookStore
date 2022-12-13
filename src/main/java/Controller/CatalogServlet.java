package Controller;

import Bean.Book;
import Model.BooksRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CatalogServlet", value = "/catalog")
public class CatalogServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BooksRepository data = new BooksRepository();
        List<Book> books = data.getAllBooks();
        request.setAttribute("books", books);
        request.getRequestDispatcher("views/catalog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BooksRepository data = new BooksRepository();
        List<Book> books = data.searchBooks(request.getParameter("key"));
        request.setAttribute("books", books);
        request.setAttribute("key", request.getParameter("key"));
        request.getRequestDispatcher("views/catalog.jsp").forward(request, response);
    }
}
