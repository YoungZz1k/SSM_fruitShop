package com.J2EE.controller;

import com.J2EE.base.BaseController;
import com.J2EE.pojo.User;
import com.J2EE.service.UserService;
import com.J2EE.utils.Consts;
import com.J2EE.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


/**
 * 用户c层
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;

    /**
     * 分页查询全部
     * @param model
     * @param user
     * @return
     */
    @RequestMapping("/findBySql")
    public String findBySql(Model model,User user){
        String sql = " select * from user where 1=1 ";
        if(!isEmpty(user.getUserName())) {
            sql += " and userName like '%"+user.getUserName()+"%' ";
        }
        sql += " order by id";
        Pager<User> pagers = userService.findBySqlReturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",user);
        return "user/user";
    }

    /**
     * 跳转修改用户信息界面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/update")
    public String  update(Integer id,Model model){
        User user = userService.getById(id);
        model.addAttribute("user",user);//把对象传到页面
        return "user/update";
    }

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @RequestMapping("/exUpdate")
    public String exUpdate(User user){
        userService.updateById(user);
        return "redirect:/user/findBySql";
    }

    /**
     * 删除用户
     */
    @RequestMapping("/delete")
    public String delete(Integer id){
        userService.deleteById(id);
        return "redirect:/user/findBySql";
    }
    /**
     * 个人中心跳转
     */
    @RequestMapping("/view")
    public String view(Model model, HttpServletRequest request){
        Integer id =(Integer) request.getSession().getAttribute(Consts.USERID);
        if(id == null){
            return "redirect:/login/uLogin";
        }
        User byEntity = userService.getById(id);
        model.addAttribute("obj",byEntity);
        return "user/view";
    }

    /**
     * 用户自己修改信息
     * @param user
     * @return
     */
    @RequestMapping("/exUpdate1")
    public String exUpdate1(User user,HttpServletRequest request){
        Integer id =(Integer) request.getSession().getAttribute(Consts.USERID);
        if(id == null){
            return "redirect:/login/uLogin";
        }
        user.setId(id);
        userService.updateById(user);
        return "redirect:/user/view.action";
    }
}
