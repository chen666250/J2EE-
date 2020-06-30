package controller;


import mapper.Usermapper;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class UserManageController implements org.springframework.web.servlet.mvc.Controller {
    @Autowired
    private UserService userService;

    @Override
    @RequestMapping("/userManage")
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        ModelAndView modelAndView = new ModelAndView("userManage");
        List<User> users = userService.getAllUser();
        if (users != null) {
            modelAndView.addObject("users", users);
        } else {
            modelAndView.addObject("massageUser", "系统并没有用户");
        }

        return modelAndView;
    }

    @RequestMapping("/block/{userId}")
    public ModelAndView Block(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @PathVariable long userId) throws Exception {

        userService.blockByUserId(userId);
        ModelAndView modelAndView = new ModelAndView("userManage");
        modelAndView.addObject("massageUser", "用户已封禁");
        return modelAndView;
    }

    @RequestMapping("/Unblock/{userId}")
    public ModelAndView unBlock(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @PathVariable long userId) throws Exception {
        userService.unblockByUserId(userId);
        ModelAndView modelAndView = new ModelAndView("userManage");
        modelAndView.addObject("massageUser", "用户已解封");
        return modelAndView;
    }
    @RequestMapping("/searchUserViaUserId")
    public ModelAndView searchUser(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @RequestParam("userId")long userId) throws Exception {
        userService.unblockByUserId(userId);
        ModelAndView modelAndView = new ModelAndView("userManage");
        User user = userService.searchUserbyId(userId);
        if (user != null) {
            modelAndView.addObject("Auser", user);
        } else {
            modelAndView.addObject("Amessage", "系统并没有用户");
        }

        return modelAndView;
    }
    @RequestMapping("/removeUser/{userId}")
    public ModelAndView remove(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @PathVariable long userId) throws Exception {
        userService.removeUser(userId);
        ModelAndView modelAndView = new ModelAndView("userManage");
        modelAndView.addObject("massageUser", "用户已移除");
        return modelAndView;
    }
//    @RequestMapping("/addNote/{userId}") 该设计初步放弃
//    public ModelAndView addNoteToUser(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @RequestParam("note") String note) throws Exception {
//        userService.updateNote(note);
//        ModelAndView modelAndView = new ModelAndView("userManage");
//        modelAndView.addObject("massageUser", "备注已更新");
//        return modelAndView;
//    }
}
