package com.musicstreaming.streaming.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.musicstreaming.streaming.model.Album;
import com.musicstreaming.streaming.model.Artista;
import com.musicstreaming.streaming.model.Cancion;
import com.musicstreaming.streaming.model.Contido;
import com.musicstreaming.streaming.model.Playlist;
import com.musicstreaming.streaming.service.ArtistaService;
import com.musicstreaming.streaming.service.CancionService;
import com.musicstreaming.streaming.service.ContidoCriteria;
import com.musicstreaming.streaming.service.ContidoService;
import com.musicstreaming.streaming.service.impl.ArtistaServiceImpl;
import com.musicstreaming.streaming.service.impl.CancionServiceImpl;
import com.musicstreaming.streaming.service.impl.ContidoServiceImpl;
import com.musicstreaming.streaming.web.util.ContentUtils;


@WebServlet("/ContentSearchServlet")
public class ContentSearchServlet extends HttpServlet {


	private static Logger logger = LogManager.getLogger(ContentSearchServlet.class.getName());
	private ContidoService contidoService = null;
	private CancionService cancionService = null;
	private ArtistaService artistaService = null;
	
	public ContentSearchServlet() {
		super();
		contidoService = new ContidoServiceImpl();
		cancionService = new CancionServiceImpl();
		artistaService = new ArtistaServiceImpl();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter(ParameterNames.ACTION);
		ContidoCriteria cc = new ContidoCriteria();
		if(ParameterNames.BUSQUEDACONTIDO.equalsIgnoreCase(action)) {
			try{

			

				List<Character> tipos = new ArrayList<Character>();


				if (request.getParameter(ParameterNames.ALBUM)!=null){
					tipos.add('A');
				}

				if (request.getParameter(ParameterNames.CANCION)!=null){
					tipos.add('C');
				}

				if (request.getParameter(ParameterNames.PLAYLIST)!=null){
					tipos.add('P');
				}


				cc.setTipos(tipos.toArray(new Character[tipos.size()]));

				if (!StringUtils.isEmpty(request.getParameter(ParameterNames.ARTISTA))){
					cc.setNomeArtista(request.getParameter(ParameterNames.ARTISTA));
				}
				if (!StringUtils.isEmpty(request.getParameter(ParameterNames.NOMECONTIDO))){
					cc.setNome(request.getParameter(ParameterNames.NOMECONTIDO));
				}


				List<Contido> contidos= (List<Contido>)contidoService.findByCriteria(cc,1,10);
				List<Artista> artistas = new ArrayList<>();
				List<Cancion> cancions = new ArrayList<>();
				List<Album> albums = new ArrayList<>();
				List<String> duracions = new ArrayList<>();
				List<Playlist> playlists = new ArrayList<>();

				for (Contido c: contidos){
					if (c instanceof Cancion) {
						cancions.add((Cancion)c);
						artistas.add(artistaService.findById(c.getCodArtista()));
						duracions.add(ContentUtils.getPrettyDuracion(((Cancion) c).getDuracion()));
					} else if (c instanceof Album){
						albums.add((Album)c);
						artistas.add(artistaService.findById(c.getCodArtista()));
					} else if (c instanceof Playlist){
						playlists.add((Playlist)c);
					}
					
				}
				request.setAttribute(AttributeNames.CANCIONS, cancions);
				request.setAttribute(AttributeNames.ALBUMS, albums);
				request.setAttribute(AttributeNames.PLAYLISTS, playlists);
				request.setAttribute(AttributeNames.ARTISTAS, artistas);
				request.setAttribute(AttributeNames.DURACIONS, duracions);
				request.getRequestDispatcher(ViewsPaths.CONTENTRESULTS).forward(request, response);
			}
		
		catch (Exception e){
			logger.error(e.getMessage(), e);
			request.setAttribute(AttributeNames.ERROR, e.getMessage());
			request.getRequestDispatcher(ViewsPaths.INDEX).forward(request, response);
		}
		
		}else if (ParameterNames.BUSQUEDAALBUM.equalsIgnoreCase(action)) {
			
			int startIndex = 1;
			int count = 50;
			try {
				Long idArtista = Long.valueOf(request.getParameter(ParameterNames.IDARTISTA));
				Artista artista = artistaService.findById(idArtista);
				Character[] tipoAlbum = {'A'};
				System.out.println(tipoAlbum);
				cc.setCodArtista(idArtista);
				cc.setTipos(tipoAlbum);
				List<Album> albumes = (List<Album>)contidoService.findByCriteria(cc, startIndex, count);	
				
				request.setAttribute(AttributeNames.ARTISTA, artista);
				request.setAttribute(AttributeNames.ALBUMS,  albumes);
				request.getRequestDispatcher(ViewsPaths.ALBUM_JSP).forward(request,response);
			}
			catch (Exception e) {
				logger.error(e.getMessage(), e);
				request.setAttribute(AttributeNames.ERROR, e.getMessage());
				request.getRequestDispatcher(ViewsPaths.INDEX).forward(request, response);
			}
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
