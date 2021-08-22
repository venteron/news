package com.dao;

import com.pojo.News;

import java.util.List;

public interface NewDao {
    public List<News> queryNewsByUserId(int uid);

    public List<News> queryAll();

    public List<News> queryDisapprove();

    public void addNews(News news);

    public void updateNews(News news);

    public void deleteNewsById(int nid);
}
