package com.controller;

import com.github.pagehelper.PageInfo;
import com.pojo.News;
import com.service.NewsService;
import com.service.impl.NewsServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
public class NewsController {
    private NewsService newsService=new NewsServiceImpl();

    @RequestMapping("listpage")
    @ResponseBody
    public boolean queryAll(HttpServletRequest request){
        List<News> news=newsService.queryAll();
        request.getSession().setAttribute("news",news);
        return true;
    }

    @RequestMapping("info")
    public String info(@RequestParam String title,HttpServletRequest request){
        List<News> news= (List<News>) request.getSession().getAttribute("news");
        for(News n:news){
            if(n.getTitle().equals(title)){
                n.setVisit(n.getVisit()+1);
                request.getSession().setAttribute("n",n);
                newsService.updateNews(n);
                break;
            }
        }
        return "info";
    }

    @RequestMapping("save")
    @ResponseBody
    public boolean save(News news){
        news.setVisit(0);
        news.setDate(new Date());
        news.setStatus(0);
        newsService.addNews(news);
        return true;
    }

    @RequestMapping("approve")
    public boolean approve(){
        return true;
    }

    @RequestMapping("disapprove")
    public boolean disapprove(){

        return true;
    }
    @RequestMapping("newsmanage")
    @ResponseBody
    public boolean queryByPage(Integer currentPage, Integer pageSize, HttpServletRequest request){
        if(currentPage==null){
            currentPage=1;
        }
        if(pageSize==null){
            pageSize=3;
        }
        PageInfo<News> pageInfo = newsService.queryByPage(currentPage, pageSize);
        request.getSession().setAttribute("page",pageInfo);
        return true;
    }
}
