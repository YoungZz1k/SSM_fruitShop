package com.J2EE.controller;


import com.J2EE.base.BaseController;
import com.J2EE.pojo.*;
import com.J2EE.service.*;
import com.J2EE.utils.Consts;
import com.J2EE.utils.Pager;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/itemOrder")
public class ItemOrderController extends BaseController {

    @Autowired
    private ItemOrderService itemOrderService;

    @Autowired
    private UserService userService;

    @Autowired
    private ShopCarService shopCarService;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private ItemService itemService;

    private static String date;
    private static long orderNum = 0;
    //获取订单编号的静态方法
    public static synchronized String getOrderNum(){
        String str = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
        if(date == null || !date.equals(str)){
            date = str;
            orderNum = 0L;
        }
        orderNum ++;
        long ordernum = Long.parseLong(date)*10000;
        ordernum += orderNum;
        return ordernum+"";
    }

    @RequestMapping("/findBySql")
    public String findBySql(ItemOrder itemOrder, Model model){
        String sql = "select * from item_order where 1=1 ";
        if(!isEmpty(itemOrder.getCode())){
            sql += " and code like '%" + itemOrder.getCode()+"%' ";
        }
        sql += " order by id desc";
        Pager<ItemOrder> bySqlReturnEntity = itemOrderService.findBySqlReturnEntity(sql);
        model.addAttribute("pagers",bySqlReturnEntity);
        model.addAttribute("obj",itemOrder);//存储查询条件
        return "itemOrder/itemOrder";
    }
    /**
     * 后台发货
     */
    @RequestMapping("/fh")
    public String fh(Integer id,Model model){
        ItemOrder obj =itemOrderService.load(id);
        obj.setStatus(2);
        itemOrderService.updateById(obj);
        model.addAttribute("obj",obj);
        return "redirect:/itemOrder/findBySql";
    }
    /**
     * 跳转我的订单界面
     */
    @RequestMapping("/my")
    public String my(Model model, HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute == null){
            return "redirect:/login/uLogin";
        }
        Integer id = Integer.valueOf(attribute.toString());
        //全部订单
        String sql = "select * from item_order where user_id = "+ id + " order by id desc";
        List<ItemOrder> itemOrders = itemOrderService.listBySqlReturnEntity(sql);
        //待发货
        String sql0 = "select * from item_order where user_id = "+ id + " and status=0 order by id desc";
        List<ItemOrder> unshipments = itemOrderService.listBySqlReturnEntity(sql0);
        //已取消
        String sql1 = "select * from item_order where user_id = "+ id + " and status=1 order by id desc";
        List<ItemOrder> cancel = itemOrderService.listBySqlReturnEntity(sql1);
        //待收货
        String sql2 = "select * from item_order where user_id = "+ id + " and status=2 order by id desc";
        List<ItemOrder> unreceive = itemOrderService.listBySqlReturnEntity(sql2);
        //已收货
        String sql3 = "select * from item_order where user_id = "+ id + " and status=3 order by id desc";
        List<ItemOrder> receive = itemOrderService.listBySqlReturnEntity(sql3);
        model.addAttribute("all",itemOrders);
        model.addAttribute("cancel",cancel);
        model.addAttribute("unshipments",unshipments);
        model.addAttribute("receive",receive);
        model.addAttribute("unreceive",unreceive);
        return "itemOrder/my";
    }

    /**
     * 购物车结算提交
     * @return
     */
    @RequestMapping("/exAdd")
    @ResponseBody
    public String exAdd(@RequestBody List<ShopCarDto> shopCarDtos, HttpServletRequest request){
        //判断是否登录
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        JSONObject js = new JSONObject();
        if(attribute == null){
            js.put(Consts.RES,0);
            return js.toJSONString();
        }
        Integer userId = Integer.valueOf(attribute.toString());
        User byId = userService.getById(userId);
        //如果地址为空 前去编辑地址
        if(StringUtils.isEmpty(byId.getAddress())){
            js.put(Consts.RES,2);
            return js.toJSONString();
        }
        List<Integer> ids = new ArrayList<>();
        BigDecimal to = new BigDecimal(0);
        for (ShopCarDto c : shopCarDtos) {
            //把购物车的id放入集合
            ids.add(c.getId());
            ShopCar load = shopCarService.load(c.getId());//获取购物车对象
            to = to.add(new BigDecimal(load.getPrice()).multiply(new BigDecimal(c.getNum())));//把商品价格和数量相乘 累加
        }
        ItemOrder order = new ItemOrder();
        //存入信息到订单中
        order.setStatus(0);
        order.setCode(getOrderNum());
        order.setIsDelete(0);
        order.setTotal(to.setScale(2,BigDecimal.ROUND_HALF_UP).toString());
        order.setUserId(userId);
        order.setAddTime(new Date());
        itemOrderService.insert(order);

        //订单详情放入orderdetail 并删除购物车
        if(!CollectionUtils.isEmpty(ids)){
            for(ShopCarDto c : shopCarDtos){
                ShopCar load = shopCarService.load(c.getId());
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setItemId(load.getItemId());
                orderDetail.setOrderId(order.getId());
                orderDetail.setStatus(0);
                orderDetail.setNum(c.getNum());
                orderDetail.setTotal(String.valueOf(c.getNum()*load.getPrice()));
                orderDetailService.insert(orderDetail);
                //修改成交数
                Item load1 = itemService.load(load.getItemId());
                load1.setGmNum(load1.getGmNum()+c.getNum());
                itemService.updateById(load1);
                //删除购物车
                shopCarService.deleteById(c.getId());
            }
        }
        js.put(Consts.RES,1);
        return js.toJSONString();
    }

    /**
     * 用户取消订单
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/cancel")
    private String cancel(Integer id,Model model){
        ItemOrder load = itemOrderService.load(id);
        load.setStatus(1);
        itemOrderService.updateById(load);
        model.addAttribute("obj",load);
        return "redirect:/itemOrder/my";
    }

    /**
     * 用户去收货
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/receive")
    private String receive(Integer id,Model model){
        ItemOrder load = itemOrderService.load(id);
        load.setStatus(3);
        itemOrderService.updateById(load);
        model.addAttribute("obj",load);
        return "redirect:/itemOrder/my";
    }

    /**
     * 管理员后台发货
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/shipments")
    private String shipments(Integer id,Model model){
        ItemOrder load = itemOrderService.load(id);
        load.setStatus(2);
        itemOrderService.updateById(load);
        model.addAttribute("obj",load);
        System.out.println("test insert");
        return "redirect:/itemOrder/findBySql";
    }
    /**
     * 用户评价入口
     */
    @RequestMapping("/comment")
    public String comment(Integer id,Model model){
        model.addAttribute("id",id);
        return "comment/comment";
    }
}
