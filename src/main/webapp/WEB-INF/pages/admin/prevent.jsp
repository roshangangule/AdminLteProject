<script type="text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null};

</script> 

<%

response.setHeader("Cache-Control","no-cache,must-revalidate,no-store");
	if(session.getAttribute("id")==null)
	response.sendRedirect("loginpage");
%>