<%@page import="com.musicstreaming.streaming.model.*, java.util.*"%>
<%@include file="/html/common/header.jsp"%>
<c:set var="cancions" value="${requestScope.cancions}" scope="page" />
<c:set var="albums" value="${requestScope.albums}" scope="page" />
<c:set var="playlists" value="${requestScope.playlists}" scope="page" />
<c:if test='${not empty cancions}'>
	<div>
		<h3><fmt:message key="Cancions" bundle="${messages}"/></h3>
	</div>
	<c:forEach items="${cancions}" var="cancion">
		<div>
			<ul>
				<li><c:out value="${cancion.nome}" /></li>
				<li><c:out value="${cancion.media}" /></li>
			</ul>
		</div>
	</c:forEach>
</c:if>
<c:if test='${not empty albums}'>
			<div>
			<h3>Albums</h3>
			</div>
			<c:forEach items="${albums}" var="album">
			<div>
				<ul>
				<c:url var="urldetalle" value="/ContentSearchServlet">
					<c:param name="idAlbum"...>
					<li><a href="/MusicStreamingWeb/ContentSearchServlet?idAlbum=<%=a.getCodContido()%>&idArtista=<%=a.getCodArtista()%>
					&action=<%=ParameterNames.BUSQUEDAALBUM%>"><%=a.getNome()%></a></li>
				</ul>
			</div>
			</c:forEach>
</c:if>