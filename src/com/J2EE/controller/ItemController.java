package com.J2EE.controller;


import com.J2EE.base.BaseController;
import com.J2EE.pojo.Item;
import com.J2EE.pojo.ItemCategory;
import com.J2EE.service.ItemCategoryService;
import com.J2EE.service.ItemService;
import com.J2EE.utils.Pager;
import com.J2EE.utils.SystemContext;
import com.J2EE.utils.UUIDUtils;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * 商品c层
 */
@Controller
@RequestMapping("/item")
public class ItemController extends BaseController {

    @Autowired
    private ItemService itemService;

    @Autowired
    private ItemCategoryService itemCategoryService;

    /**
     * 分页查询全部商品列表
     */
    @RequestMapping("/findBySql")
    public String findBySql(Model model, Item item) {
        String sql = "select * from item where isDelete = 0 ";
        if (!isEmpty(item.getName())) {
            sql += " and name like '%" + item.getName() + "%' ";
        }
        sql += " order by id desc";
        Pager<Item> pagers = itemService.findBySqlReturnEntity(sql);
        model.addAttribute("pagers", pagers);//将分页对象返回前端   前端进行分页处理
        model.addAttribute("obj", item);//若有查询条件  一并返回
        return "item/item";
    }

    /**
     * 跳转修改商品页面
     */
    @RequestMapping("/update")
    public String update(Integer id, Model model) {
        Item obj = itemService.load(id);//根据页面传来的id查询返回一个对象
        String sql = "select * from item_category where isDelete=0 and pid is not null order by id";
        List<ItemCategory> listBySqlReturnEntity = itemCategoryService.listBySqlReturnEntity(sql);
        model.addAttribute("types", listBySqlReturnEntity);
        model.addAttribute("obj", obj);//将对象传到页面
        return "item/update";
    }

    /**
     * 修改商品
     */
    @RequestMapping("/exUpdate")
    public String exUpdate(Item item, @RequestParam("file") CommonsMultipartFile[] files, HttpServletRequest request) throws IOException {
        ItemCommon(item, files, request);
        itemService.updateById(item);
        return "redirect:/item/findBySql.action";
    }


    /**
     * 跳转添加商品页面
     */
    @RequestMapping("/add")
    public String add(Model model) {
        String sql = "select * from item_category where isDelete=0 and pid is not null order by id";
        List<ItemCategory> listBySqlReturnEntity = itemCategoryService.listBySqlReturnEntity(sql);
        model.addAttribute("types", listBySqlReturnEntity);
        return "item/add";
    }

    /**
     * 添加商品
     *
     * @param item 前端返回的实体数据
     * @return 返回到商品页面
     */
    @RequestMapping("/exAdd")
    public String exAdd(Item item, @RequestParam("file") CommonsMultipartFile[] files, HttpServletRequest request) throws IOException {
        ItemCommon(item, files, request);
        item.setScNum(0);//初始化 收藏数 购买数 是否已删除为0
        item.setGmNum(0);
        item.setIsDelete(0);
        itemService.insert(item);
        return "redirect:/item/findBySql.action";
    }

    /**
     * 删除商品
     *
     * @Param id 前端返回的id  通过id进行删除
     */
    @RequestMapping("/delete")
    public String delete2(Integer id) {
        Item load = itemService.load(id);
        load.setIsDelete(1);//采用假删除  删除置1
        itemService.updateById(load);
        return "redirect:/item/findBySql";
    }

    /**
     * 新增 更新 公用方法
     *
     * @param item    商品对象
     * @param files   上传的文件
     * @param request 通过请求获取当前访问路径 从而可以访问到图片地址
     * @throws IOException
     */
    private void ItemCommon(Item item, CommonsMultipartFile[] files, HttpServletRequest request) throws IOException {
        if (files.length > 0) {//如果有文件上传
            for (int i = 0; i < files.length; i++) {//遍历上传上来的文件
                String n = UUIDUtils.create();//生成随机数
                String path = SystemContext.getRealPath() + "\\resource\\ueditor\\upload\\" + n + files[i].getOriginalFilename();//为文件生成名字
                File newFile = new File(path);//新文件
                files[i].transferTo(newFile);//通过CommonsMultipartFile方法直接写文件
                if (i == 0) {
                    //设置主图url
                    item.setUrl1(request.getContextPath() + "\\resource\\ueditor\\upload\\" + n + files[i].getOriginalFilename());
                }
                if (i == 1) {
                    //副图url1
                    item.setUrl2(request.getContextPath() + "\\resource\\ueditor\\upload\\" + n + files[i].getOriginalFilename());
                }
                if (i == 2) {
                    //副图url2
                    item.setUrl3(request.getContextPath() + "\\resource\\ueditor\\upload\\" + n + files[i].getOriginalFilename());
                }
                if (i == 3) {
                    //副图url3
                    item.setUrl4(request.getContextPath() + "\\resource\\ueditor\\upload\\" + n + files[i].getOriginalFilename());
                }
                if (i == 4) {
                    //副图url4
                    item.setUrl5(request.getContextPath() + "\\resource\\ueditor\\upload\\" + n + files[i].getOriginalFilename());
                }
            }
        }
        ItemCategory byId = itemCategoryService.getById(item.getCategoryIdTwo());
        item.setCategoryIdOne(byId.getPid());
    }

    /**
     * 浏览单独水果页面
     * @param id 前端传的id
     * @param model 返回数据给前端展示
     * @return 返回view.jsp进行展示
     */
    @RequestMapping("/view")
    public String view(Integer id, Model model) {
        Item item = itemService.load(id);
        model.addAttribute("obj", item);
        return "item/view";
    }

    /**
     * 按关键词或者二级分类查询
     * @param fruitName
     * @param model
     * @return
     */
    @RequestMapping("/shoplist")
    public String shopList(Item item,String condition,Model model){
        //自定义sql语句查询
        String sql = "select * from item where isDelete=0 ";
        if(!isEmpty(item.getCategoryIdTwo())){//如果二级目录不为空 根据二级目录查询
            sql += " and category_id_two = " + item.getCategoryIdTwo();
        }
        else if(!isEmpty(condition)){//如果关键词查询不为空 使用关键词模糊查询
            sql += " and name like '%" + condition + "%' ";
            model.addAttribute("condition",condition);
        }
        if(!isEmpty(item.getPrice())){//按照价格排序
            sql += " order by (price+0) desc";
        }
        if(!isEmpty(item.getGmNum())){//按照购买数量排序
            sql += " order by gmNum desc";
        }
        if(isEmpty(item.getPrice()) && isEmpty(item.getGmNum())){//都空默认排序
            sql += " order by id desc";
        }
        Pager<Item> items = itemService.findBySqlReturnEntity(sql);
        //返回前端
        model.addAttribute("pagers",items);
        model.addAttribute("obj",item);
        return "item/shoplist";
    }
}
