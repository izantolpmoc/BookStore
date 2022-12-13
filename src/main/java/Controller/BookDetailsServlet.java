package Controller;

import Bean.Book;
import Model.BooksRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "BookDetailsServlet", value = "/details")
public class BookDetailsServlet extends HttpServlet {
    Book book;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Enumeration enumeration = request.getParameterNames();
        Map<String, Integer> modelMap = new HashMap<>();
        while(enumeration.hasMoreElements()){
            String parameterName = (String) enumeration.nextElement();
            modelMap.put(parameterName, Integer.valueOf(request.getParameter(parameterName)));
            System.out.println(modelMap.get(parameterName));
        }

        BooksRepository booksRepository = new BooksRepository();
        book = booksRepository.getBookById(modelMap.get("id"));

        request.setAttribute("book", book);
        request.getRequestDispatcher("views/book-details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
