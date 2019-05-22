<%-- 
    Document   : customers
    Created on : Feb 19, 2019, 10:14:59 AM
    Author     : Parth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customers</title>
    </head>
    <body>
        <h1>Found customers...</h1>
        
        <sql:setDataSource var="datasource" driver="org.apache.derby.jdbc.ClientDriver" 
                           url="jdbc:derby://localhost:1527/sample" user="app" password="app" />
        <sql:query var="customers" dataSource="${datasource}">
            
            SELECT * FROM APP.CUSTOMER WHERE NAME LIKE '%${param.cust_name}%'
        </sql:query>
         <c:forEach var="c" items="${customers.rows}"> 
             <b><c:out value="${c.NAME}" /></b><br/>
            <c:out value="${c.ADDRESSLINE1}" /><br/>
            <c:out value="${c.ADDRESSLINE2}" /><br/>
            <i><c:out value="${c.CITY}" /></i><br/>
            <hr/>
         </c:forEach>
    </body>
</html>
