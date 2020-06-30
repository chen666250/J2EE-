package provider;

import mapper.AdminMapper;
import model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.AdminService;
@Service
public class AdminServiceProvider implements AdminService {
    @Autowired
    private  AdminMapper adminMapper;

    @Override
    public Admin loginByName(String adminName,String adminPassword) {
        return adminMapper.loginByName(adminName,adminPassword);
    }

    @Override
    public boolean isNameUsed(String adminName) {
       boolean flag= false;

           Admin admin = adminMapper.isNameUsed(adminName);
           if(admin!=null){
               flag=true;
           }
        return flag;
    }

    @Override
    public void signUpAdmin(String adminName, String password) {
     adminMapper.signAdmin(adminName,password);
    }
}
