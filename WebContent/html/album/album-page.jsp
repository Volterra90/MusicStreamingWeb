<%@page import="com.musicstreaming.streaming.model.*, java.util.*"%>
<%@include file="/html/common/header.jsp"%>
			
			<% 
			List<Album> albums = (List<Album>) request.getAttribute(AttributeNames.ALBUMS);
			Artista artista = (Artista) request.getAttribute(AttributeNames.ARTISTA);%>
			
			<div>
			<h3><%=artista.getNomeArtista()%></h3>
			</div>
				
			<%for (Album a: albums){ %>
			<div>
				<h3><%=a.getNome()%></h3>
				<ul>
				<%for (Cancion c: a.getCancions()){ %>
					<li><%=c.getNome() %></li>
					<%}} %>
				</ul>
				
			</div>
			
			<div>
			<h3></h3>
			</div>
			
			<div>
				
				<ul>
					<li></li>
				</ul>
			</div>
			
			<div>
			<h3></h3>
			</div>
			
			<div>
				
				<ul>
					<li></li>
				</ul>
			</div>
			
            </section>
        </div>
    </body>
</html>