# spring-cloud-examples

# 参考：
1. 慕课网 Spring Cloud 廖师兄
2. http://www.ityouknow.com/,  https://github.com/ityouknow/spring-cloud-examples
3. 《史上最简单的Spring Cloud教程源码》 https://github.com/yafey/SpringCloudLearning
	- https://blog.csdn.net/forezp/article/details/81040925

# 说明
Spring Boot版本2.1.6.RELEASE,Spring Cloud版本为Greenwich.SR1。
这个pom文件作为父pom文件，起到依赖版本控制的作用，其他module工程继承该pom。这一系列文章全部采用这种模式，其他文章的pom跟这个pom一样。再次说明一下，以后不再重复引入。



# Eureka 模块说明
> 精简自 ： [史上最简单的 SpringCloud 教程 | 第一篇： 服务的注册与发现Eureka(Finchley版本)](https://blog.csdn.net/forezp/article/details/81040925)


## 创建 eureka-server 步骤

1. Spring Initializer -> Cloud Discovery -> eureka server.
2. 修改 parent 继承自 `sc-1-eureka` ， 并引入 `spring-cloud-starter-netflix-eureka-server` 的依赖。
3. 启动一个 服务注册中心 ： **启动类上添加 `@EnableEurekaServer` 注解**。
4. eureka是一个高可用的组件，它没有后端缓存，每一个实例注册之后需要向注册中心发送心跳（因此可以在内存中完成），在默认情况下erureka server也是一个eureka client ,必须要指定一个 server。修改/创建 eureka server的配置文件appication.yml 
   - 启动报错： 添加 `eureka.client.serviceUrl.defaultZone` 属性 (serviceUrl 是个Map), 默认的 defaultZone 为`DEFAULT_URL  = "http://localhost:8761/eureka/"` 。 详见 ： EurekaClientConfigBean.java
     - 修改端口为 8761.
   - `UNKNOWN` --> 添加 `spring.application.name`
   - 不把自己当做 eureka-client 端， 添加 `eureka.client.registerWithEureka=false` ， `eureka.client.fetchRegistry=false`
   - client 不停重启 会出现红色警告。（心跳机制，一段时间内，client 如果不在线的次数达到某个比例，会警告，但是假装他还在线。）
     - (Optional) **开发环境 可以 设置**   `eureka.server.enable-self-preservation=false` , 生产环境不要这么做。 （会换成另一个警告，表示自我保护机制被关掉了，告诉不要这么做。）
5. eureka server 是有界面的，启动工程,打开浏览器访问：http://127.0.0.1:8761/ 。
6. mac 下 后台运行 ： `nohup java -jar target/eureka-server-xxx.jar >/dev/null 2>&1 &`
   - 结束进程 `kill -9 <pid>`



## 创建 Eureka Client 步骤

1. 创建过程同 server 类似，也可以创建成 Maven Moudle ， pom 文件与 server 类似，不同的是 dependency 从 `spring-cloud-starter-netflix-eureka-server` 改成了 `spring-cloud-starter-netflix-eureka-client` (即 从 server 改成了 client)。
2. 配置 注册中心地址： `eureka.client.serviceUrl.defaultZone=http://127.0.0.1:8761/eureka/`
3. 添加一个 client ： **启动类上添加 `@EnableDiscoveryClient` 注解**。(注意与 server 端的区别)
4. client 的配置：
   - `UNKNOWN` --> 添加 `spring.application.name`
   - (Optional) client 的 status 处自定义链接：配置 `eureka.instance.hostname` 。
   - client 不停重启 , eureka 会出现红色警告，见 server 端的配置 （关掉自我保护）。

