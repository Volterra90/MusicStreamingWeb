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
import com.musicstreaming.streaming.service.ContidoCriteria;
import com.musicstreaming.streaming.service.ContidoService;
import com.musicstreaming.streaming.service.impl.ContidoServiceImpl;


@WebServlet("/ContentSearchServlet")
public class ContentSearchServlet extends HttpServlet {
      
	
	private static Logger logger = LogManager.getLogger(ContentSearchServlet.class.getName());
	private ContidoService contidoService = null;
    public ContentSearchServlet() {
        super();
        contidoService = new ContidoServiceImpl();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ContidoCriteria cc = new ContidoCriteria();
		
		try{
		Character [] tipos = new Character [3];
		if (request.getParameter(ParameterNames.CANCION)!=null){
			tipos [0] = 'C';
		}
		else{
			tipos[0] = 'D';
		}
		if (request.getParameter(ParameterNames.ALBUM)!=null){
			tipos [1] = 'A';
		}
		else{
			tipos[1] = 'D';
		}
		if (request.getParameter(ParameterNames.PLAYLIST)!=null){
			tipos [2] = 'P';
		}
		else{
			tipos[2] = 'D';
		}
		String artista = request.getParameter(ParameterNames.ARTISTA);
		String nomeContido = request.getParameter(ParameterNames.NOMECONTIDO);
		
	    
	    	cc.setTipos(tipos);
			cc.setNomeArtista(artista);
			cc.setNome(nomeContido);
			List<Contido> contidos= contidoService.findByCriteria(cc,1,10);
			request.setAttribute(AttributeNames.CONTIDOS, contidos);
		    request.getRequestDispatcher(ViewsPaths.CONTENTRESULTS).forward(request, response);
	    }
	    catch (Exception e){
	    	logger.error(e.getMessage(), e);
	    	request.setAttribute(AttributeNames.ERROR, e.getMessage());
			request.getRequestDispatcher(ViewsPaths.INDEX).forward(request, response);
	    }
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
