package com.J2EE.service.impl;

import com.J2EE.base.BaseDao;
import com.J2EE.base.BaseServiceImpl;
import com.J2EE.mapper.NewsMapper;
import com.J2EE.pojo.News;
import com.J2EE.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewsServiceImpl extends BaseServiceImpl<News> implements NewsService {
    @Autowired
    private NewsMapper newsMapper;

    @Override
    public BaseDao<News> getBaseDao() {
        return newsMapper;
    }
}
