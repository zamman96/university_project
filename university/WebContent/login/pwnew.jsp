<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


//꺼내기 
  int  res = (Integer)request.getAttribute("result");
  String  temp = (String)request.getAttribute("tempPassword");
  
  
  if(res > 0) {
	
%>	  
	  
	 {
	    "flag" : "ok",
	    "temp" : "<%=  temp %>"
	 }  
	  
 <%  }else {  %>
	  

    {
        "flag" : "no"
    }

<% 
  }
 
%>