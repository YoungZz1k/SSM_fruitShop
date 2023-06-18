package com.J2EE.controller;


import com.J2EE.base.BaseController;
import com.J2EE.pojo.ItemOrder;
import com.J2EE.pojo.OrderDetail;
import com.J2EE.service.ItemOrderService;
import com.J2EE.service.OrderDetailService;
import com.J2EE.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/orderDetail")
public class OrderDetailController extends BaseController {

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private ItemOrderService itemOrderService;


    @RequestMapping("/ulist")
    public String findBySql(OrderDetail orderDetail, Model model){
        //分页查询
        String sql = "select * from order_detail  where order_id="+orderDetail.getOrderId();
        Pager<OrderDetail> pagers = orderDetailService.findBySqlReturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",orderDetail);
        return "orderDetail/ulist";
    }
    @RequestMapping("/findBySql")
    public String findBySql(ItemOrder itemOrder, Model model){
        String sql = "select * from item_order where isDelete=0 ";
        if(!isEmpty(itemOrder.getCode())){
            sql += " and code like '%" + itemOrder.getCode()+"%' ";
        }
        sql += " order by id desc";
        Pager<ItemOrder> bySqlReturnEntity = itemOrderService.findBySqlReturnEntity(sql);
        model.addAttribute("pagers",bySqlReturnEntity);
        model.addAttribute("obj",itemOrder);
        return "itemOrder/itemOrder";
    }
}
