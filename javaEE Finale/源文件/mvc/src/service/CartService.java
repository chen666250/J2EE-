package service;

import dto.Cart;
import model.Book;
import org.springframework.stereotype.Service;

@Service
public interface CartService {
    Cart returnCart(long userId);

    Cart addBooktoCart(Cart cart, Book book);
}
