# spring-cloud-examples

# 参考：
1. 慕课网 Spring Cloud 廖师兄
2. http://www.ityouknow.com/,  https://github.com/ityouknow/spring-cloud-examples
3. 《史上最简单的Spring Cloud教程源码》 https://github.com/yafey/SpringCloudLearning



# 常见 Q&A

1. Spring Cloud 与 Spring Boot 的版本对应关系？

  - 2.1.x 之后 没有了 Release Train 的对应关系。

2. spring-boot-starter-parent version >= 2.1.5.RELEASE , Eclipse（STS）pom.xml 报错。
	- 解决方案来自： https://www.gravatar.com/avatar/f2d86fa6a8fe8ec67ef80170f1b35505?s=32&d=identicon&r=PG)user2125853
	```
	Description Resource    Path                    Location   Type
	Unknown     pom.xml     /TestSessionAttribute   line 1     Maven Configuration Problem
	```
	解决方案：`<properties>` 中添加下面的属性。
	```
	<maven-jar-plugin.version>3.1.1</maven-jar-plugin.version>
	```
