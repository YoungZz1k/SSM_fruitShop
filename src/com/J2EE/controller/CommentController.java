package com.J2EE.controller;

import com.J2EE.base.BaseController;
import com.J2EE.pojo.Comment;
import com.J2EE.service.CommentService;
import com.J2EE.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequestMapping("/comment")
public class CommentController extends BaseController {


    @Autowired
    private CommentService commentService;

    @RequestMapping("/exAdd")
    public String exAdd(Comment comment, HttpServletRequest request){
        //判断是否登录
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute == null){//未登录状态
            return "redirect:/login/uLogin";
        }
        Integer id = Integer.valueOf(attribute.toString());
        comment.setUserId(id);
        comment.setAddTime(new Date());
        commentService.insert(comment);
        return "redirect:/itemOrder/my.action";
    }
}
