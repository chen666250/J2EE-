package provider;

import mapper.BookMapper;
import model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.BookListService;

import java.util.List;
@Service
public class BookListServiceProvider implements BookListService {
    @Autowired
    private BookMapper bookMapper;
    @Override
    public List<Book> showAllBook() {
        return bookMapper.showAllBook();
    }

    @Override
    public Book getBookById(long bookId) {
        return bookMapper.getBookById(bookId);
    }

    @Override
    public List<Book> getBookByName(String bookName) {
        return bookMapper.getBookByName(bookName);
    }

    @Override
    public void confirmBook(long bookId) {
        bookMapper.confrimBook(bookId);
    }

    @Override
    public void updateBook(Book book) {
        bookMapper.updateBook(book);
    }

    @Override
    public void addBook(String bookName, String describe) {
        bookMapper.addBook(bookName,describe);
    }

    @Override
    public void removeBook(long bookId) {
        bookMapper.removeBook(bookId);
    }
}
