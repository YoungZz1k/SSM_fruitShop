package com.J2EE.controller;


import com.J2EE.base.BaseController;
import com.J2EE.pojo.*;
import com.J2EE.service.ItemCategoryService;
import com.J2EE.service.ItemService;
import com.J2EE.service.ManageService;
import com.J2EE.service.UserService;
import com.J2EE.utils.Consts;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * 登录相关的控制器
 */
@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {

    /**
     * 注入要用到的service
     */
    @Autowired
    private ManageService manageService;

    @Autowired
    private ItemCategoryService itemCategoryService;

    @Autowired
    private ItemService itemService;

    @Autowired
    private UserService userService;

    /**
     * 管理员登录前
     * @return
     */
    @RequestMapping("login")
    public String login(){
        return "/login/mLogin";
    }

    /**
     * 登录验证
     * @return
     */
    @RequestMapping("toLogin")
    public String toLogin(Manage manage, HttpServletRequest request){
       Manage byEntity = manageService.getByEntity(manage);
       if(byEntity==null){
           return "redirect:/login/mExit";
       }
       request.getSession().setAttribute(Consts.MANAGE,byEntity);
       return "/login/mIndex";
    }

    /**
     * 管理员退出
     */
    @RequestMapping("mExit")
    public String mExit(HttpServletRequest request){
        request.getSession().setAttribute(Consts.MANAGE,null);
        return "/login/mLogin";
    }

    /**普通用户注册*/
    @RequestMapping("/res")
    public String res(){
        return "login/res";
    }


    /**普通用户登录入口*/
    @RequestMapping("/uLogin")
    public String uLogin(){
        return "login/uLogin";
    }

    /**
     * 前端首页
     */
    @RequestMapping("/uIndex")
    public String uIndex(Model model, Item item,HttpServletRequest request){
        String sql1 = "select * from item_category where isDelete = 0 and pid is null order by name ";
        List<ItemCategory> fatherList = itemCategoryService.listBySqlReturnEntity(sql1);
        List<CategoryDto> list = new ArrayList<>();
        if(!CollectionUtils.isEmpty(fatherList)){
            for (ItemCategory ic : fatherList) {
                CategoryDto dto = new CategoryDto();
                dto.setFather(ic);
                //查询二级目录
                String sql2 = "select * from item_category where isDelete=0 and pid = "+ic.getId();
                List<ItemCategory> childrens = itemCategoryService.listBySqlReturnEntity(sql2);//查询到的二级目录放到集合中
                dto.setChildrens(childrens);//赋给dto对象
                list.add(dto);//放入集合
                model.addAttribute("lbs",list);
            }
        }
        //折扣商品 取折扣力度最大的前十个
        List<Item> zks = itemService.listBySqlReturnEntity("select * from item where isDelete=0 and zk is not null order by zk asc limit 0,10 ");
        model.addAttribute("zks",zks);

        //热销商品
        List<Item> rxs = itemService.listBySqlReturnEntity("select * from item where isDelete=0  order by gmNum desc limit 0,10 ");
        model.addAttribute("rxs",rxs);
        return "login/uIndex";
    }

    /**
     * 用户登录逻辑实现
     * @return
     */
    @RequestMapping("/utoLogin")
    public String utoLogin(User u,HttpServletRequest request){
        User user = userService.getByEntity(u);
        if(user == null){
            return "redirect:/login/res.action";
        }else {
            request.getSession().setAttribute("role",2);
            request.getSession().setAttribute(Consts.USERNAME,user.getUserName());
            request.getSession().setAttribute(Consts.USERID,user.getId());
            return "redirect:/login/uIndex.action";
        }
    }

    /**
     * 用户注册逻辑实现
     * @return 到登录页面
     */
    @RequestMapping("/toReg")
    public String toRes(User user){

        userService.insert(user);
        return "login/uLogin";
    }
    /**
     * 前端用户退出
     */
    @RequestMapping("/uExit")
    public String UserExit(HttpServletRequest request){
        /**
         * 清除此次会话的session
         */
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/login/uIndex.action";
    }
    /**
     * 修改密码入口
     */
    @RequestMapping("/pass")
    public String pass(HttpServletRequest request){
        //判断登录
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute == null){//未登录状态
            return "redirect:/login/uLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        User user = userService.load(userId);
        request.setAttribute("obj",user);
        return "login/pass";
    }
    /**
     * 执行修改密码
     */
    @RequestMapping("/upass")
    @ResponseBody
    public String upass(String passWord, HttpServletRequest request){
        //判断登录
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        JSONObject js = new JSONObject();
        if(attribute == null){//未登录状态
            js.put(Consts.RES,0);
            return js.toString();
        }
        Integer userId = Integer.valueOf(attribute.toString());
        User load = userService.load(userId);
        load.setPassWord(passWord);
        userService.updateById(load);
         js.put(Consts.RES,1);
        return js.toString();
    }
}
