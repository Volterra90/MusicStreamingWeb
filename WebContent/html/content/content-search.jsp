<%@include file="/html/common/header.jsp"%>

<%@page import="com.musicstreaming.streaming.model.*, java.util.*"%>
<h3>B�squeda de pedido por Pa�s</h3>
<!-- Formulario de b�squeda -->
<form action="/SacraWeb/OrderSearchServlet" method="POST">
	<input type="text" name="contido" placeholder="t�tulo" /> <br>
	<input type="submit" value="Submit">
</form>
<!-- Busca y muestra los resultados -->
<%	
		List<Contido> contidos = (List<Contido>) request.getAttribute("pedidos");
		
		if (contidos!=null) {
			%><h3>Resultados de b�squeda:</h3><% 
			for (Contido c: contidos){
			
				%> 

<p><%=c.getNome()%></p>
<p><%=c.getDuracion()%></p>
<%
			}
		}
			else {
				if (request.getAttribute("error")!=null){
				%>
<p><%=request.getAttribute("error")%></p>
<%
				}
			}
			%>
<%@include file="/html/common/footer.jsp"%>