package service;

import model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public interface AdminService {
    public Admin loginByName(String adminName,String adminPassword);

    boolean isNameUsed(String adminName);

    void signUpAdmin(String adminName, String password);
}
