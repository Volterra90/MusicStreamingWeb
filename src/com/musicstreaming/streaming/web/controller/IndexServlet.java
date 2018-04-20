package com.musicstreaming.streaming.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.musicstreaming.streaming.exceptions.DataException;
import com.musicstreaming.streaming.model.Album;
import com.musicstreaming.streaming.model.Artista;
import com.musicstreaming.streaming.model.Cancion;
import com.musicstreaming.streaming.model.Playlist;
import com.musicstreaming.streaming.model.TipoContido;
import com.musicstreaming.streaming.service.ArtistaService;
import com.musicstreaming.streaming.service.ContidoService;
import com.musicstreaming.streaming.service.impl.ArtistaServiceImpl;
import com.musicstreaming.streaming.service.impl.ContidoServiceImpl;
import com.musicstreaming.streaming.web.util.ContentUtils;

@WebServlet("/IndexServlet")

public class IndexServlet extends HttpServlet {
	
	private static Logger logger = LogManager.getLogger(IndexServlet.class.getName());
	private ContidoService contidoService = null;
	private ArtistaService artistaService = null;
       
    public IndexServlet() {
        super();
        contidoService = new ContidoServiceImpl();
        artistaService = new ArtistaServiceImpl();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int n = 5;
		try{
		List<Cancion> topCancions= (List<Cancion>)contidoService.findTopN(n,TipoContido.CANCION);
		List<Album> topAlbums= (List<Album>)contidoService.findTopN(n,TipoContido.ALBUM);
		List<Playlist> topPlaylists=(List<Playlist>)contidoService.findTopN(n,TipoContido.PLAYLIST);
		List<Artista> artistasCancion = new ArrayList<>();
		List<Artista> artistasAlbum = new ArrayList<>();
		List<String> duracions = new ArrayList<>();
		
		for (Cancion c: topCancions) {
			artistasCancion.add(artistaService.findById(c.getCodArtista()));
			duracions.add(ContentUtils.getPrettyDuracion(((Cancion) c).getDuracion()));
		}
		
		for (Album a: topAlbums) {
			artistasAlbum.add(artistaService.findById(a.getCodArtista()));
		}
		
		request.setAttribute(AttributeNames.TOP_N_CANCIONS, topCancions);
		request.setAttribute(AttributeNames.TOP_N_ALBUMS, topAlbums);
		request.setAttribute(AttributeNames.TOP_N_PLAYLISTS, topPlaylists);
		request.setAttribute(AttributeNames.ARTISTAS_CANCION, artistasCancion);
		request.setAttribute(AttributeNames.ARTISTAS_ALBUM, artistasAlbum);
		request.setAttribute(AttributeNames.DURACIONS, duracions);	
		
		
		request.getRequestDispatcher(ViewsPaths.INDEX_JSP).forward(request, response);
		}
		
		catch (DataException e) {
			logger.error(e.getMessage(),e);
			request.setAttribute(AttributeNames.ERROR, Errors.TOP_CONTIDOS);
			request.getRequestDispatcher(ViewsPaths.INDEX_JSP).forward(request, response);
		}
		
		catch (Exception e){
			logger.error(e.getMessage(),e);
			request.setAttribute(AttributeNames.ERROR, Errors.GENERIC_ERROR);
			request.getRequestDispatcher(ViewsPaths.INDEX_JSP).forward(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
