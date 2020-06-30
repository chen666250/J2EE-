package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import service.AdminService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@org.springframework.stereotype.Controller
public class AdminManageController implements Controller {
    @Autowired
    private AdminService adminService;
    @Override
    @RequestMapping("/adminManage")
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        ModelAndView modelAndView=new ModelAndView("adminManage");
        return modelAndView;
    }

    @RequestMapping("/AddAdmin")
    public ModelAndView addAdmin(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                                 @RequestParam("adminName") String adminName,
                                 @RequestParam("password") String password) throws Exception {
        ModelAndView modelAndView=new ModelAndView("adminManage");

        if(adminService.isNameUsed(adminName)){
            modelAndView.addObject("messageADD","名字已被占用");
        }else
        {
            adminService.signUpAdmin(adminName,password);
            modelAndView.addObject("messageADD","添加成功");
        }
        return modelAndView;
    }
}
