package mapper;

import model.Admin;
import model.User;
import org.apache.ibatis.annotations.*;

@Mapper
public interface AdminMapper {
    @Insert("insert into admin (adminName,adminPassword) values(#{adminName},#{adminPassword})")
    boolean signAdmin(@Param("adminName") String adminName, @Param("adminPassword") String adminPassword);// mybatis 将admin传入数据库

    @Select(("select * from admin where adminName =#{adminName}"))
    Admin findByAdminName(@Param("adminName") String adminName);

    @Update("update admin set adminName=#{adminName},adminPassword=#{adminPassword}  where adminId=#{adminId}")
    boolean update(Admin admin);

    @Select(("select * from admin where adminName =#{adminName} and adminPassword =#{adminPassword}"))
    Admin loginByName(@Param("adminName") String adminName, @Param("adminPassword") String adminPassword);

    @Select(("select * from admin where adminName =#{adminName} "))
    Admin isNameUsed(@Param("adminName") String adminName);
}
