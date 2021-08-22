package com.service;

import com.github.pagehelper.PageInfo;
import com.pojo.News;

import java.util.List;

public interface NewsService {
    public List<News> queryNewsByUserId(int uid);

    public List<News> queryAll();

    public List<News> queryDisapprove();

    public void addNews(News news);

    public void updateNews(News news);

    public void deleteNewsById(int nid);

    //分页
    public PageInfo<News> queryByPage(int currentPage, int pageSize);

}
