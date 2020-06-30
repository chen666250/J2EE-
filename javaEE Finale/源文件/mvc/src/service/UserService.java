package service;

import model.User;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public interface UserService {

    public User login(String userName, String passWord);
    public boolean signUser(String userName, String passWord);

    List<User> getAllUser();

    void blockByUserId(long userId);
    void unblockByUserId(long userId);

    User searchUserbyId(long userId);

    void removeUser(long userId);

    User isUserExist(String userName);
}
