# seckill

# 高并发商品秒杀系统

## 项目简介：

商品秒杀系统面向所有的购物者，旨在为购物者提供一个高并发的商品秒杀抢购的平台。为了减少对数据库的直接访问，通过 Redis 实现了缓存优化；并通过 RabbitMQ 消息中间件来接收大量的并发请求，实现异步和削峰；还实现抢购接口的限流，然后再慢慢地更新数据库。最后通过 JMeter 压测工具，可以很好地对比优化前后的QPS。


## 采用技术：
- 前端：HTML + CSS + JavaScript + Bootstrap + Jquery + Ajax
- 后端：Spring Boot + Mybatis + Redis + RabbitMQ + Thymeleaf + Guava + + Druid + MD5

## 开发环境：
- 工具：IDEA、Navicat、Git
- 环境：JDK 1.8、Tomcat 7.0、Mysql 8.0
- 项目管理：Maven
- 代码托管平台：GitHub

## 开发流程：  
1、数据库设计  
2、Model：模型定义，与数据库相匹配  
3、Dao层：数据操作  
4、Service:服务包装  
5、Controller：业务入口，数据交互   
6、Util：工具类封装   
7、Config：配置类封装    
8、单元测试


## 设计思路：
1. 首先判断秒杀商品的库存，如果小于等于0，则直接返回秒杀失败
2. 判断是否已经秒杀到了商品，即从数据库中查看该用户是否已经存在对应商品的订单，如果有则视为重复秒杀
3. 减库存（通过 Redis 预减库存）
4. 生成订单(order_info + miaosha_order)


## 设计亮点： 
1. 通过Redis缓存来减少对DB的访问
2. 明文密码两次 MD5 加密
3. 分布式 Session，每次登录都会生成一个 token 并把它加入到 Cookie 中，在跳转不同页面时，会把 token 对应的 user 从 Redis 中取出
4. 页面级高并发秒杀优化提高性能，即利用缓存最大程度地减少对用户数据库的直接访问，并解决超卖现象
5. 通过 RabbitMQ 将用户请求入队缓冲，实现异步下单，增强用户体验
6. 通过内存标记减少对 Redis 的访问
7. 通过 Redis 预减库存进一步减少对数据库的访问


## 功能模块：  

> 用户管理

- 用户登录✔
- 用户注册✔

> 商品管理

- 查询商品列表✔
- 查询商品详情✔

> 秒杀管理

- 秒杀抢购商品✔


## 项目截图： 

1. 用户登录  
![](https://img-blog.csdnimg.cn/20210318020845714.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzU0ODMxMA==,size_16,color_FFFFFF,t_70)
2. 用户注册  
![](https://img-blog.csdnimg.cn/20210318020845838.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzU0ODMxMA==,size_16,color_FFFFFF,t_70)
3. 商品列表 
![](https://img-blog.csdnimg.cn/20210318020847344.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzU0ODMxMA==,size_16,color_FFFFFF,t_70)
4. 商品详情  
![](https://img-blog.csdnimg.cn/20210318020846115.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzU0ODMxMA==,size_16,color_FFFFFF,t_70)
5. 秒杀商品  
![](https://img-blog.csdnimg.cn/20210318020846306.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzU0ODMxMA==,size_16,color_FFFFFF,t_70)


## 项目访问：  
浏览器访问路径：http://localhost:8080/login/toLogin
