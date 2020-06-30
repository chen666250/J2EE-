package controller;

import model.Admin;
import model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import service.AdminService;
import service.BookListService;
import service.OrderService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigInteger;

@org.springframework.stereotype.Controller
@SessionAttributes(value = {"admin"})
public class AdminController implements Controller {
    @Autowired
    private AdminService adminService;

    @Autowired
    private BookListService bookListService;
    @Autowired
    private OrderService orderService;

    @Override
    @RequestMapping("/admin")
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        if (httpServletRequest.getSession().getAttribute("admin") != null) {
            modelAndView.setViewName("adminPageOne");
        } else {
            modelAndView.setViewName("administration");
        }
        return modelAndView;
    }

    @RequestMapping("/Adminlogin")
    public ModelAndView adminLogin(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse
            , @RequestParam("adminName") String adminName, @RequestParam("adminPassword") String adminPassword) throws Exception {
        ModelAndView modelAndView = new ModelAndView("adminPageOne");

        Admin admin = adminService.loginByName(adminName, adminPassword);
        if (admin != null) {
            modelAndView.addObject("admin", admin);
            modelAndView.addObject("message", "欢迎登录管理员");
            System.out.println(admin.getAdminName());
        } else {
            modelAndView.addObject("message", "登录名或密码错误，请重新输入");
        }
        return modelAndView;

    }

    @RequestMapping("/adminLogout")
    public ModelAndView Logout(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {

        httpServletRequest.getSession().setAttribute("admin", null);
        httpServletRequest.getSession().invalidate();
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("admin", null);
        return modelAndView;
    }

    @RequestMapping("/returnViaBookId")
    public ModelAndView handleRequest3(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @RequestParam("bookId") long bookId) throws Exception {

        ModelAndView modelAndView = new ModelAndView("adminPageOne");

        Book book = bookListService.getBookById(bookId);
        if (book == null) {
            modelAndView.addObject("message", "该书不存在");

        } else if (!book.getStatus().equals("RENT")) {
            modelAndView.addObject("message", "该书未在租借中");

        } else {
            book.setStatus("STOCK");
            bookListService.updateBook(book);
            orderService.finishOrder(bookId);
            modelAndView.addObject("message", "还书成功");
        }
        return modelAndView;


    }


}
