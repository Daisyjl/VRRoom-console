package com.leoman.common.core;

/**
 * Created by Administrator on 2016/2/22.
 */
public enum ErrorType {

    ERROR_CODE_0001("服务器异常", 1),
    ERROR_CODE_0002("登录超时，请重新登录", 2),
    ERROR_CODE_0003("找不到用户", 3),
    ERROR_CODE_0004("验证码错误", 4),
    ERROR_CODE_0005("旧密码错误", 5),
    ERROR_CODE_0006("用户已存在", 6),
    ERROR_CODE_0007("用户名或密码错误", 7),
    ERROR_CODE_0008("企业名称已存在", 8),
    ERROR_CODE_0009("该企业城市账号已存在", 9),
    ERROR_CODE_00010("楼盘名称已存在", 10),
    ERROR_CODE_00011("楼信息不存在", 11),
    ERROR_CODE_00012("楼盘封面图不能为空", 12),
    ERROR_CODE_00013("该横切面信息不能为空", 13),
    ERROR_CODE_00014("上传文件格式错误", 14),
    ERROR_CODE_00015("此方位已存在", 15),
    ERROR_CODE_00016("此面积范围已存在", 16),
    ERROR_CODE_00017("此特色已存在", 17),
    ERROR_CODE_00018("此居室已存在", 18),
    ERROR_CODE_00019("此装修类型已存在", 19),
    ERROR_CODE_00020("此价格范围已存在", 20),
    ERROR_CODE_00021("此时间范围已存在", 21),
    ERROR_CODE_00022("该角色已存在", 22),

    ErrorType;


    private String name;

    private int code;

    private ErrorType() {
    }

    private ErrorType(String name, int code) {
        this.name = name;
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
