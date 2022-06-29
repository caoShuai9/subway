package com.subway.ssm.controller.admin;

import com.subway.ssm.entity.SubwayInfo;
import com.subway.ssm.service.SubwayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/admin/subway")
public class BackSubwayController {


    @Autowired
    private SubwayService subwayService;


    @RequestMapping(value = "")
    public String index(Model model) {
        List<SubwayInfo> subwayList = subwayService.getSubwayList();
        model.addAttribute("subwayList", subwayList);
        return "Admin/subway/subway";
    }


    @RequestMapping(value = "/insert")
    public String insertNoticeView() {
        return "Admin/subway/insert";
    }



    @RequestMapping(value = "/edit/{id}")
    public String editNoticeView(@PathVariable("id") Long id, Model model) {
        SubwayInfo subwayInfo = subwayService.getSubway(id);
        model.addAttribute("subwayInfo", subwayInfo);
        return "Admin/subway/edit";
    }



    /**
     *
     * @param subwayInfo
     * @return
     */
    @RequestMapping(value = "/insertSubway", method = RequestMethod.POST)
    public String insertSubway(SubwayInfo subwayInfo) {
        subwayService.insertSubway(subwayInfo);
        return "redirect:/admin/subway";
    }



    /**
     *
     * @param subwayInfo
     * @return
     */
    @RequestMapping(value = "/editSubway", method = RequestMethod.POST)
    public String editSubway(SubwayInfo subwayInfo) {
        subwayService.editSubway(subwayInfo);
        return "redirect:/admin/subway";
    }


    /**
     * 删除公告
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete/{id}")
    public String deleteSubway(@PathVariable("id") Long id) {
        subwayService.deleteSubway(id);
        return "redirect:/admin/subway";
    }


}
