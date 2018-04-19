<%@page import="org.apache.commons.lang3.builder.ToStringBuilder"%>
<%@page import="com.musicstreaming.streaming.web.controller.AttributeNames, java.util.*"%>
<%@include file="/html/common/header.jsp"%>
		<% List<Playlist> playlists = (List<Playlist>) request.getAttribute(AttributeNames.PLAYLISTS); %>
		<div>
			<h3><fmt:message key="As_minhas_playlists" bundle="${messages}" /></h1>
       	</div>
       	<div>
       	<%for (Playlist p: playlists){ %>
       		<p><%=p.getNome()%></p>
    	<%} %>	
       	</div>
       	<div>
       		<h3><fmt:message key="Create_playlist" bundle="${messages}" /></h3>
       		<form method="POST" action="/MusicStreamingWeb/PlaylistServlet?action=<%=ParameterNames.CREATE_PLAYLIST%>&idUsuario=<%=usuario.getIdUsuario()%>">
       		<label><fmt:message key="Intr_nome_playlist" bundle="${messages}" />:</label>
       		<input type="text" name="<%=ParameterNames.NOME_PLAYLIST%>"/>
       		<input type="submit" value="<fmt:message key="Entrar" bundle="${messages}" />"/>
       		</form>
       	</div>
    </body>
</html>