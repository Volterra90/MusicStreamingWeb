<%@page import="org.apache.commons.lang3.builder.ToStringBuilder"%>
<%@page import="com.musicstreaming.streaming.web.controller.AttributeNames, java.util.*"%>
<%@include file="/html/common/header.jsp"%>
			<div>
				<h1>Top 5 Cancións</h1></a>
				<ul>
			<%
			List<Contido> topCancions = (List<Contido>) request.getAttribute(AttributeNames.TOP_N_CANCIONS);
				Cancion cancion = null;
				for (Contido c: topCancions){
					cancion = (Cancion) c;
			%><li><%=c.getNome()%></li>
			<%}%>
			</div>
			<div>
				<h1>Top 5 Albums</h1></a>
				<ul>
			<%
			List<Contido> topAlbums = (List<Contido>) request.getAttribute(AttributeNames.TOP_N_ALBUMS);
				Album album = null;
				for (Contido c: topAlbums){
					album = (Album) c;
			%><li><%=c.getNome()%></li>
			<%} %>
			</div>
			<div>
				<h1>Top 5 Playlists</h1></a>
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
        </div>
    </body>
</html>