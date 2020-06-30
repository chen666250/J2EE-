package mapper;

import model.Book;

import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BookMapper {
    @Select("select * from book ")
    List<Book> showAllBook();

    @Select("select * from book  where bookId =#{bookId}")
    Book getBookById(@Param("bookId") long bookId);

    @Select("select * from book  where bookName Like '%${bookName}%'")
        //模糊查询
    List<Book> getBookByName(@Param("bookName") String bookName);

    @Update("update book set status= 'CHECKING' where bookId=#{bookId}")
    void confrimBook(@Param("bookId") long bookId);

    @Update("update book set bookName=#{bookName},status=#{status},describes=#{describes} where bookId=#{bookId}")
    void updateBook(Book book);

    @Insert("insert into book (bookName,describes) values(#{bookName},#{describes})")
    void addBook(@Param("bookName") String bookName, @Param("describes")String describes);

    @Delete( "delete from book where bookId=#{bookId}")
    void removeBook(@Param("bookId") long bookId);
}
