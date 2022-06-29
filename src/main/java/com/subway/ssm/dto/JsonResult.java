package com.subway.ssm.dto;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 言曌
 * @date 2017/11/30 下午7:04
 */

@Data
public class JsonResult<T> {


    /**
     * 错误码
     */
    private Integer code;

    /**
     * 提示信息
     */
    private String msg;

    /**
     * 返回的具体内容
     */
    private T data;

    //用户返回给浏览器的数据
    private Map<String,Object> extend = new HashMap<String, Object>();


    public JsonResult(Integer code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public JsonResult() {
    }


    public JsonResult fail() {
        return new JsonResult(1, "操作失败", null);
    }

    public JsonResult fail(String msg) {
        return new JsonResult(1, msg, null);
    }

    public static JsonResult ok() {
        return new JsonResult(0, "操作成功", null);
    }


    public JsonResult ok(T data) {
        return new JsonResult(0, "操作成功", data);
    }

    public JsonResult add(String key,Object value){

        this.getExtend().put(key,value);
        return this;

    }
}
