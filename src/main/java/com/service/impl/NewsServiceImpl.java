package com.service.impl;

import com.dao.NewDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pojo.News;
import com.service.NewsService;
import com.util.MyBatisUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class NewsServiceImpl implements NewsService {
    private NewDao newDao= MyBatisUtil.getSqlSession().getMapper(NewDao.class);

    @Override
    public List<News> queryNewsByUserId(int uid) {
        return null;
    }

    @Override
    public List<News> queryAll() {
        return newDao.queryAll();
    }

    public List<News> queryDisapprove(){
        return newDao.queryDisapprove();
    }

    @Override
    public void addNews(News news) {
        newDao.addNews(news);
    }

    @Override
    public void updateNews(News news) {
        newDao.updateNews(news);
    }

    @Override
    public void deleteNewsById(int nid) {
        newDao.deleteNewsById(nid);
    }

    @Override
    public PageInfo<News> queryByPage(int currentPage, int pageSize) {
        //1. 传入参数 当前页和页面大小
        PageHelper.startPage(currentPage,pageSize);
        List<News> list = newDao.queryDisapprove();
        //通过包装获取分页所需要的其他值
        PageInfo<News> pageInfo=new PageInfo<>(list);
        return pageInfo;
    }
}
