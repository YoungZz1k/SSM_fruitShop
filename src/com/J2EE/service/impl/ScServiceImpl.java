package com.J2EE.service.impl;

import com.J2EE.base.BaseDao;
import com.J2EE.base.BaseServiceImpl;
import com.J2EE.mapper.ScMapper;
import com.J2EE.pojo.Sc;
import com.J2EE.service.ScService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScServiceImpl extends BaseServiceImpl<Sc> implements ScService {
    @Autowired
    private ScMapper scMapper;

    @Override
    public BaseDao<Sc> getBaseDao() {
        return scMapper;
    }
}
