package controller;

import model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import service.BookListService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.IllegalFormatCodePointException;
import java.util.List;

@org.springframework.stereotype.Controller
public class SearchController implements Controller {

    @Autowired
    private BookListService bookListService;



    @RequestMapping("/searchBook")
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        ModelAndView modelAndView = new ModelAndView("searchResult");

        return modelAndView;
    }

    @RequestMapping("/searchBookName")
    public ModelAndView handleRequest2(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @RequestParam("bookName") String bookName) throws Exception {
        ModelAndView modelAndView = new ModelAndView("searchResult");
        List<Book> books = bookListService.getBookByName(bookName);

        if (books.isEmpty()){
            modelAndView.addObject("message", "无结果");
        }
        modelAndView.addObject("result", books);
        System.out.println("searched"+books);
        return modelAndView;
    }
}
