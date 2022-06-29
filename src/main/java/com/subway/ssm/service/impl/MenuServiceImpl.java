package com.subway.ssm.service.impl;

import com.subway.ssm.entity.Menu;
import com.subway.ssm.mapper.MenuMapper;
import com.subway.ssm.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author liuyanzhao
 */
@Service
public class MenuServiceImpl implements MenuService {


    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> listMenu() {
        List<Menu> menuList = menuMapper.listMenu();
        return menuList;
    }
//
//    @Override
//    public Menu insertMenu(Menu menu) {
//        menuMapper.insert(menu);
//        return menu;
//    }
//
//    @Override
//    public void deleteMenu(Integer id) {
//        menuMapper.deleteById(id);
//    }
//
//    @Override
//    public void updateMenu(Menu menu) {
//        menuMapper.update(menu);
//    }
//
//    @Override
//    public Menu getMenuById(Integer id) {
//        return menuMapper.getMenuById(id);
//    }
}
