package provider;

import mapper.Usermapper;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserService;

import java.util.List;

@Service
public class UserServiceProvider implements UserService {

    @Autowired
    private Usermapper usermapper;

    public User login(String userName, String passWord) {

        return usermapper.loginByName(userName, passWord);

    }
    public boolean signUser(String userName,String passWord){

            return usermapper.signUser(userName,passWord);



    }

    @Override
    public List<User> getAllUser() {
        return usermapper.getAllUser();
    }

    @Override
    public void blockByUserId(long userId) {
        usermapper.blockUser(userId);
    }

    @Override
    public void unblockByUserId(long userId) {
        usermapper.UnblockUser(userId);
    }

    @Override
    public User searchUserbyId(long userId) {
        return usermapper.findUserbyId(userId);
    }

    @Override
    public void removeUser(long userId) {
        usermapper.removeUser(userId);
    }

    @Override
    public User isUserExist(String userName) {
        return usermapper.findByName(userName);
    }
}
