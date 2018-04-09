<%@page import="com.musicstreaming.streaming.model.*, com.musicstreaming.streaming.web.util.*, com.musicstreaming.streaming.web.controller.*" %>

<%

	Usuario usuario = (Usuario) SessionManager.get(request, SessionAttributeNames.USER);
		%>
		<% if (usuario!=null){ %>
		<p>Benvido <%=usuario.getNick()%></p>
		<%}else{%>
			<p>Identifícate</p>
		<%}
%>

