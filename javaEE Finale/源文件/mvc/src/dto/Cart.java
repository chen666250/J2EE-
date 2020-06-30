package dto;

import lombok.Data;
import model.Book;

import java.util.ArrayList;
import java.util.List;

@Data
public class Cart {
    public  List<Book> books=new ArrayList();;
}
