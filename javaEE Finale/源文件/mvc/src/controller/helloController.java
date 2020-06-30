package controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

@org.springframework.stereotype.Controller//试验框架基本功能
public class helloController implements Controller  {
    @Override
    @RequestMapping("/hi")
    public ModelAndView handleRequest(javax.servlet.http.HttpServletRequest httpServletRequest, javax.servlet.http.HttpServletResponse httpServletResponse) throws Exception {
        System.out.println("activate");
        ModelAndView mv = new ModelAndView("hello");
        mv.addObject("name", "chen");
        return mv;


    }

    @RequestMapping("/hi2/{id}")
    public ModelAndView handleRequest2(javax.servlet.http.HttpServletRequest httpServletRequest,
                                       javax.servlet.http.HttpServletResponse httpServletResponse, @PathVariable int id) throws Exception {
        System.out.println("activate2"+id);
        ModelAndView mv = new ModelAndView("hello");
        mv.addObject("name", "chen2"+id);
        return mv;
    }
}