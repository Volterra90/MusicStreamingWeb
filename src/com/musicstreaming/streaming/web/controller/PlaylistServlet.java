package com.musicstreaming.streaming.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.musicstreaming.streaming.model.Playlist;
import com.musicstreaming.streaming.service.ContidoService;
import com.musicstreaming.streaming.service.PlaylistService;
import com.musicstreaming.streaming.service.impl.ContidoServiceImpl;
import com.musicstreaming.streaming.service.impl.PlaylistServiceImpl;

/**
 * Servlet implementation class PlaylistServlet
 */
@WebServlet("/PlaylistServlet")
public class PlaylistServlet extends HttpServlet {
	
	private static Logger logger = LogManager.getLogger(PlaylistServlet.class.getName());
	private ContidoService contidoService = null;
	private PlaylistService playlistService = null;
       
  
    public PlaylistServlet() {
        super();
        contidoService = new ContidoServiceImpl();
        playlistService = new PlaylistServiceImpl();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter(ParameterNames.ACTION);	
		String target = null;
		boolean redirect = false;
			if (ParameterNames.PRELOAD_PLAYLISTS_USER.equalsIgnoreCase(action)) {
				try {
				List<Playlist> playlists = playlistService.findByUsuario(Long.valueOf(request.getParameter(ParameterNames.IDUSUARIO)));
				request.setAttribute(AttributeNames.PLAYLISTS, playlists);
				request.getRequestDispatcher(ViewsPaths.PLAYLIST).forward(request, response);
				}
				catch (Exception e) {
					logger.error(e.getMessage(),e);
					request.setAttribute(AttributeNames.ERROR, e.getMessage());
					request.getRequestDispatcher(request.getHeader("referer")).forward(request, response);
				}
			
			}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
