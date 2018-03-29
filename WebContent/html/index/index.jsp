<%@page import="com.musicstreaming.streaming.web.controller.AttributeNames, java.util.*"%>
<%@include file="/html/common/header.jsp"%>
			<div onload="/IndexServlet">
				<h1>Top 5 Cancións</h1></a>
				<ul>
			<%if ((request.getAttribute(AttributeNames.BOOLEAN))=="c"){ 
			List<Contido> topCancions = (List<Contido>) request.getAttribute(AttributeNames.TOP_N_CANCIONS);
				Cancion cancion = null;
				for (Contido c: topCancions){
					cancion = (Cancion) c;
			%><li><%=c.getNome()%></li>
			<%}} %>
			</div>
			
			<div>
				
			</div>
            </section>
        </div>
    </body>
</html>