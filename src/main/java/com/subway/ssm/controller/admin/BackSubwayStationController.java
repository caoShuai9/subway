package com.subway.ssm.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.subway.ssm.dto.JsonResult;
import com.subway.ssm.dto.Msg;
import com.subway.ssm.entity.SubwayInfo;
import com.subway.ssm.entity.SubwayStationInfo;
import com.subway.ssm.service.SubwayService;
import com.subway.ssm.service.SubwayStationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.net.Inet4Address;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/subwayStation")
public class BackSubwayStationController {
    @Autowired
    private SubwayStationService subwayStationService;
    @Autowired
    private SubwayService subwayService;

    @RequestMapping(value = "/")
    public String index(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model) {
        PageHelper.startPage(pn,5);
        List<SubwayStationInfo> subwayStationList = subwayStationService.getSubwayStationList();
        PageInfo page = new PageInfo(subwayStationList,5);
        model.addAttribute("subwayStationList", subwayStationList);
        model.addAttribute("pageinfo",page);
        System.out.println(page.getList());
        return "Admin/subwayStation/subwayStation";
    }
//    @ResponseBody
//    @RequestMapping("/subways")
//    public JsonResult getEmpsWithJson(
//            @RequestParam(value = "pn",defaultValue = "1")Integer pn,Model model){
//
//        //引入pagehelper分页插件
//        //在查询之前只需要调用,插入页码，以及每页的大小
//        PageHelper.startPage(pn,15);
//        //startPage后面紧跟的这个查询就是分页查询
//        List<SubwayStationInfo> subwayStationList = subwayStationService.getSubwayStationList();
//        //使用pageinfo包装查询后的结果，只需要将pageinfo交给页面就行
//        //封装了详细的分页信息，包括有我们查询出来的数据,传入连续显示的页数
//        PageInfo page = new PageInfo(subwayStationList,15);
//        model.addAttribute("subwayStationList", subwayStationList);
//
//        return JsonResult.ok().add("pageinfo",page);
//
//    }

    @RequestMapping(value = "/insert")
    public String insertSubwayStationView(Model model) {
        List<SubwayInfo> subwayList = subwayService.getSubwayList();
        model.addAttribute("subwayList", subwayList);
        return "Admin/subwayStation/insert";
    }

    @RequestMapping(value = "/delete/{id}")
    public String deleteSubwayStation(@PathVariable("id") Long id) {
        subwayStationService.deleteSubwayStation(id);
        return "redirect:/admin/subwayStation/";
    }

    /**
     * @param id
     * @return
     */
    @RequestMapping(value = "/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        SubwayStationInfo subwayStationInfo = subwayStationService.getSubwayStationById(id);
        List<SubwayInfo> subwayList = subwayService.getSubwayList();
        model.addAttribute("subwayStation", subwayStationInfo);
        model.addAttribute("subwayList", subwayList);
        return "Admin/subwayStation/edit";
    }

    @RequestMapping(value = "/insertSubwayStation", method = RequestMethod.POST)
    public String insertSubwayStation(SubwayStationInfo subwayStationInfo) {
        subwayStationService.insertSubwayStation(subwayStationInfo);
        return "redirect:/admin/subwayStation/";
    }

    @RequestMapping(value = "/editSubwayStation", method = RequestMethod.POST)
    public String editSubwayStation(SubwayStationInfo subwayStationInfo) {
        subwayStationService.editSubwayStation(subwayStationInfo);
        return "redirect:/admin/subwayStation/";
    }

}
