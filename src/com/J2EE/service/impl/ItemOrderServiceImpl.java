package com.J2EE.service.impl;

import com.J2EE.base.BaseDao;
import com.J2EE.base.BaseServiceImpl;
import com.J2EE.mapper.ItemOrderMapper;
import com.J2EE.pojo.ItemOrder;
import com.J2EE.service.ItemOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemOrderServiceImpl extends BaseServiceImpl<ItemOrder> implements ItemOrderService {
    @Autowired
    private ItemOrderMapper itemOrderMapper;

    @Override
    public BaseDao<ItemOrder> getBaseDao() {
        return itemOrderMapper;
    }
}
