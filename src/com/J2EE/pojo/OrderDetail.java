package com.J2EE.pojo;

import java.io.Serializable;

/**
 * 商品订单详情
 */
public class OrderDetail implements Serializable {
    /**
     * 主键id
     */
    private Integer id;
    /**
     * 商品id
     */
    private Integer itemId;
    private Item item;
    /**
     * 订单id
     */
    private Integer orderId;
    /**
     * 购买状态
     * 0.未退货
     * 1.已退货
     */
    private Integer status;
    /**
     * 购买数量
     */
    private Integer num;
    /**
     * 总金额
     */
    private String total;

    public OrderDetail() {
    }

    public OrderDetail(Integer id, Integer itemId, Integer orderId, Integer status, Integer num, String total) {
        this.id = id;
        this.itemId = itemId;
        this.orderId = orderId;
        this.status = status;
        this.num = num;
        this.total = total;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "id=" + id +
                ", itemId=" + itemId +
                ", orderId=" + orderId +
                ", status=" + status +
                ", num=" + num +
                ", total=" + total +
                '}';
    }
}
