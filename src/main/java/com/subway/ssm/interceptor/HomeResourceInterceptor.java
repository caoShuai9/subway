package com.subway.ssm.interceptor;

import com.subway.ssm.entity.Article;
import com.subway.ssm.entity.Menu;
import com.subway.ssm.entity.Options;
import com.subway.ssm.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author liuyanzhao
 */
@Component
public class HomeResourceInterceptor implements HandlerInterceptor {
    @Autowired
    private ArticleService articleService;

    @Autowired
    private OptionsService optionsService;

    @Autowired
    private MenuService menuService;

    /**
     * 在请求处理之前执行，该方法主要是用于准备资源数据的，然后可以把它们当做请求属性放到WebRequest中
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws IOException {
        // 菜单显示
        List<Menu> menuList = menuService.listMenu();
        request.setAttribute("menuList", menuList);
//        List<Category> categoryList = categoryService.listCategory();
//        request.setAttribute("allCategoryList", categoryList);
        Options options = optionsService.getOptions();
        request.setAttribute("options", options);
        //热门新闻列表
        List<Article> randomArticleList = articleService.listRandomHostArticle(8);
        request.setAttribute("randomArticleList", randomArticleList);
        //获得失物招领列表
        List<Article> lostAndFoundArticleList = articleService.listLostFoundArticle(8);
        request.setAttribute("lostAndFoundArticleList", lostAndFoundArticleList);
        return true;
    }


    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView)  {
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e)  {

    }
}