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
					<li><%=a.getNome()%></li>
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