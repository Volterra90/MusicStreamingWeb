<%@page import="com.musicstreaming.streaming.model.*, java.util.*"%>
<%@include file="/html/common/header.jsp"%>
<c:set var="cancions" value="${requestScope.cancions}" scope="page" />
<c:set var="albums" value="${requestScope.albums}" scope="page" />
<c:set var="playlists" value="${requestScope.playlists}" scope="page" />
<c:set var="artistas" value="${requestScope.artistas}" scope="page" />
<c:set var="duracions" value="${requestScope.duracions}" scope="page" />

<c:if test='${not empty cancions}'>
	<div>
		<h3>
			<fmt:message key="Cancions" bundle="${messages}" />
		</h3>
	</div>
	<table class="tabla_cancions">
		<c:forEach items="${cancions}" var="cancion" varStatus="status">
			<tr>
					<td><i class="fa fa-play" onclick="updateSrc()" id="<c:out value='${cancion.codContido}'/>"></i></td>
					<td><c:out value="${cancion.nome}" /></td>
					<td><c:out value="${cancion.media}" /></td>
					<td><c:out value="${artistas[status.index].nomeArtista}" /></td>
					<td><c:out value="${duracions[status.index]}" /></td>
					<td><c:url var="servletVotacion" value="/VoteSongServlet">
							<c:param name="idContido" value="${cancion.codContido}" />
							<c:param name="action" value="busquedaalbum" />
						</c:url>
							<select id="<c:out value='${cancion.codContido}'/>" class="votacion">
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select>
						</td>
				</tr>
		</c:forEach>
	</table>
	<script>
		
	</script>
</c:if>
<c:if test='${not empty albums}'>
	<div>
		<h3>
			<fmt:message key="Albums" bundle="${messages}" />
		</h3>
	</div>
	<c:forEach items="${albums}" var="album" varStatus="status">
		<div>
			<ul>
				<c:url var="urldetalle" value="/ContentSearchServlet">
					<c:param name="idAlbum" value="${album.codContido}" />
					<c:param name="idArtista" value="${album.codArtista}" />
					<c:param name="action" value="busquedaalbum" />
				</c:url>
				<li><a href="<c:out value='${urldetalle}'/>"><c:out
							value="${album.nome}" /></a></li>
				<li><c:out value="${artistas[status.index].nomeArtista}" /></li>
				<li><select class="votacion">
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
				</select></li>
			</ul>
		</div>
	</c:forEach>
</c:if>
<c:if test='${not empty playlists}'>
	<div>
		<h3>
			<fmt:message key="Playlists" bundle="${messages}" />
		</h3>
	</div>
	<c:forEach items="${playlists}" var="playlist">
		<div>
			<ul>
				<li><c:out value="${playlist.nome}" /></li>
			</ul>
		</div>
	</c:forEach>
</c:if>
<%@include file="/html/common/footer.jsp"%>
