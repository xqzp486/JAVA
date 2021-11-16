<%--
  Created by IntelliJ IDEA.
  User: 33125
  Date: 2021/4/11
  Time: 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme()
            +"://"
            +request.getServerName()
            +":"
            +request.getServerPort()
            +request.getContextPath()
            +"/";
%>
<!--写base标签，永远固定相对路径跳转的结果-->
<base href="<%=basePath%>">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<script src="static/script/jquery-1.7.2.js" type="text/javascript"></script>