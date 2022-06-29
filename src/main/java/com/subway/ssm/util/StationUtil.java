package com.subway.ssm.util;

import com.subway.ssm.entity.StationUtilResponse;
import com.subway.ssm.entity.SubwayStationInfo;

public class StationUtil {


    public static StationUtilResponse getStationList(SubwayStationInfo outsetStation,
                                                         SubwayStationInfo reachStation){


        StationUtilResponse response = new StationUtilResponse();

        Long outset = outsetStation.getSubwayId();
        Long reach = reachStation.getSubwayId();

        int outsetGroup = getGroup(outsetStation.getSubwayId());
        int reachGroup = getGroup(reachStation.getSubwayId());
        if (outsetGroup!=reachGroup){
            response.setPrice("--");
            response.setSubwayPath("始发站("+outsetStation.getSubwayStationName()+
                    ")无法通过地铁交通到达终点站("+reachStation.getSubwayStationName()+")！");
            return response;
        }

        if(outset.intValue()==reach.intValue()){
            Long aWeights = new Long(outsetStation.getWeights());
            Long bWeights = new Long(reachStation.getWeights());
            String price = getPrice(modulo(aWeights-bWeights));
            response.setPrice(price);
            response.setSubwayPath("始发站("+outsetStation.getSubwayStationName()+
                    ")乘做"+reachStation.getSubwayName()+
                    "到达("+reachStation.getSubwayStationName()+")");
            return response;
        }

        if(outsetGroup==1){
            if((outset.intValue()==1&&reach.intValue()==2)
                    ||(outset.intValue()==2&&reach.intValue()==1)){
                Long aWeights = new Long(outsetStation.getWeights());
                Long bWeights = new Long(reachStation.getWeights());
                String price = getPrice(modulo(aWeights-17L)+modulo(bWeights-17L));
                response.setPrice(price);
                response.setSubwayPath("始发站("+outsetStation.getSubwayStationName()+
                        ")在西安路地铁站换乘"+reachStation.getSubwayName()+
                        "到达("+reachStation.getSubwayStationName()+")");
                return response;
            }else if ((outset.intValue()==1&&reach.intValue()==12)
                    ||(outset.intValue()==12&&reach.intValue()==1)){
                Long aWeights = new Long(outsetStation.getWeights());
                Long bWeights = new Long(reachStation.getWeights());
                String price = getPrice(aWeights-bWeights);
                response.setPrice(price);
                response.setSubwayPath("始发站("+outsetStation.getSubwayStationName()+
                        ")在河口地铁站换乘"+reachStation.getSubwayName()+
                        "到达("+reachStation.getSubwayStationName()+")");
            }else{
                Long aWeights = new Long(outsetStation.getWeights());
                Long bWeights = new Long(reachStation.getWeights());
                if (outset.intValue()==2){
                    String price = getPrice(modulo(aWeights-17L)+modulo(bWeights-8L));
                    response.setPrice(price);
                    response.setSubwayPath("始发站("+outsetStation.getSubwayStationName()+
                            ")在西安路地铁站换乘1号线乘坐9站到达河口站换乘12号线到达("+reachStation.getSubwayStationName()+")");
                }else{
                    String price = getPrice(modulo(aWeights-8L)+modulo(bWeights-17L));
                    response.setPrice(price);
                    response.setSubwayPath("始发站("+outsetStation.getSubwayStationName()+
                            ")在河口站换乘1号线乘坐9站到达西安路地铁站换乘2号线到达("+reachStation.getSubwayStationName()+")");
                }
                return response;
            }

        }else{
            Long aWeights = new Long(outsetStation.getWeights());
            Long bWeights = new Long(reachStation.getWeights());
            String price = getPrice(aWeights-bWeights);
            response.setPrice(price);
            response.setSubwayPath("始发站("+outsetStation.getSubwayStationName()+
                    ")在开发区地铁站换乘"+reachStation.getSubwayName()+
                    "到达("+reachStation.getSubwayStationName()+")");
            return response;
        }
        return response;
    }


    private static int getGroup(Long subwayNum){
        if (subwayNum.intValue()==1||subwayNum.intValue()==2||subwayNum.intValue()==12){
            return 1;
        }else{
            return 2;
        }
    }


    public static String getPrice(long num) {
        if(num<=3){
            return "2¥";
        }else if(num>3&&num<=7){
            return "3¥";
        }else if (num>7&&num<=13){
            return "5¥";
        }else if (num>13){
            return "7¥";
        }
        return  "7¥";
    }


    public static long modulo(long val){
        if(val<0){
            val = -val;
        }
        return val;
    }

}
