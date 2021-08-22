package com.controller;

import com.pojo.Menu;
import com.pojo.Role;
import com.pojo.User;
import com.service.MenuService;
import com.service.RoleService;
import com.service.UserService;
import com.service.impl.MenuServiceImpl;
import com.service.impl.RoleServiceImpl;
import com.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    private UserService userService=new UserServiceImpl();
    private RoleService roleService=new RoleServiceImpl();
    private MenuService menuService=new MenuServiceImpl();

    /**
     * 用户登录,根据前端ajax传来的数据,判断用户输入的用户名和密码是否正确
     */
    @RequestMapping("login")
    @ResponseBody
    public boolean login(User user,HttpServletRequest request){
        //1、根据用户名和密码,查询数据库中是否已存在该用户
        User login=userService.login(user);
        if(login!=null){
            //登录成功
            //2、根据用户id查询对应的角色信息 普通用户、管理员
            Role role=roleService.getRoleByUserId(login.getId());
            login.setRole(role);
            //3、根据角色id对应的权限列表
            List<Menu> menus=menuService.queryMenusByRoleId(role.getRoleid());
            //4、保存用户信息和权限到会话,以便前台获取
            HttpSession session=request.getSession();
            session.setAttribute("user",login);
            session.setAttribute("menus",menus);
            return true;
        }
        return false;
    }
    @RequestMapping("register")
    @ResponseBody
    public boolean register(User user){
        return userService.register(user);
    }

    @RequestMapping("update")
    @ResponseBody
    public boolean updateSelf(User user, HttpServletRequest request){
        User old= (User) request.getSession().getAttribute("user");
        user.setId(old.getId());
        user.setCreate_date(old.getCreate_date());
        user.setRole(old.getRole());
        userService.updateUser(user);
        request.getSession().setAttribute("user",user);
        return true;
    }
}
