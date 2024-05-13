<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.or.ddit.vo.CultureVO"%>
<%@ page import="com.google.gson.JsonElement"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="com.google.gson.GsonBuilder"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="java.util.List"%>

<%
	//서블릿에서 저장한 데이터 꺼내오기
	List<CultureVO> list = (List<CultureVO>) request.getAttribute("list");
	int sp = (int) request.getAttribute("startpage");
	int ep = (int) request.getAttribute("endpage");
	int tp = (int) request.getAttribute("totalpage");

	JsonObject obj = new JsonObject();
	obj.addProperty("sp", sp);
	obj.addProperty("ep", ep);
	obj.addProperty("tp", tp);

	Gson gson = new Gson();
	JsonElement result = gson.toJsonTree(list);

	obj.add("datas", result);

	out.print(obj);
	out.flush();
%>