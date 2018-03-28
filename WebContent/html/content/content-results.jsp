<%@page import="com.musicstreaming.streaming.model.*, java.util.*"%>
<%@include file="/html/common/header.jsp"%>
			<% List<Contido> contidos = (List<Contido>)request.getAttribute(AttributeNames.CONTIDOS); 
			for (Contido c: contidos){
			%>
			<div>
				<ul>
					<li><%=c.getNome()%></li>
				</ul>
			</div>
			<%
			}
			%>
			<div>
				
			</div>
			<div>
				
			</div>
            </section>
        </div>
    </body>
</html>