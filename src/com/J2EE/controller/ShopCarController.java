package com.J2EE.controller;

import com.J2EE.pojo.Item;
import com.J2EE.pojo.ShopCar;
import com.J2EE.service.ItemService;
import com.J2EE.service.ShopCarService;
import com.J2EE.utils.Consts;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

/**
 * 购物车c层
 */
@Controller
@RequestMapping("/car")
public class ShopCarController {

    @Autowired
    private ShopCarService shopCarService;

    @Autowired
    private ItemService itemService;

    @RequestMapping("/exAdd")
    @ResponseBody
    public String exAdd(ShopCar shopCar, HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute == null){//未登录状态
            jsonObject.put(Consts.RES,0);
            return jsonObject.toJSONString();
        }
        //保存到购物车
        Integer userId = Integer.valueOf(attribute.toString());
        shopCar.setUserId(userId);
        Item item = itemService.load(shopCar.getItemId());
        String price = item.getPrice();
        Double value = Double.valueOf(price);
        shopCar.setPrice(value);

        if(item.getZk() != null){
            value = value * item.getZk()/10.0;
            BigDecimal bg = new BigDecimal(value).setScale(2, RoundingMode.UP);//向上进位
            shopCar.setPrice(bg.doubleValue());
            value = bg.doubleValue();
        }
        Integer num = shopCar.getNum();
        Double t = value*num;
        BigDecimal bg = new BigDecimal(t).setScale(2, RoundingMode.UP);//向上进位
        double doubleValue = bg.doubleValue();
        shopCar.setTotal(doubleValue+"");
        //插入表中
        shopCarService.insert(shopCar);
        jsonObject.put(Consts.RES,1);
        return jsonObject.toJSONString();
    }

    /**
     * 转到我的购物车页面
     * @return
     */
    @RequestMapping("/findBySql")
    public String findBySql(Model model, HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute == null){//未登录状态
            return "redirect:/login/uLogin";
        }
        Integer id = Integer.valueOf(attribute.toString());
        String sql = "select * from shopcar where user_id = " + id +" order by id desc";
        List<ShopCar> shopCars = shopCarService.listBySqlReturnEntity(sql);
        model.addAttribute("list",shopCars);
        return "car/car";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(Integer id){
        shopCarService.deleteById(id);
        return "success";
    }

}
