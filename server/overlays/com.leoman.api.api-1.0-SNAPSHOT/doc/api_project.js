define({
  "name": "亿奇娱乐接口文档",
  "version": "0.0.1",
  "description": "",
  "title": "亿奇娱乐接口文档",
  "url": "http://4.16.3.22:8888/yqyl_server",
  "sampleUrl": "http://4.16.3.22:8888/yqyl_server",
  "header": {
    "title": "start",
    "content": "<h3>接口返回格式</h3>\n<h2>单条数据:</h2>\n<blockquote>\n<p>异常:</p>\n</blockquote>\n<pre><code class=\"language-javascript\">{ \n    &quot;status&quot;:1000,\n    &quot;data&quot;:{},\n    &quot;msg&quot;:&quot;错误消息&quot;\n}\n</code></pre>\n<blockquote>\n<p>正常:</p>\n</blockquote>\n<pre><code class=\"language-javascript\">{\n    &quot;status&quot;:0,\n    &quot;data&quot;:{&quot;id&quot;:&quot;1&quot;,&quot;name&quot;:&quot;wb&quot;},\n    &quot;msg&quot;:&quot;&quot;\n}\n</code></pre>\n<h2>多条数据:</h2>\n<blockquote>\n<p>异常:</p>\n</blockquote>\n<pre><code class=\"language-javascript\">{\n    &quot;status&quot;:1000,\n    &quot;data&quot;:{},\n    &quot;msg&quot;:&quot;错误消息&quot;\n}\n</code></pre>\n<blockquote>\n<p>正常:</p>\n</blockquote>\n<pre><code class=\"language-javascript\">{\n    &quot;status&quot;:0,\n    &quot;data&quot;:{\n        &quot;list&quot;:[\n            {\n                &quot;id&quot;:267,\n                &quot;city&quot;:&quot;Wuhan&quot;\n            },\n            {\n                &quot;id&quot;:266,\n                &quot;city&quot;:&quot;Nanjin&quot;\n            }\n        ],\n        &quot;page&quot;:{\n            &quot;totalNum&quot;:4,\n            &quot;totalPage&quot;:2,\n            &quot;currentPage&quot;:1\n        }\n    }\n}\n</code></pre>\n<h3>错误码</h3>\n<table>\n<thead>\n<tr>\n<th>解释</th>\n<th>错误码</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>参数不正确</td>\n<td>1</td>\n</tr>\n<tr>\n<td>服务器异常</td>\n<td>2</td>\n</tr>\n<tr>\n<td>找不到用户</td>\n<td>3</td>\n</tr>\n<tr>\n<td>验证码错误</td>\n<td>4</td>\n</tr>\n<tr>\n<td>旧密码错误</td>\n<td>5</td>\n</tr>\n<tr>\n<td>旧密码和新密码不能一样</td>\n<td>6</td>\n</tr>\n<tr>\n<td>地址不存在</td>\n<td>7</td>\n</tr>\n<tr>\n<td>用户与地址不匹配</td>\n<td>8</td>\n</tr>\n<tr>\n<td>用户已存在</td>\n<td>9</td>\n</tr>\n<tr>\n<td>用户名或密码错误</td>\n<td>10</td>\n</tr>\n<tr>\n<td>帖子不存在</td>\n<td>11</td>\n</tr>\n<tr>\n<td>作品不存在</td>\n<td>12</td>\n</tr>\n<tr>\n<td>评论不存在</td>\n<td>13</td>\n</tr>\n<tr>\n<td>用户已签到</td>\n<td>14</td>\n</tr>\n<tr>\n<td>主创不存在</td>\n<td>15</td>\n</tr>\n<tr>\n<td>用户馒头数不足</td>\n<td>16</td>\n</tr>\n<tr>\n<td>已经关注过</td>\n<td>17</td>\n</tr>\n<tr>\n<td>暂未关注</td>\n<td>18</td>\n</tr>\n<tr>\n<td>已经收藏过</td>\n<td>19</td>\n</tr>\n<tr>\n<td>暂未收藏</td>\n<td>20</td>\n</tr>\n<tr>\n<td>福利不存在</td>\n<td>21</td>\n</tr>\n<tr>\n<td>没有互相关注，消息发送失败</td>\n<td>22</td>\n</tr>\n<tr>\n<td>已经投票过</td>\n<td>23</td>\n</tr>\n<tr>\n<td>中奖项不存在</td>\n<td>24</td>\n</tr>\n<tr>\n<td>已经点赞过</td>\n<td>25</td>\n</tr>\n<tr>\n<td>暂未点赞</td>\n<td>26</td>\n</tr>\n</tbody>\n</table>\n"
  },
  "template": {
    "forceLanguage": "zh",
    "withCompare": true,
    "withGenerator": true
  },
  "apidoc": "0.2.0",
  "generator": {
    "name": "apidoc",
    "time": "2016-07-08T07:51:36.537Z",
    "url": "http://apidocjs.com",
    "version": "0.15.1"
  }
});
