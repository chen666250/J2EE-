package controller;

import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import service.UserService;

import javax.jms.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SessionAttributes(value = {"user"})
@org.springframework.stereotype.Controller
public class LoginController implements Controller {
    @Autowired
    private UserService userService;


    @RequestMapping("/login")
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                                      @RequestParam("userName") String userName,
                                      @RequestParam("passWord") String passWord) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.login(userName, passWord);


        if (user != null) {
            if (user.getUserStatus().equals("BLOCK")) {
                modelAndView.setViewName("index");
                modelAndView.addObject("message", "你的用户已被封禁 拜拜");
            } else {

                modelAndView.addObject("user", user);
                modelAndView.addObject("welcomeFlag", 1);
                modelAndView.setViewName("main");
                Cookie thisuser = new Cookie("userName", user.getUserName());
                httpServletResponse.addCookie(thisuser);

            }
        } else {
            modelAndView.addObject("message", "登录名或密码错误，请重新输入");
            modelAndView.setViewName("index");

        }
        return modelAndView;
    }

    @RequestMapping("/Logout")
    public ModelAndView Logout(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {

        httpServletRequest.getSession().invalidate();
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("user", null);
        modelAndView.addObject("cart", null);
        return modelAndView;
    }

    @Override
    @RequestMapping("/")
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        HttpSession session = httpServletRequest.getSession();
        if (session.getAttribute("user") != null) {
            modelAndView.setViewName("main");
        } else {
            modelAndView.setViewName("index");
        }
        return modelAndView;
    }


}
