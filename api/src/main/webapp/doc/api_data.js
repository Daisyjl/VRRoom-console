define({ "api": [
  {
    "type": "post",
    "url": "/app/index/creatorDynamic",
    "title": "6、首页主创动态列表",
    "version": "0.0.1",
    "name": "index_creatorDynamic",
    "group": "index",
    "description": "<p>首页主创动态列表</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>主创动态ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.content",
            "description": "<p>内容</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.creatorId",
            "description": "<p>主创ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.name",
            "description": "<p>主创名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.avater",
            "description": "<p>主创头像</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"date\": \"2016-06-27\",\n                 \"dynamicList\": [\n                     {\n                         \"id\": 12,\n                         \"content\": \"正在发送弹幕\",\n                         \"creatorId\": 1,\n                         \"name\": \"罗大佑\",\n                         \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\"\n                     }\n                 ],\n                 \"date\": \"2016-06-28\",\n                 \"dynamicList\": [\n                     {\n                         \"id\": 13,\n                         \"content\": \"正在查看帖子\",\n                         \"creatorId\": 2,\n                         \"name\": \"李冰冰\",\n                         \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\"\n                     }\n                 ]\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/indexapi/controller/IndexApiController.java",
    "groupTitle": "index",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/index/creatorDynamic"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/index/floatWin",
    "title": "10、首页浮窗广告",
    "version": "0.0.1",
    "name": "index_floatWin",
    "group": "index",
    "description": "<p>首页浮窗广告</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>浮窗广告id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.title",
            "description": "<p>标题</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.cover",
            "description": "<p>封面</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.position",
            "description": "<p>链接位置 0:帖子 1:视频 2:小说 3:漫画</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.workId",
            "description": "<p>作品id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.detailId",
            "description": "<p>作品详情id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.status",
            "description": "<p>状态，0=显示，1=隐藏，默认为0</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.time",
            "description": "<p>时间</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.createDate",
            "description": "<p>创建时间</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.updateDate",
            "description": "<p>修改时间</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\": 0,\n     \"msg\": \"\",\n     \"data\": {\n         \"floatWin\": {\n             \"title\": \"测试广告\",\n             \"cover\": \"http://www.qq.com/image/default.jpg\",\n             \"position\": 0,\n             \"detailId\": 2,\n             \"status\": 0,\n             \"time\": \"1466502068224\",\n             \"workId\": 10,\n             \"id\": 14,\n             \"createDate\": \"1466502068224\",\n             \"updateDate\": \"\"\n         }\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/indexapi/controller/IndexApiController.java",
    "groupTitle": "index",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/index/floatWin"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/index/listBanner",
    "title": "4、首页banner图列表",
    "version": "0.0.1",
    "name": "index_listBanner",
    "group": "index",
    "description": "<p>首页banner图列表</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.cover",
            "description": "<p>封面地址</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.linkUrl",
            "description": "<p>外链地址(为空:则跳转内部链接)</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.position",
            "description": "<p>链接位子 0:帖子 1:视频 2:小说 3:漫画</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.workId",
            "description": "<p>作品ID</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>banner图ID</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"cover\" : \"http://localhost:8080\",\n                 \"linkUrl\" : \"http://localhost:8080\",\n                 \"position\" : \"0\",\n                 \"workId\" : \"1\"\n                 \"id\" : 1\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/indexapi/controller/IndexApiController.java",
    "groupTitle": "index",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/index/listBanner"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/index/listWorks",
    "title": "5、首页作品列表",
    "version": "0.0.1",
    "name": "index_listWorks",
    "group": "index",
    "description": "<p>首页作品列表</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "time",
            "description": "<p>时间（年月日，时分秒不要，如：2016-6-20）</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.name",
            "description": "<p>标题</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.description",
            "description": "<p>说明</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.cover",
            "description": "<p>封面地址</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.isBarrage",
            "description": "<p>主创发送弹幕状态，0：已发送，1=未发送</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.creatorId",
            "description": "<p>主创ID</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.position",
            "description": "<p>链接位子 1:视频 2:小说 3:漫画</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.workId",
            "description": "<p>链接ID</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>作品ID</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"name\" : \"阳光午后\",\n                 \"description\" : \"阳光下的午后\",\n                 \"cover\" : \"http://localhost:8080\",\n                 \"isBarrage\" : \"0\",\n                 \"creatorId\" : \"12\",\n                 \"position\" : \"1\",\n                 \"workId\" : \"1\"\n                 \"id\" : 1\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/indexapi/controller/IndexApiController.java",
    "groupTitle": "index",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/index/listWorks"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/index/login",
    "title": "3、登录",
    "version": "0.0.1",
    "name": "index_login",
    "group": "index",
    "description": "<p>登录</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "mobile",
            "description": "<p>手机号 (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "password",
            "description": "<p>密码 (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "userinfo",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.mobile",
            "description": "<p>手机</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.nickname",
            "description": "<p>昵称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.gender",
            "description": "<p>性别</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.avater",
            "description": "<p>头像</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.level",
            "description": "<p>会员等级</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.funs",
            "description": "<p>粉丝数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.focus",
            "description": "<p>关注数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.posts",
            "description": "<p>发帖数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.praises",
            "description": "<p>主创点赞数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.coin",
            "description": "<p>馒头币</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.integral",
            "description": "<p>积分</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.isCreator",
            "description": "<p>会员类型 0:普通会员 1:主创</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "userinfo.id",
            "description": "<p>id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.createTime",
            "description": "<p>注册时间</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\": 0,\n     \"msg\": \"\",\n     \"data\": {\n         \"userInfo\": {\n             \"mobile\": \"13872116519\",\n             \"nickname\": \"老大\",\n             \"gender\": 0,\n             \"avater\": \"\",\n             \"level\": 0,\n             \"funs\": 0,\n             \"focus\": 0,\n             \"posts\": 0,\n             \"praises\": 0,\n             \"coin\": 0,\n             \"integral\": 0,\n             \"isCreator\": 0,\n             \"id\": 14,\n             \"createTime\": \"2016-06-20 03:45:25\"\n         }\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/indexapi/controller/IndexApiController.java",
    "groupTitle": "index",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/index/login"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/index/loginPlus",
    "title": "9、第三方登录",
    "version": "0.0.1",
    "name": "index_loginPlus",
    "group": "index",
    "description": "<p>第三方登录</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "openId",
            "description": "<p>唯一标识               (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<p>类型，1:微信 2:微博     (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\": 0,\n     \"msg\": \"\",\n     \"data\": {\n         \"userInfo\": {\n             \"mobile\": \"13872116519\",\n             \"nickname\": \"老大\",\n             \"gender\": 0,\n             \"avater\": \"\",\n             \"level\": 0,\n             \"funs\": 0,\n             \"focus\": 0,\n             \"posts\": 0,\n             \"praises\": 0,\n             \"coin\": 0,\n             \"integral\": 0,\n             \"isCreator\": 0,\n             \"id\": 14,\n             \"createTime\": \"2016-06-20 03:45:25\"\n         }\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/indexapi/controller/IndexApiController.java",
    "groupTitle": "index",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/index/loginPlus"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/index/register",
    "title": "2、注册",
    "version": "0.0.1",
    "name": "index_register",
    "group": "index",
    "description": "<p>注册</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "mobile",
            "description": "<p>手机号 (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "nickname",
            "description": "<p>昵称 (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "password",
            "description": "<p>密码 (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>验证码 (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "inviteId",
            "description": "<p>邀请人ID</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "userinfo",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.mobile",
            "description": "<p>手机</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.nickname",
            "description": "<p>昵称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.gender",
            "description": "<p>性别</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.avater",
            "description": "<p>头像</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.level",
            "description": "<p>会员等级</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.funs",
            "description": "<p>粉丝数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.focus",
            "description": "<p>关注数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.posts",
            "description": "<p>发帖数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.praises",
            "description": "<p>主创点赞数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.coin",
            "description": "<p>馒头币</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.integral",
            "description": "<p>积分</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.isCreator",
            "description": "<p>会员类型 0:普通会员 1:主创</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "userinfo.id",
            "description": "<p>id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userinfo.createTime",
            "description": "<p>注册时间</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\": 0,\n     \"msg\": \"\",\n     \"data\": {\n         \"userInfo\": {\n             \"mobile\": \"13872116519\",\n             \"nickname\": \"老大\",\n             \"gender\": 0,\n             \"avater\": \"\",\n             \"level\": 0,\n             \"funs\": 0,\n             \"focus\": 0,\n             \"posts\": 0,\n             \"praises\": 0,\n             \"coin\": 0,\n             \"integral\": 0,\n             \"isCreator\": 0,\n             \"id\": 14,\n             \"createTime\": \"2016-06-20 03:45:25\"\n         }\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/indexapi/controller/IndexApiController.java",
    "groupTitle": "index",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/index/register"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/index/sendCode",
    "title": "1、发送验证码",
    "version": "0.0.1",
    "name": "index_sendCode",
    "group": "index",
    "description": "<p>发送验证码</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "mobile",
            "description": "<p>手机号 (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/indexapi/controller/IndexApiController.java",
    "groupTitle": "index",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/index/sendCode"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/index/signIn",
    "title": "8、签到",
    "version": "0.0.1",
    "name": "index_signIn",
    "group": "index",
    "description": "<p>签到</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\": 0,\n     \"msg\": \"\",\n     \"data\": {}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/indexapi/controller/IndexApiController.java",
    "groupTitle": "index",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/index/signIn"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/index/workList",
    "title": "7、作品集列表",
    "version": "0.0.1",
    "name": "index_workList",
    "group": "index",
    "description": "<p>作品集列表</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>作品集id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.name",
            "description": "<p>作品集名称</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.type",
            "description": "<p>类型：4:视频 5:小说 6:漫画</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.url",
            "description": "<p>图片路径</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"id\" : 1,\n                 \"name\" : \"器灵视频\",\n                 \"type\" : 4,\n                 \"url\" : \"http://4.16.3.22:8080/images/head.jpg\"\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/indexapi/controller/IndexApiController.java",
    "groupTitle": "index",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/index/workList"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/message/letterList",
    "title": "4、我的私信列表",
    "version": "0.0.1",
    "name": "message_letterList",
    "group": "message",
    "description": "<p>我的私信列表</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>id</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list.fromUserInfo",
            "description": "<p>发送用户</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.fromUserInfo.userId",
            "description": "<p>发送用户ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.fromUserInfo.nickname",
            "description": "<p>发送用户名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.fromUserInfo.avater",
            "description": "<p>发送用户头像</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list.toUserInfo",
            "description": "<p>接收用户</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.toUserInfo.userId",
            "description": "<p>接收用户ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.toUserInfo.nickname",
            "description": "<p>接收用户名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.toUserInfo.avater",
            "description": "<p>接收用户头像</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.content",
            "description": "<p>文本内容</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.voice",
            "description": "<p>声音文件URL</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.image",
            "description": "<p>图片文件URL</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.createDate",
            "description": "<p>发送时间</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.updateDate",
            "description": "<p>修改时间</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"id\": 1,\n                 \"fromUserInfo\": {\n                     \"userId\":1,\n                     \"nickname\":\"洛天依\",\n                     \"avater\":\"http://4.16.3.22:8888/voice/20160701voice.mp3\"\n                 },\n                 \"toUserInfo\": {\n                     \"userId\":1,\n                     \"nickname\":\"洛天依\",\n                     \"avater\":\"http://4.16.3.22:8888/voice/20160701voice.mp3\"\n                 },\n                 \"content\": \"你好\",\n                 \"voice\": \"http://4.16.3.22:8888/voice/20160701voice.mp3\",\n                 \"image\": \"http://4.16.3.22:8888/image/20160701image.jpg\",\n                 \"createDate\": 1466501548562,\n                 \"updateDate\": \"\"\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/messageapi/controller/MessageApiController.java",
    "groupTitle": "message",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/message/letterList"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/message/messageList",
    "title": "3、通知消息列表",
    "version": "0.0.1",
    "name": "message_messageList",
    "group": "message",
    "description": "<p>通知消息列表</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>id</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.title",
            "description": "<p>消息标题</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.content",
            "description": "<p>消息内容</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.createDate",
            "description": "<p>创建时间</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.updateDate",
            "description": "<p>修改时间</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"title\": \"器灵帖子\",\n                 \"content\": \"器灵帖子\",\n                 \"id\": 1,\n                 \"createDate\": 1466501548562,\n                 \"updateDate\": \"\"\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/messageapi/controller/MessageApiController.java",
    "groupTitle": "message",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/message/messageList"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/message/praiseList",
    "title": "2、点赞我的帖子的用户列表",
    "version": "0.0.1",
    "name": "message_praiseList",
    "group": "message",
    "description": "<p>点赞我的帖子的用户列表</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>id</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.nickname",
            "description": "<p>点赞用户ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.avater",
            "description": "<p>点赞用户头像</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.postName",
            "description": "<p>帖子名称</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.createDate",
            "description": "<p>创建时间</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"id\": 9,\n                 \"nickname\": \"复合机\",\n                 \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\",\n                 \"postName\": \"海绵宝宝粉\",\n                 \"createDate\": 1466664116692\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/messageapi/controller/MessageApiController.java",
    "groupTitle": "message",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/message/praiseList"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/message/replyMeList",
    "title": "1、回复我的列表",
    "version": "0.0.1",
    "name": "message_replyMeList",
    "group": "message",
    "description": "<p>回复我的列表</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>id</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.userId",
            "description": "<p>回复用户ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.name",
            "description": "<p>回复用户名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.avater",
            "description": "<p>回复用户封面</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.content",
            "description": "<p>回复内容</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.sourceId",
            "description": "<p>关联目标ID</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.sourceType",
            "description": "<p>关联目标类型 (4:视频 5:漫画 6:小说 7:帖子)</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.sourceName",
            "description": "<p>关联目标名称</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.sourceAvater",
            "description": "<p>关联目标封面</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.sourceAuthor",
            "description": "<p>关联目标作者</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.createDate",
            "description": "<p>创建时间</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"id\": 9,\n                 \"userId\": 2,\n                 \"name\": \"复合机\",\n                 \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\",\n                 \"content\": \"呵呵\",\n                 \"sourceId\": 8,\n                 \"sourceType\": 4,\n                 \"sourceName\": \"海绵宝宝粉\",\n                 \"sourceAvater\": \"\",\n                 \"sourceAuthor\": \"\",\n                 \"createDate\": 1466664116692\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/messageapi/controller/MessageApiController.java",
    "groupTitle": "message",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/message/replyMeList"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/message/sendLetter",
    "title": "5、发送私信",
    "version": "0.0.1",
    "name": "message_sendLetter",
    "group": "message",
    "description": "<p>发送私信</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>发送用户ID        (必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "toUserId",
            "description": "<p>接收用户ID        (必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>文本内容</p>"
          },
          {
            "group": "Parameter",
            "type": "Stream",
            "optional": false,
            "field": "voice",
            "description": "<p>声音url</p>"
          },
          {
            "group": "Parameter",
            "type": "Stream",
            "optional": false,
            "field": "image",
            "description": "<p>图片url</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/messageapi/controller/MessageApiController.java",
    "groupTitle": "message",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/message/sendLetter"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/post/comment/list",
    "title": "5、评论列表",
    "version": "0.0.1",
    "name": "post_comment_list",
    "group": "post",
    "description": "<p>评论列表</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<p>类别 0:普通贴 1:直播贴 2:投票贴 3:用户帖  (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "postId",
            "description": "<p>帖子id                                 (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>评论ID</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.userId",
            "description": "<p>评论人ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.nickname",
            "description": "<p>评论人昵称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.avater",
            "description": "<p>评论人头像</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.content",
            "description": "<p>评论内容</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.createDate",
            "description": "<p>评论时间</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list.replyList",
            "description": "<p>评论回复列表</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.replyList.id",
            "description": "<p>评论回复ID</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.replyList.userId",
            "description": "<p>回复人ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.replyList.nickname",
            "description": "<p>回复人昵称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.replyList.avater",
            "description": "<p>回复人头像</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.replyList.content",
            "description": "<p>回复内容</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.replyList.createDate",
            "description": "<p>回复时间</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"id\": 1,\n                 \"userId\": 1,\n                 \"nickname\": \"洛天依\",\n                 \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\",\n                 \"content\": \"巴拉巴拉小魔杖\",\n                 \"createDate\": \"2016-06-21 05:32:28\",\n                 \"replyList\": [\n                     {\n                         \"id\": 3,\n                         \"userId\": 1,\n                         \"nickname\": \"洛天依\",\n                         \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\",\n                         \"content\": \"巴拉巴拉小魔杖\",\n                         \"createDate\": \"2016-06-21 05:32:28\"\n                     }\n                 ]\n             },\n             {\n                 \"id\": 2,\n                 \"userId\": 2,\n                 \"nickname\": \"复合机\",\n                 \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\",\n                 \"content\": \"巴拉巴拉小魔杖\",\n                 \"createDate\": \"2016-06-21 05:32:42\",\n                 \"replyList\": []\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/postapi/controller/PostController.java",
    "groupTitle": "post",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/post/comment/list"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/post/detail",
    "title": "3、帖子详情",
    "version": "0.0.1",
    "name": "post_detail",
    "group": "post",
    "description": "<p>帖子详情</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "postId",
            "description": "<p>帖子ID                                     (必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<p>帖子类型 0:普通帖 1:直播帖 2:投票帖 3:用户帖  (必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "post",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "post.id",
            "description": "<p>帖子ID</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "post.type",
            "description": "<p>帖子类型 0:普通帖 1:直播帖 2:投票帖 3:用户帖</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "post.content",
            "description": "<p>帖子内容</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "post.createDate",
            "description": "<p>发布时间</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "post.status",
            "description": "<p>状态（0：正常，1=锁帖）</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "post.comment",
            "description": "<p>评论数</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "post.praise",
            "description": "<p>点赞数</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "post.user",
            "description": "<p>发帖人</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "post.user.id",
            "description": "<p>发帖人ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "post.user.nickname",
            "description": "<p>发帖人昵称</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "post.user.level",
            "description": "<p>发帖人等级</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "post.user.avater",
            "description": "<p>发帖人头像</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "post.user.isAttention",
            "description": "<p>是否关注该发帖人（0：已关注，1：未关注）</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.user.isCreator",
            "description": "<p>是否主创（0：否，1：是）</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "post.imageList",
            "description": "<p>图片列表</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "post.imageList.id",
            "description": "<p>图片ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "post.imageList.url",
            "description": "<p>图片链接</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "post.userList",
            "description": "<p>点赞用户列表</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "post.userList.id",
            "description": "<p>点赞用户id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "post.userList.nickname",
            "description": "<p>点赞用户昵称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "post.userList.avater",
            "description": "<p>点赞用户头像</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "post.commentList",
            "description": "<p>最新三条评论列表</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "post.commentList.userId",
            "description": "<p>评论人ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "post.commentList.nickname",
            "description": "<p>评论人昵称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "post.commentList.avater",
            "description": "<p>评论人头像</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "post.commentList.content",
            "description": "<p>评论内容</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "post.commentList.createDate",
            "description": "<p>评论时间</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "post.tpPostSubList",
            "description": "<p>投票列表（仅投票帖适用）</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "post.tpPostSubList.name",
            "description": "<p>投票候选人名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "post.tpPostSubList.cover",
            "description": "<p>投票候选人头像</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "post.tpPostSubList.count",
            "description": "<p>投票候选人票数</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "post.tpPostSubList.status",
            "description": "<p>是否投票，0：已投票  1：未投票</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "post.zbSubList",
            "description": "<p>直播列表（仅直播帖适用）</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "post.zbSubList.content",
            "description": "<p>直播内容</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "post.zbSubList.imageList",
            "description": "<p>直播图片列表</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "post.zbSubList.imageList.id",
            "description": "<p>直播图片ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "post.zbSubList.imageList.url",
            "description": "<p>直播图片路径</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"postInfo\": [\n             {\n                 \"id\": 2,\n                 \"type\": 2,\n                 \"content\": \"帖子分类是1\",\n                 \"createDate\": \"1466501562661\",\n                 \"user\": {\n                     \"id\": 1,\n                     \"nickname\": \"洛天依\",\n                     \"level\": 0,\n                     \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\",\n                     \"isAttention\": 1\n                 },\n                 \"imageList\": [\n                     {\n                         \"id\": 2,\n                         \"url\": \"http://4.16.3.22:8080/images/2016/6/1466563262995.jpg\"\n                     }\n                 ],\n                 \"userList\": [\n                     {\n                         \"id\": 3,\n                         \"nickname\": \"王小二\",\n                         \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\"\n                     }\n                 ],\n                 \"commentList\": [\n                     {\n                         \"userId\": 1,\n                         \"nickname\": \"白小飞\",\n                         \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\",\n                         \"content\": \"不错，赞一个~~~\",\n                         \"createDate\": \"1466501562661\",\n                         \"replyList\": [\n                             {\n                                 \"userId\": 1,\n                                 \"nickname\": \"白小飞\",\n                                 \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\",\n                                 \"content\": \"不错，赞一个~~~\",\n                                 \"createDate\": \"1466501562661\"\n                             }\n                         ]\n                     }\n                 ],\n                 \"tpPostSubList\": [\n                     {\n                         \"id\": 1,\n                         \"name\": \"白小飞\",\n                         \"cover\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\",\n                         \"count\": 1263,\n                         \"status\": 0\n                     },\n                     {\n                         \"id\": 2,\n                         \"name\": \"马化腾\",\n                         \"cover\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\",\n                         \"count\": 1254,\n                         \"status\": 1\n                     }\n                 ],\n                 \"zbSubList\": [\n                     {\n                         \"content\": \"巴拉巴拉巴拉巴拉巴拉巴拉\",\n                         \"imageList\": [\n                             {\n                                 \"id\": 1,\n                                 \"url\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\"\n                             }\n                         ]\n                     }\n                 ]\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/postapi/controller/PostController.java",
    "groupTitle": "post",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/post/detail"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/post/insert",
    "title": "1、发表帖子",
    "version": "0.0.1",
    "name": "post_insert",
    "group": "post",
    "description": "<p>帖子列表</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "category",
            "description": "<p>分类Id</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>帖子内容</p>"
          },
          {
            "group": "Parameter",
            "type": "Stream",
            "optional": false,
            "field": "file",
            "description": "<p>图片</p>"
          },
          {
            "group": "Parameter",
            "type": "Stream",
            "optional": false,
            "field": "voice",
            "description": "<p>语音</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/postapi/controller/PostController.java",
    "groupTitle": "post",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/post/insert"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/post/insertComment",
    "title": "6、发表评论",
    "version": "0.0.1",
    "name": "post_insertComment",
    "group": "post",
    "description": "<p>发表评论</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<p>类别 0:普通贴 1:直播贴 2:投票贴 3:用户帖  (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "postId",
            "description": "<p>帖子id                                 (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "userId",
            "description": "<p>评论人id                               (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>评论内容                               (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/postapi/controller/PostController.java",
    "groupTitle": "post",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/post/insertComment"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/post/insertReply",
    "title": "9、回复评论",
    "version": "0.0.1",
    "name": "post_insertReply",
    "group": "post",
    "description": "<p>回复评论</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "postCommentId",
            "description": "<p>评论id                                 (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>评论人id                               (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>评论内容                               (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/postapi/controller/PostController.java",
    "groupTitle": "post",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/post/insertReply"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/post/list/",
    "title": "2、帖子列表",
    "version": "0.0.1",
    "name": "post_list",
    "group": "post",
    "description": "<p>帖子列表</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "key",
            "description": "<p>搜索关键词</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "position",
            "description": "<p>位置 0:社区 1:艺人区(必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "category",
            "description": "<p>类别Id 为空 则为默认分类 &quot;0：发现&quot;</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<p>分类 默认&quot;发现&quot;：0：热门帖子 1：我的关注 其他类别  : 0：最新 1：精华</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "isMe",
            "description": "<p>isMe=1时，查询我发布的帖子</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>帖子ID</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.type",
            "description": "<p>帖子类型 0:普通帖 1:直播帖 2:投票帖 3:用户帖</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.content",
            "description": "<p>帖子内容</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.createDate",
            "description": "<p>发布时间</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.status",
            "description": "<p>状态（0：正常，1=锁帖）</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.comment",
            "description": "<p>评论数</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.praise",
            "description": "<p>点赞数</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list.user",
            "description": "<p>发帖人</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.user.id",
            "description": "<p>发帖人ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.user.nickname",
            "description": "<p>发帖人昵称</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.user.level",
            "description": "<p>发帖人等级</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.user.avater",
            "description": "<p>发帖人头像</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.user.isAttention",
            "description": "<p>是否关注该发帖人（0：已关注，1：未关注）</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.user.isCreator",
            "description": "<p>是否主创（0：否，1：是）</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list.imageList",
            "description": "<p>图片列表</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.imageList.id",
            "description": "<p>图片ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.imageList.url",
            "description": "<p>图片链接</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list.userList",
            "description": "<p>点赞用户列表</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.userList.id",
            "description": "<p>点赞用户id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.userList.nickname",
            "description": "<p>点赞用户昵称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.userList.avater",
            "description": "<p>点赞用户头像</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list.commentList",
            "description": "<p>最新三条评论列表</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.commentList.userId",
            "description": "<p>评论人ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.commentList.nickname",
            "description": "<p>评论人昵称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.commentList.avater",
            "description": "<p>评论人头像</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.commentList.content",
            "description": "<p>评论内容</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.commentList.createDate",
            "description": "<p>评论时间</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"id\": 2,\n                 \"type\": 2,\n                 \"content\": \"帖子分类是1\",\n                 \"createDate\": \"1466501548562\",\n                 \"user\": {\n                     \"id\": 1,\n                     \"nickname\": \"洛天依\",\n                     \"level\": 0,\n                     \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\",\n                     \"isAttention\": 1\n                 },\n                 \"imageList\": [\n                     {\n                         \"id\": 2,\n                         \"url\": \"http://4.16.3.22:8080/images/2016/6/1466563262995.jpg\"\n                     }\n                 ],\n                 \"userList\": [\n                     {\n                         \"id\": 3,\n                         \"nickname\": \"王小二\",\n                         \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\"\n                     }\n                 ],\n                 \"commentList\": [\n                     {\n                         \"userId\": 1,\n                         \"nickname\": \"白小飞\",\n                         \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\",\n                         \"content\": \"不错，赞一个~~~\",\n                         \"createDate\": \"2016-06-22 09:21:33\"\n                     }\n                 ]\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/postapi/controller/PostController.java",
    "groupTitle": "post",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/post/list/"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/post/reward",
    "title": "10、打赏主创",
    "version": "0.0.1",
    "name": "post_reward",
    "group": "post",
    "description": "<p>打赏主创</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "creatorId",
            "description": "<p>主创ID                               (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID                               (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "count",
            "description": "<p>馒头数                               (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/postapi/controller/PostController.java",
    "groupTitle": "post",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/post/reward"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/post/vote",
    "title": "11、投票帖投票",
    "version": "0.0.1",
    "name": "post_vote",
    "group": "post",
    "description": "<p>投票帖投票</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID                               (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "tpPostSubId",
            "description": "<p>投票项ID                             (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/postapi/controller/PostController.java",
    "groupTitle": "post",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/post/vote"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/report/feedback",
    "title": "2、意见反馈",
    "version": "0.0.1",
    "name": "report_feedback",
    "group": "report",
    "description": "<p>意见反馈</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>反馈人id</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>反馈内容</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/reportapi/controller/ReportApiController.java",
    "groupTitle": "report",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/report/feedback"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/report/report",
    "title": "1、举报",
    "version": "0.0.1",
    "name": "report_report",
    "group": "report",
    "description": "<p>举报</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>举报人id</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "postId",
            "description": "<p>帖子id</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>举报类型</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<p>分类(0:普通贴 1:直播贴 2:投票贴 )</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/reportapi/controller/ReportApiController.java",
    "groupTitle": "report",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/report/report"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/resource/detailJz",
    "title": "2、剧照详情 - 图片列表",
    "version": "0.0.1",
    "name": "resource_detailJz",
    "group": "resource",
    "description": "<p>剧照详情 - 图片列表</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "stillId",
            "description": "<p>剧照ID                    (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.url",
            "description": "<p>图片路径</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.num",
            "description": "<p>下载量</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\":[\n             {\n                 \"id\": 1,\n                 \"url\": \"http://www.qq.com\",\n                 \"num\": 10\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/reourceapi/controller/ResourceController.java",
    "groupTitle": "resource",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/resource/detailJz"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/resource/listGame",
    "title": "4、游戏列表",
    "version": "0.0.1",
    "name": "resource_listGame",
    "group": "resource",
    "description": "<p>游戏列表</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.name",
            "description": "<p>名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.url",
            "description": "<p>地址</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.linkUrl",
            "description": "<p>下载链接</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.version",
            "description": "<p>版本</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.size",
            "description": "<p>大小</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.downCount",
            "description": "<p>下载量</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.description",
            "description": "<p>简介</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.createDate",
            "description": "<p>创建时间</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.updateDate",
            "description": "<p>更新时间</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\":[\n             {\n                 \"id\": 1,\n                 \"name\": \"保卫萝卜\",\n                 \"url\": \"images/2016/6/1467167086912.jpg\",\n                 \"linkUrl\": \"发给你个\",\n                 \"version\": \"2.3.5.3\",\n                 \"size\": 45,\n                 \"downCount\": 0,\n                 \"description\": \"房管局和高科技，\",\n                 \"createDate\": 1467167089060,\n                 \"updateDate\": 1467167089060\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/reourceapi/controller/ResourceController.java",
    "groupTitle": "resource",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/resource/listGame"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/resource/listJz",
    "title": "1、剧照列表",
    "version": "0.0.1",
    "name": "resource_listJz",
    "group": "resource",
    "description": "<p>剧照列表</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.name",
            "description": "<p>名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.url",
            "description": "<p>图片路径</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\":[\n             {\n                 \"id\": 14,\n                 \"name\": \"器灵剧照\",\n                 \"url\": \"http://www.qq.com/images/2016/6/1466991484108.jpg\",\n                 \"status\": 0\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/reourceapi/controller/ResourceController.java",
    "groupTitle": "resource",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/resource/listJz"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/resource/listMusic",
    "title": "3、音乐列表",
    "version": "0.0.1",
    "name": "resource_listMusic",
    "group": "resource",
    "description": "<p>音乐列表</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.name",
            "description": "<p>名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.url",
            "description": "<p>地址</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.size",
            "description": "<p>歌曲数量</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list.musicList",
            "description": "<p>音乐</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list.musicList.id",
            "description": "<p>音乐id</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list.musicList.name",
            "description": "<p>音乐名称</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list.musicList.url",
            "description": "<p>音乐链接</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\" : [\n             {\n                 \"id\" : 1,\n                 \"name\" : 1,\n                 \"url\" : \"http://localhost:8080\",\n                 \"size\" : \"16\",\n                 \"musicList\" : [\n                     {\n                         \"id\" : \"1\",\n                         \"name\" : \"一次就好\",\n                         \"url\" : \"http;//localhost:8080\"\n                     }\n                 ]\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/reourceapi/controller/ResourceController.java",
    "groupTitle": "resource",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/resource/listMusic"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/attention",
    "title": "10、关注or取消关注",
    "version": "0.0.1",
    "name": "user_attention",
    "group": "user",
    "description": "<p>关注用户</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID                          （必传）</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "sourceId",
            "description": "<p>目标用户ID（主创用户ID）          （必传）</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "isCreator",
            "description": "<p>是否主创 0:是，1:否 默认为否</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<p>类型，1：关注 2：取消关注         （必传）</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/attention"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/attentionList",
    "title": "8、我的关注",
    "version": "0.0.1",
    "name": "user_attentionList",
    "group": "user",
    "description": "<p>我的关注</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>(必传)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.userId",
            "description": "<p>用户Id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.nickname",
            "description": "<p>用户昵称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.avater",
            "description": "<p>用户头像</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/attentionList"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/binding",
    "title": "20、第三方绑定",
    "version": "0.0.1",
    "name": "user_binding",
    "group": "user",
    "description": "<p>第三方绑定</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户id                (必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "weixin",
            "description": "<p>微信唯一标识           (如果想取消绑定就传空)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "weibo",
            "description": "<p>微博唯一标识           (如果想取消绑定就传空)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\": 0,\n     \"msg\": \"\",\n     \"data\": {}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/binding"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/collect",
    "title": "14、收藏or取消收藏",
    "version": "0.0.1",
    "name": "user_collect",
    "group": "user",
    "description": "<p>关注用户</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID                                            （必传）</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "sourceId",
            "description": "<p>收藏目标ID                                        （必传）</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<p>收藏目标类型：1=视频，2=小说，3=漫画，4=帖子         （必传）</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>类型，1：收藏 2：取消收藏                           （必传）</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/collect"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/collectList",
    "title": "13、我的收藏",
    "version": "0.0.1",
    "name": "user_collectList",
    "group": "user",
    "description": "<p>我的收藏</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>(必传)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>收藏目标ID</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.authorId",
            "description": "<p>作者ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.name",
            "description": "<p>名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.avater",
            "description": "<p>图片</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.description",
            "description": "<p>描述</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.playNum",
            "description": "<p>播放量</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.barrageNum",
            "description": "<p>弹幕量</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.updateTime",
            "description": "<p>更新时间</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/collectList"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/creatorDynamic",
    "title": "12、主创动态列表",
    "version": "0.0.1",
    "name": "user_creatorDynamic",
    "group": "user",
    "description": "<p>主创动态列表</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "creatorId",
            "description": "<p>主创用户id           (必传)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>主创动态ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.content",
            "description": "<p>内容</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.creatorId",
            "description": "<p>主创ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.name",
            "description": "<p>主创名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.avater",
            "description": "<p>主创头像</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"date\": \"2016-06-27\",\n                 \"dynamicList\": [\n                     {\n                         \"id\": 12,\n                         \"content\": \"正在发送弹幕\",\n                         \"creatorId\": 1,\n                         \"name\": \"罗大佑\",\n                         \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\"\n                     }\n                 ],\n                 \"date\": \"2016-06-28\",\n                 \"dynamicList\": [\n                     {\n                         \"id\": 13,\n                         \"content\": \"正在查看帖子\",\n                         \"creatorId\": 2,\n                         \"name\": \"李冰冰\",\n                         \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\"\n                     }\n                 ]\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/creatorDynamic"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/delAddress",
    "title": "7、删除地址",
    "version": "0.0.1",
    "name": "user_delAddress",
    "group": "user",
    "description": "<p>删除地址</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>(必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "id",
            "description": "<p>(必传)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/delAddress"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/deleteDynamic",
    "title": "19、主创删除动态",
    "version": "0.0.1",
    "name": "user_deleteDynamic",
    "group": "user",
    "description": "<p>主创删除动态</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "id",
            "description": "<p>主创id                   (必传)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/deleteDynamic"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/deleteImage",
    "title": "17、删除主创剧照，生活照",
    "version": "0.0.1",
    "name": "user_deleteImage",
    "group": "user",
    "description": "<p>删除主创剧照，生活照</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "id",
            "description": "<p>图片id                     (必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<p>图片类别 0:剧照 1:生活照    (必传)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/deleteImage"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/fans",
    "title": "9、我的粉丝",
    "version": "0.0.1",
    "name": "user_fans",
    "group": "user",
    "description": "<p>我的粉丝</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>(必传)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.userId",
            "description": "<p>用户Id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.nickname",
            "description": "<p>用户昵称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.avater",
            "description": "<p>用户头像</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.isAttention",
            "description": "<p>是否关注，0=已关注，1=未关注</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/fans"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/info",
    "title": "1、用户详情",
    "version": "0.0.1",
    "name": "user_info",
    "group": "user",
    "description": "<p>用户详情</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "sourceId",
            "description": "<p>目标用户id           (必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户id               (必传)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "userInfo",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userInfo.mobile",
            "description": "<p>手机</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userInfo.nickname",
            "description": "<p>昵称</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "userInfo.gender",
            "description": "<p>性别 （男:0 女:1）</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userInfo.avater",
            "description": "<p>头像</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "userInfo.level",
            "description": "<p>会员等级</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "userInfo.funs",
            "description": "<p>粉丝数</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "userInfo.focus",
            "description": "<p>关注数</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "userInfo.posts",
            "description": "<p>发帖数</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "userInfo.praises",
            "description": "<p>主创点赞数</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "userInfo.num",
            "description": "<p>收藏数</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "userInfo.coin",
            "description": "<p>馒头币</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "userInfo.integral",
            "description": "<p>积分</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "userInfo.isCreator",
            "description": "<p>会员类型 0:普通会员 1:主创</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "userInfo.id",
            "description": "<p>id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "userInfo.createTime",
            "description": "<p>注册时间</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "userInfo.isAttention",
            "description": "<p>是否关注 （0：已关注，1=未关注）</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\": 0,\n     \"msg\": \"\",\n     \"data\": {\n         \"userInfo\": {\n             \"mobile\": \"13872116519\",\n             \"nickname\": \"老大\",\n             \"gender\": 0,\n             \"avater\": \"\",\n             \"level\": 0,\n             \"funs\": 0,\n             \"focus\": 0,\n             \"posts\": 0,\n             \"praises\": 0,\n             \"num\": 20,\n             \"coin\": 0,\n             \"integral\": 0,\n             \"isCreator\": 0,\n             \"id\": 14,\n             \"createTime\": \"2016-06-20 03:45:25\"\n         }\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/info"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/infoPlus",
    "title": "11、主创用户详情",
    "version": "0.0.1",
    "name": "user_infoPlus",
    "group": "user",
    "description": "<p>主创用户详情</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "sourceId",
            "description": "<p>主创用户id           (必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户id               (必传)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "infoPlus",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "infoPlus.id",
            "description": "<p>主创ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "infoPlus.name",
            "description": "<p>主创名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "infoPlus.cover",
            "description": "<p>封面</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "infoPlus.avater",
            "description": "<p>头像</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "infoPlus.province",
            "description": "<p>所在省份</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "infoPlus.city",
            "description": "<p>所在城市</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "infoPlus.description",
            "description": "<p>简介</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "infoPlus.level",
            "description": "<p>等级</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "infoPlus.fans",
            "description": "<p>粉丝数</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "infoPlus.focus",
            "description": "<p>关注数</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "infoPlus.isAttention",
            "description": "<p>是否关注 （0：已关注，1=未关注）</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "infoPlus.stillList",
            "description": "<p>剧照列表</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "infoPlus.stillList.id",
            "description": "<p>剧照ID</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "infoPlus.stillList.url",
            "description": "<p>剧照路径</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "infoPlus.lifeList",
            "description": "<p>生活照列表</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "infoPlus.lifeList.id",
            "description": "<p>生活照ID</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "infoPlus.lifeList.url",
            "description": "<p>生活照路径</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "infoPlus.weibo",
            "description": "<p>微博</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "infoPlus.fanClub",
            "description": "<p>后援会</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\": 0,\n     \"msg\": \"\",\n     \"data\": {\n         \"infoPlus\": {\n             \"id\": 1,\n             \"name\": \"李冰冰\",\n             \"cover\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\",\n             \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\",\n             \"province\": \"河北省\",\n             \"city\": \"邯郸市\",\n             \"description\": \"巴拉巴拉\",\n             \"level\": 1,\n             \"fans\": 52,\n             \"focus\": 36,\n             \"isAttention\": 1,\n             \"stillList\": [\n                 {\n                     \"id\": 1,\n                     \"url\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\"\n                 }\n             ],\n             \"lifeList\": [\n                 {\n                     \"id\": 1,\n                     \"url\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\"\n                 }\n             ],\n             \"weibo\": \"http://www.weiBo.com\",\n             \"fanClub\": \"23828382,\"\n         }\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/infoPlus"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/insertAddress",
    "title": "6、添加/修改地址",
    "version": "0.0.1",
    "name": "user_insertAddress",
    "group": "user",
    "description": "<p>添加地址</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>(必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "id",
            "description": "<p>地址ID(编辑时必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "name",
            "description": "<p>收件人姓名</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "mobile",
            "description": "<p>收件人手机</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "address",
            "description": "<p>收件人地址</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "isDefault",
            "description": "<p>是否默认</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/insertAddress"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/insertDynamic",
    "title": "18、主创添加动态",
    "version": "0.0.1",
    "name": "user_insertDynamic",
    "group": "user",
    "description": "<p>主创添加动态</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "creatorId",
            "description": "<p>主创id                   (必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "time",
            "description": "<p>时间                     (必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>内容                     (必传)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/insertDynamic"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/integralList",
    "title": "21、用户经验值记录",
    "version": "0.0.1",
    "name": "user_integralList",
    "group": "user",
    "description": "<p>用户经验值记录</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户id                (必传)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\": 0,\n     \"msg\": \"\",\n     \"data\": {}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/integralList"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/listAddress",
    "title": "5、用户地址列表",
    "version": "0.0.1",
    "name": "user_listAddress",
    "group": "user",
    "description": "<p>用户地址列表</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>(必传)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.name",
            "description": "<p>收件人姓名</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.mobile",
            "description": "<p>收件人手机</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.address",
            "description": "<p>收件人地址</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.isDefault",
            "description": "<p>是否默认地址，0=否，1=是</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>地址ID</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\": {\n         \"list\": [\n             {\n                 \"name\": \"白小飞\",\n                 \"mobile\": \"15965887421\",\n                 \"address\": \"民族大道青年城\",\n                 \"isDefault\": 0,\n                 \"id\": 3\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/listAddress"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/modifyAvater",
    "title": "4、修改用户头像",
    "version": "0.0.1",
    "name": "user_modifyAvater",
    "group": "user",
    "description": "<p>修改用户头像</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户id(必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "Stream",
            "optional": false,
            "field": "file",
            "description": "<p>头像文件(必传)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/modifyAvater"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/modifyAvaterPlus",
    "title": "16、修改主创头像、剧照，生活照",
    "version": "0.0.1",
    "name": "user_modifyAvaterPlus",
    "group": "user",
    "description": "<p>修改用户头像</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "creatorId",
            "description": "<p>主创用户id             (必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "Stream",
            "optional": false,
            "field": "avater",
            "description": "<p>头像文件</p>"
          },
          {
            "group": "Parameter",
            "type": "Stream",
            "optional": false,
            "field": "stillList",
            "description": "<p>剧照（数组）</p>"
          },
          {
            "group": "Parameter",
            "type": "Stream",
            "optional": false,
            "field": "lifeList",
            "description": "<p>生活照（数组）</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/modifyAvaterPlus"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/modifyInfo",
    "title": "2、修改用户信息",
    "version": "0.0.1",
    "name": "user_modifyInfo",
    "group": "user",
    "description": "<p>修改用户信息</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>(必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "nickname",
            "description": "<p>昵称</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "gender",
            "description": "<p>性别，0=男，1=女</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/modifyInfo"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/modifyInfoPlus",
    "title": "15、修改主创用户信息",
    "version": "0.0.1",
    "name": "user_modifyInfoPlus",
    "group": "user",
    "description": "<p>修改主创用户信息</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "creatorId",
            "description": "<p>主创用户id           (必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "cityId",
            "description": "<p>城市id</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "description",
            "description": "<p>简介</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "weibo",
            "description": "<p>微博</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "experience",
            "description": "<p>后援会</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\": 0,\n     \"msg\": \"\",\n     \"data\": {}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/modifyInfoPlus"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/modifyPwd",
    "title": "3、修改/找回 密码",
    "version": "0.0.1",
    "name": "user_modifyPwd",
    "group": "user",
    "description": "<p>修改密码</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID (修改密码时必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "oldPwd",
            "description": "<p>原密码 (修改密码时必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "newPwd",
            "description": "<p>新密码 (必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "code",
            "description": "<p>验证码 (忘记密码时必传)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/modifyPwd"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/postListPlus",
    "title": "12、我回复的（赞过的）帖子列表",
    "version": "0.0.1",
    "name": "user_postListPlus",
    "group": "user",
    "description": "<p>我回复的（赞过的）帖子列表</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID                          (必传)</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<p>类型 1:回复过的 2:赞过的         (必传)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>帖子ID</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.type",
            "description": "<p>帖子类型  0:普通帖 1:直播帖 2:投票帖 3:用户帖</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.content",
            "description": "<p>帖子内容</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.createDate",
            "description": "<p>时间</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\":[\n             \"id\": 1,\n             \"type\": 2,\n             \"content\": 巴拉巴拉,\n             \"createDate\": 1466501562661\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/postapi/controller/PostController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/postListPlus"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/user/praise",
    "title": "22、点赞or取消点赞",
    "version": "0.0.1",
    "name": "user_praise",
    "group": "user",
    "description": "<p>点赞or取消点赞</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID                                            （必传）</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "sourceId",
            "description": "<p>点赞目标ID（帖子id）                               （必传）</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<p>点赞目标类型：0:普通帖 1:直播帖 2:投票帖 3:用户帖     （必传）</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>类型，1：点赞 2：取消点赞                           （必传）</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/userapi/controller/UseController.java",
    "groupTitle": "user",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/user/praise"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/welfare/exchange",
    "title": "2、兑换实物",
    "version": "0.0.1",
    "name": "welfare_exchange",
    "group": "welfare",
    "description": "<p>兑换实物</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID                    (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "welfareId",
            "description": "<p>福利ID                    (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "nickname",
            "description": "<p>联系人                    (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "mobile",
            "description": "<p>联系方式                  (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "address",
            "description": "<p>收货地址                  (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\": 0,\n     \"msg\": \"\",\n     \"data\": {}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/welfareapi/controller/WelfareApiController.java",
    "groupTitle": "welfare",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/welfare/exchange"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/welfare/exchangeList",
    "title": "3、兑换记录列表",
    "version": "0.0.1",
    "name": "welfare_exchangeList",
    "group": "welfare",
    "description": "<p>兑换记录列表</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID                    (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.nickname",
            "description": "<p>用户昵称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.mobile",
            "description": "<p>联系电话</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.giftName",
            "description": "<p>实物名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.exchangeCoin",
            "description": "<p>消耗馒头数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.receiverName",
            "description": "<p>收货人姓名</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.receiverMobile",
            "description": "<p>收货人电话</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.receiverAddress",
            "description": "<p>收货人地址</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.status",
            "description": "<p>状态 0:待邮寄 1:待签收 2:已签收</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.courierName",
            "description": "<p>快递公司</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.courierSn",
            "description": "<p>快递单号</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.createDate",
            "description": "<p>创建时间</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.updateDate",
            "description": "<p>修改时间</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"nickname\": \"洛天依\",\n                 \"mobile\": \"123456\",\n                 \"giftName\": \"东风股份和\",\n                 \"exchangeCoin\": 12,\n                 \"receiverName\": \"涂三胜\",\n                 \"receiverMobile\": \"15878554125\",\n                 \"receiverAddress\": \"湖北省武汉市南湖大道政院小区\",\n                 \"status\": 0,\n                 \"courierName\": \"\",\n                 \"courierSn\": \"\",\n                 \"id\": 1,\n                 \"createDate\": 1467291444585,\n                 \"updateDate\": \"\"\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/welfareapi/controller/WelfareApiController.java",
    "groupTitle": "welfare",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/welfare/exchangeList"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/welfare/exchangePlus",
    "title": "7、兑换福利（不包含实物）",
    "version": "0.0.1",
    "name": "welfare_exchangePlus",
    "group": "welfare",
    "description": "<p>兑换福利（不包含实物）</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID                    (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "welfareId",
            "description": "<p>福利ID                    (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\": 0,\n     \"msg\": \"\",\n     \"data\": {}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/welfareapi/controller/WelfareApiController.java",
    "groupTitle": "welfare",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/welfare/exchangePlus"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/welfare/lottery",
    "title": "5、抽奖",
    "version": "0.0.1",
    "name": "welfare_lottery",
    "group": "welfare",
    "description": "<p>抽奖后扣除馒头数</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID                            (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "status",
            "description": "<p>是否抽中，0=否，1=是，默认为0</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "lotteryId",
            "description": "<p>中奖id</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "coin",
            "description": "<p>剩余馒头数</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\": 0,\n     \"msg\": \"\",\n     \"data\": {\n         \"coin\": 100\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/welfareapi/controller/WelfareApiController.java",
    "groupTitle": "welfare",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/welfare/lottery"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/welfare/lotteryList",
    "title": "6、抽奖记录列表",
    "version": "0.0.1",
    "name": "welfare_lotteryList",
    "group": "welfare",
    "description": "<p>抽奖记录列表</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID                    (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.content",
            "description": "<p>详情</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.coin",
            "description": "<p>馒头变动数</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.createDate",
            "description": "<p>时间</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"id\": 1,\n                 \"content\": \"抽奖\",\n                 \"coin\": -10,\n                 \"createDate\": 1466502060745\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/welfareapi/controller/WelfareApiController.java",
    "groupTitle": "welfare",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/welfare/lotteryList"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/welfare/probabilityList",
    "title": "4、抽奖几率列表",
    "version": "0.0.1",
    "name": "welfare_probabilityList",
    "group": "welfare",
    "description": "<p>兑换记录列表</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.name",
            "description": "<p>名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.coin",
            "description": "<p>获得馒头数</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.pro",
            "description": "<p>几率</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"id\": 1,\n                 \"name\": \"加油\",\n                 \"coin\": 0,\n                 \"pro\": 20\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/welfareapi/controller/WelfareApiController.java",
    "groupTitle": "welfare",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/welfare/probabilityList"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/welfare/welfareList",
    "title": "1、福利列表",
    "version": "0.0.1",
    "name": "welfare_welfareList",
    "group": "welfare",
    "description": "<p>福利列表</p>",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>id</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.title",
            "description": "<p>标题</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.subTitle",
            "description": "<p>副标题</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.type",
            "description": "<p>类型 0:铃声 1:经验值 2:实物 3:表情包 4:商城购买 5:游戏兑换码</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.cover",
            "description": "<p>封面路径</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.coin",
            "description": "<p>消耗馒头数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.url",
            "description": "<p>链接地址</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.exper",
            "description": "<p>经验数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.description",
            "description": "<p>描述</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.num",
            "description": "<p>兑换次数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.createDate",
            "description": "<p>创建时间</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.updateDate",
            "description": "<p>修改时间</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"id\" : 1,\n                 \"title\" : \"小熊抱枕\",\n                 \"subTitle\" : \"抱枕\",\n                 \"type\" : 2,\n                 \"cover\" : \"http://4.16.3.22:8080/images/head.jpg\",\n                 \"coin\" : 299,\n                 \"url\" : \"http://4.16.3.22:8080/images/head.jpg\"\n                 \"exper\" : \"10\",\n                 \"description\" : \"抱枕\",\n                 \"num\" : 1,\n                 \"createDate\" : 1467187179076,\n                 \"updateDate\" : 1467187173567\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/welfareapi/controller/WelfareApiController.java",
    "groupTitle": "welfare",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/welfare/welfareList"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/works/barrageList",
    "title": "10、弹幕",
    "version": "0.0.1",
    "name": "works_barrageList",
    "group": "works",
    "description": "<p>弹幕(视频)</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<p>类别 0:视频 1:漫画        (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "workId",
            "description": "<p>作品ID                   (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list.praise",
            "description": "<p>点赞数</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list.content",
            "description": "<p>弹幕内容</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list.time",
            "description": "<p>弹幕所在时间</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list.id",
            "description": "<p>弹幕ID</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list.createTime",
            "description": "<p>弹幕发送内容</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\": 0,\n     \"msg\": \"\",\n     \"data\": {\n         \"list\": [\n             {\n                 \"praise\": 58,\n                 \"content\": \"呱唧呱唧\",\n                 \"time\": \"1分30秒\",\n                 \"id\": 1,\n                 \"createTime\": \"2016-06-20 03:44:12\"\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/worksapi/controller/WorksController.java",
    "groupTitle": "works",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/works/barrageList"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/works/comicDetail",
    "title": "6、作品详情(漫画)",
    "version": "0.0.1",
    "name": "works_comicDetail",
    "group": "works",
    "description": "<p>作品详情(漫画)</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "workId",
            "description": "<p>漫画ID</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "workComic",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "workComic.id",
            "description": "<p>漫画ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "workComic.name",
            "description": "<p>漫画名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "workComic.cover",
            "description": "<p>漫画封面</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "workComic.author",
            "description": "<p>漫画作者</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "workComic.series",
            "description": "<p>章数</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "workComic.playNum",
            "description": "<p>播放量</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "workComic.barrageNum",
            "description": "<p>弹幕数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "workComic.updateTime",
            "description": "<p>更新时间</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "workComic.isEnd",
            "description": "<p>是否完结 0:未完结 1:已完结</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "workComic.isCollect",
            "description": "<p>是否收藏 0:未收藏 1:已收藏</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"workComic\": {\n             \"id\" : 1,\n             \"name\" : \"器灵视频\",\n             \"cover\" : \"http://www.baiDu.com\",\n             \"author\" : \"张起灵\",\n             \"series\" : 34,\n             \"playNum\" : 5000,\n             \"barrageNum\" : 400,\n             \"updateTime\" : \"2016-06-22 16:17:12\",\n             \"isEnd\" : 0,\n             \"isCollect\" : 0\n         }\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/worksapi/controller/WorksController.java",
    "groupTitle": "works",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/works/comicDetail"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/works/comicList",
    "title": "5、作品列表(漫画)",
    "version": "0.0.1",
    "name": "works_comicList",
    "group": "works",
    "description": "<p>作品列表(漫画)</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "category",
            "description": "<p>漫画分类ID</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>漫画ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.name",
            "description": "<p>漫画名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.cover",
            "description": "<p>漫画封面</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.author",
            "description": "<p>漫画作者</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.series",
            "description": "<p>章数</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.playNum",
            "description": "<p>播放量</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.barrageNum",
            "description": "<p>弹幕数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.updateTime",
            "description": "<p>更新时间</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.isEnd",
            "description": "<p>是否完结 0:未完结 1:已完结</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"id\" : 1,\n                 \"name\" : \"器灵漫画\",\n                 \"cover\" : \"http://www.baiDu.com\",\n                 \"author\" : \"吴邪\",\n                 \"series\" : 34,\n                 \"playNum\" : 5000,\n                 \"barrageNum\" : 400,\n                 \"updateTime\" : \"2016-06-22 16:17:12\",\n                 \"isEnd\" : 0\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/worksapi/controller/WorksController.java",
    "groupTitle": "works",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/works/comicList"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/works/commentList",
    "title": "7、评论列表",
    "version": "0.0.1",
    "name": "works_commentList",
    "group": "works",
    "description": "<p>评论列表</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Byte",
            "optional": false,
            "field": "type",
            "description": "<p>类别 4:视频 5:小说 6:漫画 (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "workId",
            "description": "<p>作品ID                   (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>评论ID</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.userId",
            "description": "<p>评论人ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.nickname",
            "description": "<p>评论人昵称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.avater",
            "description": "<p>评论人头像</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.content",
            "description": "<p>评论内容</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.praise",
            "description": "<p>点赞数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.createDate",
            "description": "<p>评论时间</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list.replyList",
            "description": "<p>评论回复列表</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.replyList.id",
            "description": "<p>评论回复ID</p>"
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.replyList.userId",
            "description": "<p>回复人ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.replyList.nickname",
            "description": "<p>回复人昵称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.replyList.avater",
            "description": "<p>回复人头像</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.replyList.content",
            "description": "<p>回复内容</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.replyList.praise",
            "description": "<p>点赞数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.replyList.createDate",
            "description": "<p>回复时间</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"id\": 1,\n                 \"userId\": 1,\n                 \"nickname\": \"洛天依\",\n                 \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\",\n                 \"content\": \"不错不错\",\n                 \"praise\": 0,\n                 \"createDate\": \"2016-06-23 02:21:38\",\n                 \"replyList\": [\n                     {\n                         \"id\": 1,\n                         \"userId\": 1,\n                         \"nickname\": \"洛天依\",\n                         \"avater\": \"http://7xsyp2.com2.z0.glb.qiniucdn.com/FpBaMotUC1r5Eaptl1q_QVjHz22q\",\n                         \"content\": \"不错不错\",\n                         \"praise\": 0,\n                         \"createDate\": \"2016-06-23 02:21:38\"\n                     }\n                 ]\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/worksapi/controller/WorksController.java",
    "groupTitle": "works",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/works/commentList"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/works/insertBarrage",
    "title": "11、发送弹幕",
    "version": "0.0.1",
    "name": "works_insertBarrage",
    "group": "works",
    "description": "<p>发送弹幕</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<p>类别 0:视频 1:漫画        (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "workId",
            "description": "<p>作品ID                   (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID                   (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "time",
            "description": "<p>弹幕时间                  (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>弹幕内容                  (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/worksapi/controller/WorksController.java",
    "groupTitle": "works",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/works/insertBarrage"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/works/insertComment",
    "title": "8、发表评论",
    "version": "0.0.1",
    "name": "works_insertComment",
    "group": "works",
    "description": "<p>发表评论</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<p>类别 4:视频 5:小说 6:漫画               (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "workId",
            "description": "<p>作品id                                 (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>评论人id                               (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>评论内容                               (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/worksapi/controller/WorksController.java",
    "groupTitle": "works",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/works/insertComment"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/works/insertReply",
    "title": "9、回复评论",
    "version": "0.0.1",
    "name": "works_insertReply",
    "group": "works",
    "description": "<p>回复评论</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "workCommentId",
            "description": "<p>评论id                                 (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>评论人id                               (必填)</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "content",
            "description": "<p>评论内容                               (必填)</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{}\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/worksapi/controller/WorksController.java",
    "groupTitle": "works",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/works/insertReply"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/works/novelDetail",
    "title": "4、作品详情(小说)",
    "version": "0.0.1",
    "name": "works_novelDetail",
    "group": "works",
    "description": "<p>作品详情(小说)</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "workId",
            "description": "<p>小说ID</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "workNovel",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "workNovel.id",
            "description": "<p>小说ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "workNovel.name",
            "description": "<p>小说名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "workNovel.cover",
            "description": "<p>小说封面</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "workNovel.author",
            "description": "<p>小说作者</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "workNovel.series",
            "description": "<p>章数</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "workNovel.playNum",
            "description": "<p>播放量</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "workNovel.description",
            "description": "<p>简介</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "workNovel.updateTime",
            "description": "<p>更新时间</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "workNovel.isEnd",
            "description": "<p>是否完结 0:未完结 1:已完结</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "workNovel.isCollect",
            "description": "<p>是否收藏 0:未收藏 1:已收藏</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"workNovel\": {\n             \"id\" : 1,\n             \"name\" : \"器灵小说\",\n             \"cover\" : \"http://www.baiDu.com\",\n             \"author\" : \"天蚕土豆\",\n             \"series\" : 340,\n             \"playNum\" : 5000,\n             \"description\" : \"器灵小说\",\n             \"updateTime\" : \"2016-06-22 16:17:12\",\n             \"isEnd\" : 0,\n             \"isCollect\" : 0\n         }\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/worksapi/controller/WorksController.java",
    "groupTitle": "works",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/works/novelDetail"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/works/novelList",
    "title": "3、作品列表(小说)",
    "version": "0.0.1",
    "name": "works_novelList",
    "group": "works",
    "description": "<p>作品列表(小说)</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "category",
            "description": "<p>小说分类ID</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>小说ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.name",
            "description": "<p>小说名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.cover",
            "description": "<p>小说封面</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.author",
            "description": "<p>小说作者</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.series",
            "description": "<p>章数</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.playNum",
            "description": "<p>播放量</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.updateTime",
            "description": "<p>更新时间</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.isEnd",
            "description": "<p>是否完结 0:未完结 1:已完结</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"id\" : 1,\n                 \"name\" : \"器灵小说\",\n                 \"cover\" : \"http://www.baiDu.com\",\n                 \"author\" : \"天蚕土豆\",\n                 \"series\" : 340,\n                 \"playNum\" : 5000,\n                 \"updateTime\" : \"2016-06-22 16:17:12\",\n                 \"isEnd\" : 0\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/worksapi/controller/WorksController.java",
    "groupTitle": "works",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/works/novelList"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/works/videoDetail",
    "title": "2、作品详情(视频)",
    "version": "0.0.1",
    "name": "works_videoDetail",
    "group": "works",
    "description": "<p>作品详情(视频)</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "workId",
            "description": "<p>视频ID</p>"
          },
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "userId",
            "description": "<p>用户ID</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "workNovel",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "workNovel.id",
            "description": "<p>视频ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "workNovel.name",
            "description": "<p>视频名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "workNovel.cover",
            "description": "<p>视频封面</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "workNovel.series",
            "description": "<p>集数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "workNovel.linkUrl",
            "description": "<p>源地址</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "workNovel.playNum",
            "description": "<p>播放量</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "workNovel.barrageNum",
            "description": "<p>弹幕数</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "workNovel.isEnd",
            "description": "<p>是否完结 0:未完结 1:已完结</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "workNovel.isCollect",
            "description": "<p>是否收藏 0:未收藏 1:已收藏</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"workNovel\": {\n             \"id\" : 1,\n             \"name\" : \"器灵视频\",\n             \"cover\" : \"http://www.baiDu.com\",\n             \"series\" : 34,\n             \"linkUrl\" : \"http://www.baiDu.com\",\n             \"playNum\" : 5000,\n             \"barrageNum\" : 400,\n             \"isEnd\" : 0,\n             \"isCollect\" : 0\n         }\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/worksapi/controller/WorksController.java",
    "groupTitle": "works",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/works/videoDetail"
      }
    ]
  },
  {
    "type": "post",
    "url": "/app/works/videoList",
    "title": "1、作品列表(视频)",
    "version": "0.0.1",
    "name": "works_videoList",
    "group": "works",
    "description": "<p>作品列表(视频)</p>",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "Long",
            "optional": false,
            "field": "category",
            "description": "<p>视频分类ID</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": false,
            "field": "type",
            "description": "<p>类别  0：最新（默认） 1：最热</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "list",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Long",
            "optional": false,
            "field": "list.id",
            "description": "<p>视频ID</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.name",
            "description": "<p>视频名称</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.cover",
            "description": "<p>视频封面</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.series",
            "description": "<p>集数</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "list.linkUrl",
            "description": "<p>源地址</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.playNum",
            "description": "<p>播放量</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.barrageNum",
            "description": "<p>弹幕数</p>"
          },
          {
            "group": "Success 200",
            "type": "Integer",
            "optional": false,
            "field": "list.isEnd",
            "description": "<p>是否完结 0:未完结 1:已完结</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n     \"status\":0,\n     \"msg\":\"\",\n     \"data\":{\n         \"list\": [\n             {\n                 \"id\" : 1,\n                 \"name\" : \"器灵视频\",\n                 \"cover\" : \"http://www.baiDu.com\",\n                 \"series\" : 34,\n                 \"linkUrl\" : \"http://www.baiDu.com\",\n                 \"playNum\" : 5000,\n                 \"barrageNum\" : 400,\n                 \"isEnd\" : 0\n             }\n         ]\n     }\n}",
          "type": "json"
        }
      ]
    },
    "filename": "src/main/java/com/leoman/worksapi/controller/WorksController.java",
    "groupTitle": "works",
    "sampleRequest": [
      {
        "url": "http://4.16.3.22:8888/yqyl_server/app/works/videoList"
      }
    ]
  }
] });
