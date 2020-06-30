package controller;

import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@org.springframework.stereotype.Controller
public class SignUpController implements Controller {
    @Autowired
    private UserService userService;
    @Override
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        return null;
    }

    @RequestMapping("/signUp")
    public ModelAndView toSignUp(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        ModelAndView modelAndView = new ModelAndView("signup");
        return modelAndView;
    }



    @RequestMapping("/signMeUp")
    public ModelAndView signUpHandler(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @RequestParam("userName") String userName,
                                      @RequestParam("passWord") String passWord) throws Exception {
        ModelAndView modelAndView =new ModelAndView("signup");

        User findUser= userService.isUserExist(userName);
        if(userName.equals("")||passWord.equals("")){

            modelAndView.addObject("message","注册失败 不允许插入空值");
        } else if (findUser!=null) {

            modelAndView.addObject("message","注册失败 该用户名已被占用");
        }else{
            userService.signUser(userName,passWord);
            modelAndView.setViewName("index");
            modelAndView.addObject("message2","注册成功请登录");
        }

        return  modelAndView;
    }

}
