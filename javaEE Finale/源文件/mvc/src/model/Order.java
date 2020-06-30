package model;

import lombok.Data;

import java.sql.Date;

@Data
public class Order {
    private  long orderId;
    private long userId;
    private long bookId;
    private String bookName;
    private Date rentTime;
    private String status;
    private String note;
}
