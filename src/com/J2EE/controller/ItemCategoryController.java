package com.J2EE.controller;

import com.J2EE.base.BaseController;
import com.J2EE.pojo.Item;
import com.J2EE.pojo.ItemCategory;
import com.J2EE.pojo.StatisticsDto;
import com.J2EE.service.ItemCategoryService;
import com.J2EE.service.ItemService;
import com.J2EE.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 类目c层
 */
@Controller
@RequestMapping("/itemCategory")
public class ItemCategoryController extends BaseController {

    @Autowired
    private ItemCategoryService itemCategoryService;

    /**
     * 分页查询全部种类列表
     */
    @RequestMapping("/findBySql")
    public String findBySql(Model model, ItemCategory itemCategory){
        String sql = "select * from item_category where isDelete=0 and pid is null order by id";
        Pager<ItemCategory> pagers = itemCategoryService.findBySqlReturnEntity(sql);
        model.addAttribute("pagers",pagers);//将分页对象返回前端   前端进行分页处理
        model.addAttribute("obj",itemCategory);//若有查询条件  一并返回
        return "itemCategory/itemCategory";
    }

    /**
     * 跳转新增一级种类页面
     */
    @RequestMapping("/add")
    public String add(){
        return "itemCategory/add";
    }

    /**
     * 新增一级种类保存功能
     */
    @RequestMapping("/exAdd")
    public String exAdd(ItemCategory itemCategory){
        itemCategory.setIsDelete(0);
        itemCategoryService.insert(itemCategory);
        return "redirect:/itemCategory/findBySql";
    }

    /**
     * 跳转修改一级种类页面
     */
    @RequestMapping("/update")
    public String update(Integer id,Model model){
        ItemCategory obj = itemCategoryService.load(id);//根据页面传来的id查询返回一个对象
        model.addAttribute("obj",obj);//将对象传到页面
        return "itemCategory/update";
    }

    /**
     * 修改一级种类
     */
    @RequestMapping("/exUpdate")
    public String exUpdate(ItemCategory itemCategory){
        itemCategoryService.updateById(itemCategory);
        return "redirect:/itemCategory/findBySql";
    }

    /**
     * 删除一级种类
     */
    @RequestMapping("/delete")
    public String delete(Integer id){
        ItemCategory load = itemCategoryService.load(id);
        load.setIsDelete(1);//采用假删除  删除置1
        itemCategoryService.updateById(load);
        //将其下级目录也删除
        String sql = "update item_category set isDelete=1 where pid="+id;
        itemCategoryService.updateBysql(sql);
        return "redirect:/itemCategory/findBySql";
    }

    /**
     * 查看二级分类
     */
    @RequestMapping("findBySql2")
    public String findBySql2(ItemCategory itemCategory,Model model){
        String sql = "select * from item_category where isDelete=0 and pid="+itemCategory.getPid()+" order by id";
        Pager<ItemCategory> pagers = itemCategoryService.findBySqlReturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",itemCategory);
        return "itemCategory/itemCategory2";
    }

    /**
     * 跳转新增二级种类页面
     */
    @RequestMapping("/add2")
    public String add2(int pid,Model model){
        model.addAttribute("pid",pid);
        return "itemCategory/add2";
    }

    /**
     * 新增二级种类
     */
    @RequestMapping("/exAdd2")
    public String exAdd2(ItemCategory itemCategory){
        itemCategory.setIsDelete(0);
        itemCategoryService.insert(itemCategory);
        return "redirect:/itemCategory/findBySql2?pid="+itemCategory.getPid();
    }

    /**
     * 跳转修改二级种类页面
     */
    @RequestMapping("/update2")
    public String update2(Integer id,Model model){
        ItemCategory obj = itemCategoryService.load(id);//根据页面传来的id查询返回一个对象
        model.addAttribute("obj",obj);//将对象传到页面
        return "itemCategory/update2";
    }

    /**
     * 修改二级种类
     */
    @RequestMapping("/exUpdate2")
    public String exUpdate2(ItemCategory itemCategory){
        itemCategoryService.updateById(itemCategory);
        return "redirect:/itemCategory/findBySql2?pid="+itemCategory.getPid();
    }

    /**
     * 删除二级种类
     */
    @RequestMapping("/delete2")
    public String delete2(Integer id,Integer pid){
        ItemCategory load = itemCategoryService.load(id);
        load.setIsDelete(1);//采用假删除  删除置1
        itemCategoryService.updateById(load);
        return "redirect:/itemCategory/findBySql2?pid="+pid;
    }

    @Autowired
    private ItemService itemService;

    @RequestMapping(value = "/statistics")
    public String tj(ItemCategory itemCategory, Model model, HttpServletRequest request, HttpServletResponse response) {
        //分页查询
        String sql = "SELECT * FROM item_category WHERE isDelete = 0 and pid is null";
        sql += " ORDER BY ID DESC ";
        List<ItemCategory> list = itemCategoryService.listBySqlReturnEntity(sql);
        List<Map<String,Object>> maps = new ArrayList<Map<String,Object>>();
        List<StatisticsDto> res = new ArrayList<StatisticsDto>();
        if (!CollectionUtils.isEmpty(list)){
            for (ItemCategory c : list){
                StatisticsDto td = new StatisticsDto();
                int tot = 0;
                List<Item> listBySqlReturnEntity = itemService.listBySqlReturnEntity("SELECT * FROM item WHERE 1=1 and isDelete =0 and category_id_one="+c.getId());
                if (!CollectionUtils.isEmpty(listBySqlReturnEntity)){
                    for (Item i : listBySqlReturnEntity){
                        tot+= i.getGmNum();
                    }
                }
                Map<String,Object> map = new HashMap<String,Object>();
                map.put("name", c.getName());
                map.put("value", tot);
                maps.add(map);
            }
        }
        //存储查询条件
        model.addAttribute("maps", maps);
        return "itemCategory/statistics";
    }
}
