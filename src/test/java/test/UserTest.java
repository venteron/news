package test;

import com.pojo.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;
import org.junit.Test;

public class UserTest {
    public static void main(String[] args){
        UserService userService=new UserServiceImpl();
        User user1=new User();
        user1.setUsername("李四");
        user1.setPassword("234567");
        User user=userService.login(user1);
        System.out.println(user);
    }
    @Test
    public void TestRegister(){
        UserService userService=new UserServiceImpl();
        User user1=new User();
        user1.setUsername("赵六");
        user1.setPassword("234567");
        boolean f=userService.register(user1);
        System.out.println(f);
    }
    @Test
    public void TestUpdate(){
        UserService userService=new UserServiceImpl();
        User user1=new User();
        user1.setId(5);
        user1.setUsername("希斯莱杰");
        user1.setPassword("777777");
        userService.updateUser(user1);
    }

}
