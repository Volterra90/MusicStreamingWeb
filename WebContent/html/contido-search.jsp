<%@page import="com.musicstreaming.streaming.model.*, java.util.*"%>
<h3>B�squeda de contido</h3>
<!-- Formulario de b�squeda -->
<form action="/MusicStreamingWeb/ContidoSearchServlet" method="POST">
	<input type="text" name="cancion" placeholder="Nome canci�n" /> <br>
	<input type="submit" value="Submit">
</form>
<!-- Busca y muestra los resultados -->
<%	
		List<Contido> contidos = (List<Contido>) request.getAttribute("contidos");
		
		if (contidos!=null) {
			%><h3>Resultados de b�squeda:</h3><% 
			for (Contido c: contidos){
			
				%>

<p><%=c.getNome()%></p>
<p><%=c.getCodContido()%></p>
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