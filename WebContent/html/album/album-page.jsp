<%@page import="com.musicstreaming.streaming.model.*, java.util.*"%>
<%@include file="/html/common/header.jsp"%>

<c:set var="albums" value="${requestScope.albums}" scope="page" />
<c:set var="artista" value="${requestScope.artista}" scope="page" />
<c:set var="duracions" value="${requestScope.duracions}" scope="page" />		
			<div class="nomeArtista">
				<h3><c:out value="${artista.nomeArtista}"/></h3>
				<img src="/MusicStreamingWeb/html/cms/artistas/<c:out value='${artista.codArtista}'/>.jpg" class="img-artista"/>
			</div>
				
			<c:forEach items="${albums}" var="album">
			<div id="${album.codContido}">
				<h3><c:out value="${album.nome}"/> (<c:out value="${album.fechaPublicacion}"/>)</h3>	
			</div>
			<div class="div-album-page">
				<img src="/MusicStreamingWeb/html/cms/albums/<c:out value="${album.codContido}"/>.jpg" class="img-album-page">
			</div>
			<table class="tabla_cancions">
		<tr>
			<td></td>
			<td><fmt:message key="Nome_cancion" bundle="${messages}" /></td>
			<td><fmt:message key="Media" bundle="${messages}" /></td>
			<td><fmt:message key="Artista" bundle="${messages}" /></td>
			<td><fmt:message key="Duracion" bundle="${messages}" /></td>
			<td><fmt:message key="Vota" bundle="${messages}" /></td>
		</tr>
		<c:forEach items="${album.cancions}" var="cancion" varStatus="status">
			<tr>
					<td onclick="updateSrc(this)" id="play<c:out value='${cancion.codContido}'/>"><i class="fa fa-play"></i></td>
					<td><c:out value="${cancion.nome}" /></td>
					<td id="media<c:out value='${cancion.codContido}'/>"><c:out value='${cancion.media}'/></td>
					<td><c:out value="${artista.nomeArtista}" /></td>
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
			</c:forEach>			
            </section>
   <script src="/MusicStreamingWeb/html/js/jquery.barrating.js"></script>
<%@include file="/html/common/footer.jsp"%>
