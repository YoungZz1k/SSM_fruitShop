package com.J2EE.service.impl;

import com.J2EE.base.BaseDao;
import com.J2EE.base.BaseServiceImpl;
import com.J2EE.mapper.ItemCategoryMapper;
import com.J2EE.pojo.ItemCategory;
import com.J2EE.service.ItemCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemCategoryServiceImpl extends BaseServiceImpl<ItemCategory> implements ItemCategoryService {
    @Autowired
    private ItemCategoryMapper itemCategoryMapper;

    @Override
    public BaseDao<ItemCategory> getBaseDao() {
        return itemCategoryMapper;
    }
}
