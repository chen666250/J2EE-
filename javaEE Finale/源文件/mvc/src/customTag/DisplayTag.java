package customTag;

import model.Order;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import service.OrderService;

import javax.annotation.PostConstruct;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.List;

public class DisplayTag extends SimpleTagSupport {




    public void doTag() throws JspException, IOException {
        int CheckingCount = 0;
        int DoneCount = 0;
        int RentCount = 0;
        User user = (User) getJspContext().findAttribute("user");

        long id = user.getUserId();
        System.out.println("id " + id);

        OrderService orderService = (OrderService) SpringTool.getBean(OrderService.class);
        List<Order> orders=orderService.getOrdersByUserId(id);
        System.out.println(orders);
        for (Order each : orders) {
            switch (each.getStatus()) {
                case "DONE":
                    DoneCount += 1;
                    break;
                case "CHECKING":
                    CheckingCount += 1;
                    break;
                case "RENT":
                    RentCount += 1;
                    break;

            }
        }

        getJspContext().setAttribute("CheckingCount", CheckingCount);
        getJspContext().setAttribute("DoneCount", DoneCount);
        getJspContext().setAttribute("RentCount", RentCount);

    }


}
