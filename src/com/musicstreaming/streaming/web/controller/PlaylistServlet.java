package com.musicstreaming.streaming.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.musicstreaming.streaming.service.ContidoService;
import com.musicstreaming.streaming.service.impl.ContidoServiceImpl;

/**
 * Servlet implementation class PlaylistServlet
 */
@WebServlet("/PlaylistServlet")
public class PlaylistServlet extends HttpServlet {
	
	private static Logger logger = LogManager.getLogger(PlaylistServlet.class.getName());
	private ContidoService contidoService = null;
       
  
    public PlaylistServlet() {
        super();
        contidoService = new ContidoServiceImpl();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
