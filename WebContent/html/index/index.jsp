<%@page import="org.apache.commons.lang3.builder.ToStringBuilder"%>
<%@page import="com.musicstreaming.streaming.web.controller.AttributeNames, java.util.*"%>
<%@include file="/html/common/header.jsp"%>
<c:set var="cancions" value="${requestScope.topCancions}" scope="page" />
<c:set var="albums" value="${requestScope.topAlbums}" scope="page" />
<c:set var="playlists" value="${requestScope.topPlaylists}" scope="page" />
<c:set var="artistasCancion" value="${requestScope.artistasCancion}" scope="page" />
<c:set var="artistasAlbum" value="${requestScope.artistasAlbum}" scope="page" />
<c:set var="duracions" value="${requestScope.duracions}" scope="page" />

<div>
	<h3>
		<fmt:message key="Top_cancions" bundle="${messages}" />
	</h3>
</div>
<c:if test='${not empty cancions}'>
	<table class="tabla_cancions">
	<tr>
		<td></td>
		<td><fmt:message key="Nome_cancion" bundle="${messages}" /></td>
		<td><fmt:message key="Media" bundle="${messages}" /></td>
		<td><fmt:message key="Artista" bundle="${messages}" /></td>
		<td><fmt:message key="Duracion" bundle="${messages}" /></td>
		<td><fmt:message key="Vota" bundle="${messages}" /></td>
	</tr>
		<c:forEach items="${cancions}" var="cancion" varStatus="status">
			<tr>
				<td onclick="updateSrc(this)"
					id="play<c:out value='${cancion.codContido}'/>"><i
					class="fa fa-play"></i></td>
				<td><c:out value="${cancion.nome}" /></td>
				<td><c:out value="${cancion.media}" /></td>
				<td><c:out value="${artistasCancion[status.index].nomeArtista}" /></td>
				<td><c:out value="${duracions[status.index]}" /></td>
				<td><select id="<c:out value='${cancion.codContido}'/>"
					class="votacion" name="rating" autocomplete="off">
						<option value="2">2</option>
						<option value="4">4</option>
						<option value="6">6</option>
						<option value="8">8</option>
						<option value="10">10</option>
				</select> <script type="text/javascript">
					$(function() {
						$('#<c:out value='${cancion.codContido}'/>').barrating(
								{
									theme : 'fontawesome-stars'
								});
					});
				</script></td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
	<div>
	<h3>
		<fmt:message key="Top_albums" bundle="${messages}" />
	</h3>
	</div>
	<div class="contenedor_albumes">
	<c:if test='${not empty albums}'>
		<c:forEach items="${albums}" var="album" varStatus="status">
		<div class="div_album">
			<img src="/MusicStreamingWeb/html/img/<c:out value="${album.codContido}"/>.jpg" class="img-album">
			<p><c:out value='${album.nome}'/></p>
			<p><c:out value="${artistasAlbum[status.index].nomeArtista}" /></p>
				<select id="<c:out value='${album.codContido}'/>"
					class="votacion" name="rating" autocomplete="off">
						<option value="2">2</option>
						<option value="4">4</option>
						<option value="6">6</option>
						<option value="8">8</option>
						<option value="10">10</option>
				</select> <script type="text/javascript">
					$(function() {
						$('#<c:out value='${album.codContido}'/>').barrating(
								{
									theme : 'fontawesome-stars'
								});
					});
				</script>
			</div>
		</c:forEach>
	</c:if>
	</div>
	<div class="header-playlist">
	<h3>
		<fmt:message key="Top_playlists" bundle="${messages}" />
	</h3>
	</div>
			</a>
			<ul>
				<%
			List<Contido> topPlaylists = (List<Contido>) request.getAttribute(AttributeNames.TOP_N_PLAYLISTS);
				Playlist playlist = null;
				for (Contido c: topPlaylists){
					playlist = (Playlist) c;
			%><li><%=c.getNome()%></li>
				<%} %>
			
		</div>
		</section>
		<script src="/MusicStreamingWeb/html/js/jquery.barrating.js"></script>
		<%@include file="/html/common/footer.jsp"%>