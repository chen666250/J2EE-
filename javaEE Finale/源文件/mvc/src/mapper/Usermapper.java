package mapper;

import model.User;
import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Mapper
public interface Usermapper {
    @Insert("insert into User (userName,passWord) values(#{userName},#{passWord})")
    boolean signUser(@Param("userName") String userName, @Param("passWord") String passWord);// mybatis 将USER传入数据库

    @Select(("select userId from User where userName =#{userName}"))
    User findByAccountID(@Param("userName") String userName);

    @Update("update User set userName=#{userName},passWord=#{passWord} ,userStatus=#{userStatus} where userId=#{userId}")
    void update(User user);

    @Select(("select * from User where userName =#{userName} and passWord =#{passWord}"))
    User loginByName(@Param("userName") String userName, @Param("passWord") String passWord);

    @Select(("select * from User "))
    List<User> getAllUser();

    @Update("update User set userStatus='BLOCK' where userId=#{userId}")
    void blockUser(@Param("userId") long userId);

    @Update("update User set userStatus='LIVE' where userId=#{userId}")
    void UnblockUser(@Param("userId") long userId);

    @Select("select * from user where userId=#{userId}")
    User findUserbyId(@Param("userId") long userId);

    @Delete("delete from user where userId=#{userId}")
    void removeUser(long userId);

    @Select("select * from user where userName=#{userName}")
    User findByName(@Param("userName") String userName);
}


