index.jsp<%@ page language="java" contentType="text/html;  charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%><!DOCTYPE html><html><head><meta charset="ISO-8859-1"><title>Insert title here</title></head><body>     <a href="hello">hello</a></body></html>


success.jsp

<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <h1>成功！</h1>
</body>
</html>



//Controller控制器

package FirstController;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class controller {


    @RequestMapping("/hello")
    public String firstcontroller() {
        System.out.println("正在调用页面");
        return "success";
    }
}





springmvc.xml

<?xml version="1.0" encoding="UTF-8"?>
<beans  xmlns="http://www.springframework.org/schema/beans"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xmlns:context="http://www.springframework.org/schema/context"
     xsi:schemaLocation="http://www.springframework.org/schema/beans  http://www.springframework.org/schema/beans/spring-beans.xsd
          http://www.springframework.org/schema/context  http://www.springframework.org/schema/context/spring-context-4.3.xsd">
     <context:component-scan  base-package="FirstController"></context:component-scan>
     
     <!-- 这是视图解析器，来进行拼接 -->
     <bean  class="org.springframework.web.servlet.view.InternalResourceViewResolver">
          <property name="prefix"  value="/WEB-INF/pages/"></property>
          <property name="suffix" value=".jsp"></property>
     </bean>
</beans>



web.xml中的部分内容，主要就是就搞两部分，一个是url-pattern，改成/，另外一个就是param-value，这里修改成springmvc.xml的地址  

<!-- The front controller of this Spring Web  application, responsible for handling all application  requests -->
     <servlet>
          <servlet-name>springDispatcherServlet</servlet-name>
          <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
          <init-param>
              <param-name>contextConfigLocation</param-name>
              <param-value>classpath:springmvc.xml</param-value>
          </init-param>
          <load-on-startup>1</load-on-startup>
     </servlet>
     <!-- Map all requests to the DispatcherServlet for  handling -->
     <servlet-mapping>
          <servlet-name>springDispatcherServlet</servlet-name>
          <url-pattern>/</url-pattern>
     </servlet-mapping>



步骤：1.点击index.jsp的超链接，就会发送出"hello"请求
          2.这个请求就会到tomcat服务器
          3.之前配置的Dispatcherservlet 前端控制器来获取请求
          4.获取请求之后就会到Controller中查看哪个RequestMapping是“hello”
          5.然后执行这个方法。return的返回值被认为是一个页面，为了简化书写，一般会把前缀和后缀进行配置。
            在springmvc.xml中配置视图解析器，把前缀和后缀进行配置。然后再执行的时候就会自动进行拼接。
          6.返回的页面就会显示出来
