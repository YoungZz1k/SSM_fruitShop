package com.J2EE.service.impl;

import com.J2EE.base.BaseDao;
import com.J2EE.base.BaseServiceImpl;
import com.J2EE.mapper.ShopCarMapper;
import com.J2EE.pojo.ShopCar;
import com.J2EE.service.ShopCarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopCarServiceImpl extends BaseServiceImpl<ShopCar> implements ShopCarService {
    @Autowired
    private ShopCarMapper shopCarMapper;

    @Override
    public BaseDao<ShopCar> getBaseDao() {
        return shopCarMapper;
    }
}
