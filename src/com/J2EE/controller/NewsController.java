package com.J2EE.controller;

import com.J2EE.base.BaseController;
import com.J2EE.pojo.News;
import com.J2EE.service.NewsService;
import com.J2EE.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@Controller
@RequestMapping("/news")
public class NewsController extends BaseController {


    @Autowired
    private NewsService newsService;

    /**
     * 分页查询全部公告列表
     */
    @RequestMapping("/findBySql")
    public String findBySql(Model model, News news){
        String sql = "select * from news where 1=1 ";
        if(!isEmpty(news.getName())){
            sql += " and name like '%" + news.getName()+"%' ";
        }
        sql += " order by id desc";
        Pager<News> pagers = newsService.findBySqlReturnEntity(sql);
        model.addAttribute("pagers",pagers);//将分页对象返回前端   前端进行分页处理
        model.addAttribute("obj",news);//若有查询条件  一并返回
        return "news/news";
    }

    /**
     * 跳转添加公告页面
     * @return 跳转add.jsp
     */
    @RequestMapping("/add")
    public String add(){

        return "news/add";
    }

    /**
     * 提交添加公告
     * @param news
     * @return
     */
    @RequestMapping("/exAdd")
    public String exAdd(News news){
        news.setAddTime(new Date());
        newsService.insert(news);
        return "redirect:/news/findBySql.action";
    }

    /**
     * 跳转修改公告页面
     * @return 跳转update.jsp
     */
    @RequestMapping("/update")
    public String update(Integer id,Model model){
        News byId = newsService.getById(id);
        model.addAttribute("obj",byId);
        return "news/update";
    }

    /**
     * 修改公告
     * @param news
     * @return
     */
    @RequestMapping("/exUpdate")
    public String exUpdate(News news){
        newsService.updateById(news);
        return "redirect:/news/findBySql";
    }
    /**
     * 根据id删除公告
     */
    @RequestMapping("/delete")
    public String delete(Integer id){
        newsService.deleteById(id);
        return "redirect:/news/findBySql";
    }

    /**
     * 进入公告查看页面
     * @return
     */
    @RequestMapping("/list")
    public String List(Model model){
        Pager<News> news = newsService.findBySqlReturnEntity("select * from news");
        model.addAttribute("pagers",news);
        return "news/list";
    }

    /**
     * 公告详情页面
     * @param id 公告id
     * @param model model传数据到前端
     * @return
     */
    @RequestMapping("/view")
    public String view(Integer id, Model model){
        News new1 = newsService.getById(id);
        model.addAttribute("obj",new1);
        return "news/view";
    }
}
