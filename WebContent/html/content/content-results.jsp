<%@page import="com.musicstreaming.streaming.model.*, java.util.*"%>
<%@include file="/html/common/header.jsp"%>
			
			<% List<Cancion> cancions = (List<Cancion>)request.getAttribute(AttributeNames.CANCIONS);
			List <Album> albums = (List<Album>)request.getAttribute(AttributeNames.ALBUMS);
			List <Playlist> playlists = (List<Playlist>)request.getAttribute(AttributeNames.PLAYLISTS);%>
			<%if (cancions!=null&&!cancions.isEmpty() ){ %>
			<div>
			<h3>Cancións</h3>
			</div>
			<%  
			for (Cancion c: cancions){
			%>
			<div>
				
				<ul>
					<li><%=c.getNome()%></li>
					<li><%=c.getMedia()%></li>
					<li>
					<form action="/MusicStreamingWeb/VoteSongServlet?idContido=<%=c.getCodContido()%>" method="POST">
					<input type="hidden" name=<%=ParameterNames.VOTE_JSP %> value="<%=ViewsPaths.CONTENTRESULTS%>">
						<select name="<%=ParameterNames.NOTA%>">
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
						<input type="submit" value="Votar"/>	
					</form>
					</li>
				</ul>
			</div>
			<%
			}}
			%>
			<%if (albums!=null&&!albums.isEmpty()){ %>
			<div>
			<h3>Albums</h3>
			</div>
			<%  
			for (Album a: albums){
			%>
			<div>
				
				<ul>
					<li><a href="/MusicStreamingWeb/ContentSearchServlet?idAlbum=<%=a.getCodContido()%>&idArtista=<%=a.getCodArtista()%>
					&action=<%=ParameterNames.BUSQUEDAALBUM%>"><%=a.getNome()%></a></li>
				</ul>
			</div>
			<%
			}}
			%>
			<%if (playlists!=null&&!playlists.isEmpty()){ %>
			<div>
			<h3>Playlists</h3>
			</div>
			<%  
			for (Playlist p: playlists){
			%>
			<div>
				
				<ul>
					<li><%=p.getNome()%></li>
				</ul>
			</div>
			<%
			}}
			%>
            </section>
        </div>
    </body>
</html>