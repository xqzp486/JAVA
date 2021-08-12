<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>员工的修改页面</h1>

<%
    pageContext.setAttribute("ctp",request.getContextPath());
%>

<form:form action="${ctp}/emp/${employee.id}" modelAttribute="employee" method="post">
    <input type="hidden" name="_method" value="put"/>
    <input type="hidden" name="id" value="${employee.id}">
    <!--modelAttribute=""
        以前我们表单标签会从请求域中获取一个command对象， 把这个对象中的每一个属性对应的值显示出来
        可以告诉SpringMVC不要去去command的值，我放了一个modelAttribute指定的值，取对象用的key就用我modelAttribute指定的值
    -->
    <!--path就是原来html-input标签的name项，需要写
        （1）path可以当作原生的name项
        （2）自动回显隐含模型中某个对象对应的这个属性的值
    -->
    lastName:<form:input path="lastName"/><br/>
    email:<form:input path="email"/><br/>
    gender:<br/>
        男：<form:radiobutton path="gender" value="1"/><br/>
        女：<form:radiobutton path="gender" value="0"/><br/>
    dept:
        <!--items=""指定要遍历的集合;自动遍历;遍历出的每一个元素是一个department对象
            itemLabel="属性名"，指定遍历出的这个对象的哪个属性是作为option标签体的值
            itemValue="属性名"，指定遍历出的这个对象的哪个属性是作为要提交的value值

        -->
        <form:select path="department.id"
                     items="${depts}"
                     itemLabel="departmentName"
                     itemValue="id">
        </form:select><br/>
    <input type="submit" value="修改">
</form:form>
</body>
</html>
