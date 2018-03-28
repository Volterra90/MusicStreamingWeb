<%@page
	import="com.musicstreaming.streaming.web.controller.ParameterNames"%>
<form action="/MusicStreamingWeb/ContentSearchServlet" method="POST">
	<h2>Búsqueda</h2>
	<input type="text" name="<%=ParameterNames.NOMECONTIDO%>"/>
	<div>
		<input type="checkbox" name="<%=ParameterNames.CANCION%>"/>Cancións 
		<input type="checkbox" name="<%=ParameterNames.ALBUM%>"/>Álbums
		<input type="checkbox" name="<%=ParameterNames.PLAYLIST%>"/>Playlists
	</div>
	<div>
		<h3>Artista</h3>
	</div>
	<input type="text" name="<%=ParameterNames.ARTISTA%>"/>
	<input type="submit" value="Buscar"/>
</form>