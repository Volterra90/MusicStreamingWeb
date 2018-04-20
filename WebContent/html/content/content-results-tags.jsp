<%@page import="com.musicstreaming.streaming.model.*, java.util.*"%>
<%@include file="/html/common/header.jsp"%>
<c:set var="cancions" value="${requestScope.cancions}" scope="page" />
<c:set var="albums" value="${requestScope.albums}" scope="page" />
<c:set var="playlists" value="${requestScope.playlists}" scope="page" />
<c:set var="artistasCancion" value="${requestScope.artistasCancion}" scope="page" />
<c:set var="artistasAlbum" value="${requestScope.artistasAlbum}" scope="page" />
<c:set var="duracions" value="${requestScope.duracions}" scope="page" />

	<div>
		<h3>
			<fmt:message key="Cancions" bundle="${messages}" /> (${fn:length(cancions)} <fmt:message key="resultados" bundle="${messages}" />)
		</h3>
	</div>
	<c:if test='${not empty cancions}'>
	<table class="tabla_cancions">
		<c:forEach items="${cancions}" var="cancion" varStatus="status">
			<tr>
					<td onclick="updateSrc(this)" id="play<c:out value='${cancion.codContido}'/>"><i class="fa fa-play"></i></td>
					<td><c:out value="${cancion.nome}" /></td>
					<td><c:out value="${cancion.media}" /></td>
					<td><c:out value="${artistasCancion[status.index].nomeArtista}" /></td>
					<td><c:out value="${duracions[status.index]}" /></td>
					<td>
							<select id="<c:out value='${cancion.codContido}'/>" class="votacion" name="rating" autocomplete="off">
								<option value="2">2</option>
								<option value="4">4</option>
								<option value="6">6</option>
								<option value="8">8</option>
								<option value="10">10</option>
							</select> 
							<script type="text/javascript">
								$(function() {
									$('#<c:out value='${cancion.codContido}'/>').barrating({
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
		<fmt:message key="Albums" bundle="${messages}" /> (${fn:length(albums)} <fmt:message key="resultados" bundle="${messages}" />)
	</h3>
</div>
<div class="contenedor-albumes">
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
</section>
<script src="/MusicStreamingWeb/html/js/jquery.barrating.js"></script>
<%@include file="/html/common/footer.jsp"%>
