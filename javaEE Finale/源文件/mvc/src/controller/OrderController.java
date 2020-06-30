package controller;

import dto.Cart;
import dto.UserOrder;
import model.Book;
import model.Order;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import service.BookListService;
import service.OrderService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@org.springframework.stereotype.Controller
public class OrderController implements Controller {


    @Autowired
    private OrderService orderService;
    @Autowired
    private BookListService bookListService;

    @RequestMapping("/MyOrders")
    @Override
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        User user = (User) httpServletRequest.getSession().getAttribute("user");
        List<Order> orders = orderService.getOrdersByUserId(user.getUserId());
        UserOrder userOrder = orderService.combineUserOrder(user, orders);
        ModelAndView modelAndView = new ModelAndView("main");
        modelAndView.addObject("userOrder", userOrder);
        return modelAndView;
    }


    @RequestMapping("/confirm/{bookId}")
    public String handleRequest2(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @PathVariable long bookId) throws Exception {
        User user = (User) httpServletRequest.getSession().getAttribute("user");
        orderService.creatNewOrder(user, bookId);
//        ModelAndView modelAndView = new ModelAndView("main");
//        modelAndView.addObject("massageOrder","订单已创建");

        return "redirect:/MyOrders";

    }

    @RequestMapping("/permit/{bookId}")
    public ModelAndView handleRequest3(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @PathVariable long bookId) throws Exception {

        orderService.permit(bookId);

        ModelAndView modelAndView = new ModelAndView("adminPageOne");
        modelAndView.addObject("massagePermit", "订单已批准");

        return modelAndView;

    }

    @RequestMapping("/Orders")

    public ModelAndView handleRequest4(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        ModelAndView modelAndView = new ModelAndView("orderManage");
        List<Order> userOrders = orderService.showAllOrders();
        if(userOrders==null){
            modelAndView.addObject("massageOrder", "当前没有订单");
        }
        modelAndView.addObject("userOrders", userOrders);
        return modelAndView;
    }

}
