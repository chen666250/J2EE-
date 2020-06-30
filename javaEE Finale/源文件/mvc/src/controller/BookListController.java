package controller;

import model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import service.BookListService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@org.springframework.stereotype.Controller
public class BookListController implements Controller {
    @Autowired
    private BookListService bookListService;

    @Override
    @RequestMapping("/showBooks")
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {

        ModelAndView modelAndView = new ModelAndView("main");
        List<Book> books = bookListService.showAllBook();
        modelAndView.addObject("books", books);
        return modelAndView;
    }

    @RequestMapping("/adminShowBooks")
    public ModelAndView handleRequest2(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        System.out.println("test adminshowbook");
        ModelAndView modelAndView = new ModelAndView("adminPageOne");
        List<Book> books = bookListService.showAllBook();
        modelAndView.addObject("books", books);
        return modelAndView;
    }

    @RequestMapping("/AddNEW")
    public ModelAndView toAddNew(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        ModelAndView modelAndView = new ModelAndView("addBook");
        return modelAndView;
    }

    @RequestMapping("/AddBook")
    public ModelAndView AddNewBook(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                                   @RequestParam("bookName") String bookName, @RequestParam("describes") String describes) throws Exception {
        ModelAndView modelAndView = new ModelAndView("addBook");
        System.out.println(bookName);
        bookListService.addBook(bookName, describes);

        modelAndView.addObject("messageADD", "添加成功");
        return modelAndView;
    }

    @RequestMapping("/remove/{bookId}")
    public String removeBook(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                             @PathVariable long bookId) throws Exception {
        bookListService.removeBook(bookId);
        System.out.println("delete a book" + bookId);
        return "redirect:/adminShowBooks";

    }

    @RequestMapping("/Modify/{bookId}")
    public ModelAndView modifyBook(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                                   @PathVariable long bookId) throws Exception {
        Book book = bookListService.getBookById(bookId);
        ModelAndView modelAndView = new ModelAndView("modifyBook");
        modelAndView.addObject("Book", book);
        return modelAndView;

    }

    @RequestMapping("/modifyThis")
    public ModelAndView modifyThis(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                                   @RequestParam("bookName") String bookName, @RequestParam("describes") String describes, @RequestParam("bookId") long bookId) throws Exception {
        Book book = bookListService.getBookById(bookId);
        book.setBookName(bookName);
        book.setDescribes(describes);
        bookListService.updateBook( book);
        ModelAndView modelAndView = new ModelAndView("modifyBook");
        modelAndView.addObject("Book", book);
        modelAndView.addObject("messageModify", "成功修改");
        return modelAndView;

    }
}
