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

import com.musicstreaming.streaming.model.Contido;
import com.musicstreaming.streaming.model.TipoContido;
import com.musicstreaming.streaming.service.ContidoService;
import com.musicstreaming.streaming.service.impl.ContidoServiceImpl;

@WebServlet("/IndexServlet")

public class IndexServlet extends HttpServlet {
	
	private static Logger logger = LogManager.getLogger(IndexServlet.class.getName());
	private ContidoService contidoService = null;
       
    public IndexServlet() {
        super();
        contidoService = new ContidoServiceImpl();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int n = 5;
		try{
		List<Contido> topCancions=contidoService.findTopN(n,TipoContido.CANCION);
		List<Contido> topAlbums=contidoService.findTopN(n,TipoContido.ALBUM);
		List<Contido> topPlaylists=contidoService.findTopN(n,TipoContido.PLAYLIST);
		request.setAttribute(AttributeNames.TOP_N_CANCIONS, topCancions);
		request.setAttribute(AttributeNames.TOP_N_ALBUMS, topAlbums);
		request.setAttribute(AttributeNames.TOP_N_PLAYLISTS, topPlaylists);
			
		request.getRequestDispatcher(ViewsPaths.INDEX_JSP).forward(request, response);
		}
		
		catch (Exception e){
			logger.error(e.getMessage(),e);
			request.setAttribute(AttributeNames.ERROR, e.getMessage());
			request.getRequestDispatcher(ViewsPaths.INDEX_JSP).forward(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
