package com.J2EE.pojo;

import java.io.Serializable;

/**
 * 购物车
 */
public class ShopCar implements Serializable {

    /**
     * 主键id
     */
    private Integer id;

    /**
     * 商品id
     */
    private Integer itemId;
    /**
     * 商品信息
     */
    private Item item;
    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 购物车商品数量
     */
    private Integer num;
    /**
     * 购物车商品单价
     */
    private double price;
    /**
     * 购物车商品总价
     */
    private String total;

    public ShopCar(Integer id, Integer itemId, Item item, Integer userId) {
        this.id = id;
        this.itemId = itemId;
        this.item = item;
        this.userId = userId;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public ShopCar() {
    }

    @Override
    public String toString() {
        return "ShopCar{" +
                "id=" + id +
                ", itemId=" + itemId +
                ", item=" + item +
                ", userId=" + userId +
                ", num=" + num +
                ", price=" + price +
                ", total='" + total + '\'' +
                '}';
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

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
