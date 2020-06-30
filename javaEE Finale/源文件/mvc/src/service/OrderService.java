package service;

import dto.UserOrder;
import model.Order;
import model.User;
import org.springframework.stereotype.Service;


import java.util.List;

@Service

public interface OrderService {
   public List<Order> getOrdersByUserId(long userId);
   public UserOrder combineUserOrder(User user,List<Order> orders);

    void creatNewOrder(User user, long bookId);

    void finishOrder(long bookId);

    void permit(long bookId);

    List<Order> showAllOrders();


}
