package test;

import com.pojo.Role;
import com.service.RoleService;
import com.service.impl.RoleServiceImpl;
import org.junit.Test;

public class RoleTest {
    @Test
    public void TestRole(){
        RoleService roleService=new RoleServiceImpl();
        Role role=roleService.getRoleByUserId(1);
        System.out.println(role);
    }
}
