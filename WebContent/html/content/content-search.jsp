<%@page
	import="com.musicstreaming.streaming.web.controller.ParameterNames"%>
<form action="/MusicStreamingWeb/ContentSearchServlet" method="POST">
	<input type="hidden" name="<%=ParameterNames.ACTION%>" value="<%=ParameterNames.BUSQUEDACONTIDO%>"/>
	<h2>B�squeda</h2>
	<input type="text" name="<%=ParameterNames.NOMECONTIDO%>"/>
	<div>
		<input type="checkbox" name="<%=ParameterNames.CANCION%>"/>Canci�ns 
		<input type="checkbox" name="<%=ParameterNames.ALBUM%>"/>�lbums
		<input type="checkbox" name="<%=ParameterNames.PLAYLIST%>"/>Playlists
	</div>
	<div>
		<h3>Artista</h3>
	</div>
	<input type="text" name="<%=ParameterNames.ARTISTA%>"/>
	<input type="submit" value="Buscar"/>
</form>