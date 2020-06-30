package service;

import model.Book;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BookListService {
    List<Book> showAllBook();

    Book getBookById(long bookId);

    List<Book> getBookByName(String bookName);

    void confirmBook(long bookId);

    void updateBook(Book book);

    void addBook(String bookName, String describe);

    void removeBook(long bookId);
}
