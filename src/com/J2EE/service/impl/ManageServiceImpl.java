package com.J2EE.service.impl;

import com.J2EE.base.BaseDao;
import com.J2EE.base.BaseServiceImpl;
import com.J2EE.mapper.ManageMapper;
import com.J2EE.pojo.Manage;
import com.J2EE.service.ManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManageServiceImpl extends BaseServiceImpl<Manage> implements ManageService {
    @Autowired
    private ManageMapper manageMapper;

    @Override
    public BaseDao<Manage> getBaseDao() {
        return manageMapper;
    }
}
