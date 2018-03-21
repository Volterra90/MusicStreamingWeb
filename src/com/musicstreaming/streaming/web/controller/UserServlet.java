package com.musicstreaming.streaming.web.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.musicstreaming.streaming.model.Usuario;
import com.musicstreaming.streaming.service.UsuarioService;
import com.musicstreaming.streaming.service.impl.UsuarioServiceImpl;
import com.musicstreaming.streaming.util.PasswordEncryptionUtil;
import com.musicstreaming.streaming.util.ToStringUtil;

/**
 * Servlet de Usuario
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(UserServlet.class.getName());
	private UsuarioService usuarioService = null;


	public UserServlet() {
		super();
		usuarioService = new UsuarioServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter(ParameterNames.ACTION);		
		try {
			if (ParameterNames.SIGNUP.equalsIgnoreCase(action)) {
				Usuario u = new Usuario();
				u.setApelidos(request.getParameter(ParameterNames.APELIDOS));
				u.setContrasinal(PasswordEncryptionUtil.encryptPassword(request.getParameter(ParameterNames.PASSWORD)));
				String fecha = request.getParameter(ParameterNames.FECHA);
				
				Date fechaNacemento = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
				u.setFechaNacemento(fechaNacemento);
				u.setEmail(request.getParameter(ParameterNames.EMAIL));
				u.setFechaSubscricion(new Date());
				u.setNick(request.getParameter(ParameterNames.NICK));
				u.setNome(request.getParameter(ParameterNames.NOME)); 
				u.setXenero(request.getParameter(ParameterNames.XENERO).charAt(0));

				if (logger.isDebugEnabled()) {
					logger.debug("Usuario: " + ToStringUtil.toString(u));
				}

				usuarioService.create(u);
				response.sendRedirect(request.getContextPath()+ViewsPaths.SIGN_IN);
			}
		}catch (Throwable e) {			
			logger.error(e.getMessage(),e);
			request.setAttribute(AttributeNames.ERROR, e.getMessage());
			request.getRequestDispatcher(ViewsPaths.SIGN_UP).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public static void main (String args[]) {
		
		System.out.println(PasswordEncryptionUtil.encryptPassword(""));
		
	}

}
