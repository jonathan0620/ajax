<%@page import="bean.CompanyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <jsp:useBean id = "bag" class="bean.CompanyDTO"></jsp:useBean>
    <jsp:setProperty property="*" name="bag"/>

    <%
   	CompanyDAO dao = new CompanyDAO();
    int result = dao.insert(bag);
    %><%= result%>