<%@page import="com.musicstreaming.streaming.model.*, java.util.*"%>
<%@include file="/html/common/header.jsp"%>
			
			<% 
			Contido album = (Contido) request.getAttribute(AttributeNames.ALBUMS);
			Artista artista = (Artista) request.getAttribute(AttributeNames.ARTISTA);%>
			
			<div>
			<h3><%=artista.getNomeArtista()%></h3>
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