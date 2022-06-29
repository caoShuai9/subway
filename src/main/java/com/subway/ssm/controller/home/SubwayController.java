package com.subway.ssm.controller.home;

import com.subway.ssm.entity.*;
import com.subway.ssm.service.SubwayService;
import com.subway.ssm.service.SubwayStationService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

@Controller
public class SubwayController {

    @Autowired
    private SubwayStationService subwayStationService;

    @Autowired
    private SubwayService subwayService;

    /**
     * 地铁线路详情页显示
     *
     * @param subwayId 地铁线路ID
     * @return modelAndView
     */
    @RequestMapping(value = "/subway/{subwayId}")
    public String getArticleDetailPage(@PathVariable("subwayId") Long subwayId, Model model) {

        List<SubwayStationInfo> stationList = subwayStationService.getSubwayStationBySubwayId(subwayId);

        SubwayInfo subwayInfo = subwayService.getSubway(subwayId);
        if (stationList == null||subwayInfo == null) {
            return "Home/Error/404";
        }
        //获取上一篇文章
        model.addAttribute("stationList", stationList);
        model.addAttribute("subwayInfo", subwayInfo);
        return "Home/Page/subway";
    }

    /**
     * 地铁信息查询页
     * @param model
     * @return
     */
    @RequestMapping(value = "/queSubway")
    public String queSubway(Model model) {
        List<SubwayInfo> subwayList = subwayService.getSubwayList();
        model.addAttribute("subwayList", subwayList);
        //获取上一篇文章
        return "Home/Page/queSubway";
    }

    @ResponseBody
    @RequestMapping(value = "/getStationList", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public List<SubwayStationInfo> queSubway(Long subwayId) {
        List<SubwayStationInfo> stationList = subwayStationService.getSubwayStationBySubwayId(subwayId);
        return stationList;
    }


    @ResponseBody
    @RequestMapping(value = "/getStationUtil", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public StationUtilResponse queSubway(StationUtilArg arg) throws UnsupportedEncodingException {
        String arrivalAddress = arg.getArrivalAddress();
        String startingAddress = arg.getStartingAddress();
        if (StringUtils.isNotBlank(arrivalAddress)&&
                StringUtils.isNotBlank(startingAddress)){
            arrivalAddress = java.net.URLDecoder.decode(new String(arg.getArrivalAddress().getBytes("ISO-8859-1"), "UTF-8"), "UTF-8");
            startingAddress = java.net.URLDecoder.decode(new String(arg.getStartingAddress().getBytes("ISO-8859-1"), "UTF-8"), "UTF-8");
            arg.setArrivalAddress(arrivalAddress);
            arg.setStartingAddress(startingAddress);
        }
        StationUtilResponse response = subwayStationService.getStationUtil(arg);
        return response;
    }

}
