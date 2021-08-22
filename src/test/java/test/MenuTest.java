package test;

import com.pojo.Menu;
import com.service.MenuService;
import com.service.impl.MenuServiceImpl;
import org.junit.Test;

import java.util.List;

public class MenuTest {
    @Test
    public void TestMenus(){
        MenuService menuService=new MenuServiceImpl();
        List<Menu> menus=menuService.queryMenusByRoleId(2);
        for(Menu m:menus){
            System.out.println(m);
        }
    }
}
