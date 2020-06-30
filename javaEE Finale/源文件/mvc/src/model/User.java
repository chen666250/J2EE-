package model;

import lombok.Data;

@Data
public class User {

    private long userId;
    private String userName;
    private String passWord;
    private String userStatus;
    private String note; //该属性相关设计已放弃 4.16

}
