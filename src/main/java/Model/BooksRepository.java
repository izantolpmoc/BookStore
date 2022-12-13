package Model;

import Bean.Book;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BooksRepository {
    public List<Book> getAllBooks() {
        MyDb db = new MyDb();
        Connection con = db.getCon();
        Statement stm = null;
        List<Book> books = new ArrayList<>();
        try {

            stm = con.createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM books ORDER BY title");
            while(rs.next())
            {

                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setDescription(rs.getString("description"));
                book.setPhoto(rs.getString("photo"));

                books.add(book);
//                System.out.println(rs.getString("id")); //or rs.getString("column name");
//                System.out.println(rs.getString(2));
//                System.out.println(rs.getString(3));
//                System.out.println(rs.getString(4));
//                System.out.println(rs.getString(5));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return books;
    }

    public Book getBookById(int id) {
        MyDb db = new MyDb();
        Connection con = db.getCon();
        Statement stm = null;
        Book book = new Book();
        try {
            stm = con.createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM books WHERE id='"+ id +"'");
            while(rs.next())
            {
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setDescription(rs.getString("description"));
                book.setPhoto(rs.getString("photo"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return book;
    }

    public List<Book> getLatestBooks() {
        MyDb db = new MyDb();
        Connection con = db.getCon();
        Statement stm = null;
        List<Book> books = new ArrayList<>();
        try {

            stm = con.createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM books ORDER BY id DESC LIMIT 3");
            while(rs.next())
            {

                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setDescription(rs.getString("description"));
                book.setPhoto(rs.getString("photo"));

                books.add(book);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return books;
    }

    public List<Book> searchBooks(String key) {
        MyDb db = new MyDb();
        Connection con = db.getCon();
        Statement stm = null;
        List<Book> books = new ArrayList<>();
        try {

            stm = con.createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM books " +
                    "   WHERE title LIKE '%"+key+"%'" +
                    "   OR author LIKE '%"+key+"%'" +
                    "   OR description LIKE '%"+key+"%' " +
                    "ORDER BY title");
            while(rs.next())
            {

                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setDescription(rs.getString("description"));
                book.setPhoto(rs.getString("photo"));

                books.add(book);
//                System.out.println(rs.getString("id")); //or rs.getString("column name");
//                System.out.println(rs.getString(2));
//                System.out.println(rs.getString(3));
//                System.out.println(rs.getString(4));
//                System.out.println(rs.getString(5));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return books;
    }
}
