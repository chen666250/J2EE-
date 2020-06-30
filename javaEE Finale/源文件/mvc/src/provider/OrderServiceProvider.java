package provider;

import dto.UserOrder;
import mapper.BookMapper;
import mapper.OrderMapper;
import model.Book;
import model.Order;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.OrderService;

import java.sql.Date;
import java.util.List;

@Service
public class OrderServiceProvider implements OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private BookMapper bookMapper;

    public List<Order> getOrdersByUserId(long userId) {

        return orderMapper.getAllbyuserId(userId);
    }

    @Override
    public UserOrder combineUserOrder(User user, List<Order> orders) {
        UserOrder userOrder = new UserOrder(user,orders);

        return userOrder;
    }

    @Override
    public void creatNewOrder(User user, long bookId) {
        java.util.Date date1= new java.util.Date();
        Date date = new Date(date1.getTime());
        String s2 =bookMapper.getBookById(bookId).getBookName();
        String s = "CHECKING";
        orderMapper.insertOrder(user.getUserId(),bookId,s2,date,s);
        bookMapper.confrimBook(bookId);
    }

    @Override
    public void finishOrder(long bookId) {
      Order order =  orderMapper.getOrderByRentBookId(bookId);
      order.setStatus("DONE");
        orderMapper.updateOrder(order);
    }

    @Override
    public void permit(long bookId) {
        Book book = bookMapper.getBookById(bookId);
        book.setStatus("RENT");
        bookMapper.updateBook(book);
       Order order= orderMapper.getOrderByBookId(bookId);
        System.out.println(order);
       order.setStatus("RENT");
       orderMapper.updateOrder(order);
    }

    @Override
    public List<Order> showAllOrders() {
        return orderMapper.showAllOrders();
    }


}
