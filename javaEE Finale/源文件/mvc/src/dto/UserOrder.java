package dto;

import lombok.Data;
import model.Order;
import model.User;

import java.util.List;

@Data
public class UserOrder {
    private User user;
    private List<Order> orders;

    public UserOrder(User user, List<Order> orders) {
        this.user=user;
        this.orders=orders;
    }
}
