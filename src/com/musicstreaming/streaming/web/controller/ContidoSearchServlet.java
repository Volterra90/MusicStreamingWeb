package com.musicstreaming.streaming.web.controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicstreaming.streaming.model.Contido;
import com.musicstreaming.streaming.service.ContidoService;
import com.musicstreaming.streaming.service.ContidoCriteria;
import com.musicstreaming.streaming.service.impl.ContidoMockServiceImpl;

/**
 * Servlet implementation class ContidoSearchServlet
 */
@WebServlet("/ContidoSearchServlet")
public class ContidoSearchServlet extends HttpServlet {
	
	private ContidoService contidoService = null;
	
	
	
    public ContidoSearchServlet() {
        super();
        contidoService = new ContidoMockServiceImpl();  
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Contido> contidos = null;
		ContidoCriteria cc = new ContidoCriteria();
		String cancion = request.getParameter("cancion");
	    try {	
    	cc.setNome(cancion);;
		if (cancion!=null && cancion!="") {
			contidos = contidoService.findByCriteria(cc);
			if (contidos.isEmpty()) {
				request.setAttribute("error", "Non hai ningunha canción con ese nome");
			}
			else {
				request.setAttribute("contidos", contidos);
			}
		}
		else {
			request.setAttribute("error","Non introduciches ningún contido");
		}
		request.getRequestDispatcher("/html/contido-search.jsp").forward(request, response);
	    }
	    catch (Exception e){
	    	e.printStackTrace();
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
