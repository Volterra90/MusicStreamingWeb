package com.musicstreaming.streaming.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.musicstreaming.streaming.model.Contido;
import com.musicstreaming.streaming.model.Usuario;
import com.musicstreaming.streaming.service.ContidoService;
import com.musicstreaming.streaming.service.impl.ContidoServiceImpl;
import com.musicstreaming.streaming.web.util.SessionManager;

/**
 * Servlet implementation class VoteSongServlet
 */
@WebServlet("/VoteSongServlet")
public class VoteSongServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(VoteSongServlet.class.getName());
	private ContidoService contidoService = null;
	
    public VoteSongServlet() {
        super();
        contidoService = new ContidoServiceImpl();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nota = Integer.valueOf(request.getParameter(ParameterNames.NOTA));
		Long idContido = Long.valueOf(request.getParameter(ParameterNames.IDCONTIDO));
		Usuario usuario = (Usuario) SessionManager.get(request, SessionAttributeNames.USER);
		try {
			contidoService.vota(usuario.getIdUsuario(), idContido, nota);
			Contido c = contidoService.findById(idContido);
			response.setContentType("text/plain");
			String media = c.getMedia().toString();
		    response.getWriter().write(media);       
		}
		
		catch (Exception e){
			logger.error(e.getMessage(),e);
			request.setAttribute(AttributeNames.ERROR, e.getMessage());
			request.getRequestDispatcher(request.getParameter(ParameterNames.VOTE_JSP)).forward(request, response);
		}				
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
