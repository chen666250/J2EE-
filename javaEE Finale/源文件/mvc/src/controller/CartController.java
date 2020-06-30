package controller;

import dto.Cart;
import model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.Controller;
import service.BookListService;
import service.CartService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@org.springframework.stereotype.Controller
@SessionAttributes(value = {"cart"})
public class CartController implements Controller {
    @Autowired
    private CartService cartService;
    @Autowired
    private BookListService bookListService;

    @Override
    @RequestMapping("/shopCart")
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        ModelAndView modelAndView = new ModelAndView("mycart");
        String message="";
        Cart cart=null;
              cart = (Cart)httpServletRequest.getSession().getAttribute("cart");

        if( httpServletRequest.getSession().getAttribute("cart")==null){
            cart=new Cart();
        }
        modelAndView.addObject("cart",cart);
        return modelAndView;
    }
    @RequestMapping("/addCart/{bookId}")
    public ModelAndView handleRequest3(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,@PathVariable long bookId) throws Exception {
        System.out.println(bookId);
        Cart cart=(Cart) httpServletRequest.getSession().getAttribute("cart");
        Book book =bookListService.getBookById(bookId);
       cart= cartService.addBooktoCart(cart,book);
       ModelAndView modelAndView = new ModelAndView("mycart");
       modelAndView.addObject("cart",cart);
        return modelAndView;
    }
    @RequestMapping("/cancel/{bookId}")
    public ModelAndView handleRequest4(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,@PathVariable long bookId) throws Exception {

        Cart cart=(Cart) httpServletRequest.getSession().getAttribute("cart");
        Book book = bookListService.getBookById(bookId);
        cart.books.remove(book);
        ModelAndView modelAndView = new ModelAndView("mycart");
        modelAndView.addObject("cart",cart);
        return modelAndView;
    }

}
