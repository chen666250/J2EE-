package mapper;

import model.Order;
import org.apache.ibatis.annotations.*;

import java.sql.Date;
import java.util.List;

@Mapper
public interface OrderMapper {
    @Select("select * from orders where userId =#{userId}")
    List<Order> getAllbyuserId(@Param("userId") long userId);

    @Insert("insert into orders (userId,bookId,bookName,rentTime,status) values(#{userId},#{bookId},#{bookName},#{rentTime},#{status})")
    void insertOrder(@Param("userId") long userId, @Param("bookId") long bookId, @Param("bookName") String bookName, @Param("rentTime") Date rentTime
            , @Param("status") String status);

    @Update("update orders set bookName=#{bookName},userId=#{userId},note=#{note},status=#{status} where orderId=#{orderId}")
    void updateOrder(Order order);

    @Select("select * from orders where bookId =#{bookId} and status='RENT' ")
    Order getOrderByRentBookId(@Param("bookId") long bookId);

    @Select("select * from orders where bookId =#{bookId} and status='CHECKING' ")
    Order getOrderByBookId(@Param("bookId") long bookId);


    @Select("select * from orders  ")
    List<Order> showAllOrders();
}
