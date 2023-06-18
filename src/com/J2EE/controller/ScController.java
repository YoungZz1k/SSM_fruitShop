package com.J2EE.controller;

import com.J2EE.pojo.Item;
import com.J2EE.pojo.Sc;
import com.J2EE.service.ItemService;
import com.J2EE.service.ScService;
import com.J2EE.utils.Consts;
import com.J2EE.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/sc")
public class ScController {

    @Autowired
    private ScService scService;

    @Autowired
    private ItemService itemService;

    /**
     * 收藏商品
     * @param sc sc对象
     * @param request http请求获取用户信息
     * @return 返回
     */
    @RequestMapping("/exAdd")
    public String exAdd(Sc sc, HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute == null){//未登录状态
            return "redirect:/login/uLogin";
        }
        //保存到收藏表
        Integer userId = Integer.valueOf(attribute.toString());
        sc.setUserId(userId);
        scService.insert(sc);
        //收藏数+1
        Item item = itemService.load(sc.getItemId());
        item.setScNum(item.getScNum()+1);
        itemService.updateById(item);
        return "redirect:/sc/findBySql.action";
    }
    /**
     * 查看收藏列表
     */
    @RequestMapping("/findBySql")
    public String findBySql(Model model, HttpServletRequest request){
        //判断登录
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute == null){//未登录状态
            return "redirect:/login/uLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        String sql = "select * from sc where user_id = "+ userId +" order by id desc";
        Pager<Sc> pager = scService.findBySqlReturnEntity(sql);
        model.addAttribute("pagers",pager);
        return "sc/my";
    }
    /**
     * 删除收藏商品
     */
    @RequestMapping("/delete")
    public String delete(Integer id,HttpServletRequest request){
        //判断登录
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute == null){//未登录状态
            return "redirect:/login/uLogin";
        }
        scService.deleteById(id);
        return "redirect:/sc/findBySql";
    }
}
