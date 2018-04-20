<%@page
	import="com.musicstreaming.streaming.web.controller.ParameterNames"%>
<c:set var="nome_contido" value="${requestScope.nomeContido}" scope="page" />
<c:set var="artista" value="${requestScope.artista}" scope="page" />
<form action="/MusicStreamingWeb/ContentSearchServlet" method="POST" class="form-busqueda">
	<input type="hidden" name="<%=ParameterNames.ACTION%>" value="<%=ParameterNames.BUSQUEDACONTIDO%>"/>
	<h2><fmt:message key="Busqueda" bundle="${messages}"/></h2>
	<input type="text" name="<%=ParameterNames.NOMECONTIDO%>" value="<c:out value="${nome_contido}"/>"/>
	<div>
		<input type="checkbox" name="<%=ParameterNames.CANCION%>"/><fmt:message key="Cancions" bundle="${messages}"/> 
		<input type="checkbox" name="<%=ParameterNames.ALBUM%>"/><fmt:message key="Albums" bundle="${messages}"/>
		<input type="checkbox" name="<%=ParameterNames.PLAYLIST%>"/><fmt:message key="Playlists" bundle="${messages}"/>
	</div>
	<div>
		<h3><fmt:message key="Artista" bundle="${messages}"/></h3>
	</div>
	<input type="text" name="<%=ParameterNames.ARTISTA%>" value="<c:out value="${artista}"/>"/>
	<input type="submit" value="<fmt:message key="Buscar" bundle="${messages}"/>"/>
</form>