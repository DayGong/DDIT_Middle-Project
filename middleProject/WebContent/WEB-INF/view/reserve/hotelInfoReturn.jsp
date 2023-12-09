<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.vo.CompanyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	System.out.print("여기있어요00");

	// 서블릿에서 저장한 데이터 꺼내기
	CompanyVO companyVo = (CompanyVO)request.getAttribute("companyVo");

	Gson gson = new GsonBuilder().setPrettyPrinting().create();
	
	String companyJson = gson.toJson(companyVo);
	
	out.print(companyJson);
	out.flush();
%>