package provider;

import dto.Cart;
import mapper.BookMapper;
import model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.CartService;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Service
public class CartServiceProvider implements CartService {

    @Override
    public Cart returnCart(long userId) {
        return null;
    }

    @Override
        public Cart addBooktoCart(Cart cart, Book book) {

        if(cart==null){
            cart=new Cart();
            System.out.println(cart+"provider create");
        }

        List<Book> books =null;
        if(cart.getBooks()!=null){
           books = cart.getBooks();
        }else{
            books=new ArrayList<>();
        }
        books.add(book);
        HashSet hashSet= new HashSet(books);//hashset去重
        books.clear();
        books.addAll(hashSet);
        cart.setBooks(books);
        return  cart;
    }
}
