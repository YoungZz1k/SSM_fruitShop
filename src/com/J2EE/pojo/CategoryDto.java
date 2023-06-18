package com.J2EE.pojo;

import java.io.Serializable;
import java.util.List;

public class CategoryDto implements Serializable {
    // 一级列表
    private ItemCategory father;
    //所属 子集列表
    private List<ItemCategory> childrens;

    public ItemCategory getFather() {
        return father;
    }

    public CategoryDto() {
    }

    public void setFather(ItemCategory father) {
        this.father = father;
    }

    public List<ItemCategory> getChildrens() {
        return childrens;
    }

    public void setChildrens(List<ItemCategory> childrens) {
        this.childrens = childrens;
    }
}
