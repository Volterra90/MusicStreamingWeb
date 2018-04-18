<%@page import="org.apache.commons.lang3.builder.ToStringBuilder"%>
<%@page import="com.musicstreaming.streaming.web.controller.AttributeNames, java.util.*"%>
<%@include file="/html/common/header.jsp"%>
		<% List<Playlist> playlists = (List<Playlist>) request.getAttribute(AttributeNames.PLAYLISTS); %>
		<div>
			<h3><fmt:message key="As_minhas_playlists" bundle="${messages}" /></h1>
       	</div>
       	<div>
       	<%for (Playlist p: playlists){ %>
       		<p><%=p.getNome()%></p>
    	<%} %>	
       	</div>
    </body>
</html>