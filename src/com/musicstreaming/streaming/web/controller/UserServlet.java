package com.musicstreaming.streaming.web.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.musicstreaming.streaming.exceptions.DuplicateInstanceException;
import com.musicstreaming.streaming.exceptions.InstanceNotFoundException;
import com.musicstreaming.streaming.exceptions.MailException;
import com.musicstreaming.streaming.model.Usuario;
import com.musicstreaming.streaming.service.UsuarioService;
import com.musicstreaming.streaming.service.impl.UsuarioServiceImpl;
import com.musicstreaming.streaming.util.PasswordEncryptionUtil;
import com.musicstreaming.streaming.util.ToStringUtil;
import com.musicstreaming.streaming.web.util.CookieManager;
import com.musicstreaming.streaming.web.util.LocaleManager;
import com.musicstreaming.streaming.web.util.SessionManager;
import com.musicstreaming.streaming.web.util.WebConstants;

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
		String target = null;
		boolean redirect = false;

		if (ParameterNames.SIGNUP.equalsIgnoreCase(action)) {
			try {
		
			String nome = request.getParameter(ParameterNames.NOME).trim();
			String apelidos = request.getParameter(ParameterNames.APELIDOS).trim();
			String nick = request.getParameter(ParameterNames.NICK).trim();
			String email = request.getParameter(ParameterNames.EMAIL).trim();
			String plain_password = request.getParameter(ParameterNames.PASSWORD).trim();
			String fecha = request.getParameter(ParameterNames.FECHA);
			request.setAttribute(AttributeNames.NOME, nome);
			request.setAttribute(AttributeNames.APELIDO, apelidos);
			request.setAttribute(AttributeNames.NICK, nick);
			request.setAttribute(AttributeNames.EMAIL, email);
			request.setAttribute(AttributeNames.FECHA, fecha);
			Date fechaNacemento = null;
			if (!StringUtils.isEmpty(fecha)){
				fechaNacemento = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
			}
			String xenero = request.getParameter(ParameterNames.XENERO);

			boolean hasErrors = false;

			if (StringUtils.isEmpty(nome)) {
				request.setAttribute(AttributeNames.ERROR_FIRST_NAME, Errors.REQUIRED_FIELD_ERROR);
				hasErrors = true;
			}
			if(StringUtils.isEmpty(apelidos)) {
				request.setAttribute(AttributeNames.ERROR_LAST_NAME, Errors.REQUIRED_FIELD_ERROR);
				hasErrors = true;
			}
			if (StringUtils.isEmpty(nick)) {
				request.setAttribute(AttributeNames.ERROR_NICK, Errors.REQUIRED_FIELD_ERROR);
				hasErrors = true;
			}
			if (StringUtils.isEmpty(email)) {
				request.setAttribute(AttributeNames.ERROR_EMAIL, Errors.REQUIRED_FIELD_ERROR);
				hasErrors = true;
			}
			if (StringUtils.isEmpty(plain_password)) {
				request.setAttribute(AttributeNames.ERROR_PASSWORD, Errors.REQUIRED_FIELD_ERROR);
				hasErrors = true;
			}
			if(StringUtils.isEmpty(fecha)) {
				request.setAttribute(AttributeNames.ERROR_DATE, Errors.REQUIRED_FIELD_ERROR);
				hasErrors = true;
			}
			if(StringUtils.isEmpty(xenero)) {
				request.setAttribute(AttributeNames.ERROR_GENDER, Errors.REQUIRED_FIELD_ERROR);
			}
			if (hasErrors) {
				target = ViewsPaths.SIGN_UP;
			}else {
					Usuario u = new Usuario();
					u.setApelidos(apelidos);
					u.setContrasinal(PasswordEncryptionUtil.encryptPassword(plain_password));
					u.setFechaNacemento(fechaNacemento);
					u.setEmail(email);
					u.setFechaSubscricion(new Date());
					u.setNick(nick);
					u.setNome(nome); 
					u.setXenero(xenero.charAt(0));

					if (logger.isDebugEnabled()) {
						logger.debug("Usuario: " + ToStringUtil.toString(u));
					}

					usuarioService.create(u);
					target = request.getContextPath()+ViewsPaths.SIGN_IN;
					redirect = true;
			}}catch(DuplicateInstanceException e) {
					logger.error(e.getMessage(),e);
					request.setAttribute(AttributeNames.ERROR, Errors.DUPLICATE_USER);
					target = ViewsPaths.SIGN_UP;
				}
				catch (MailException e) {
					logger.error(e.getMessage(),e);
					request.setAttribute(AttributeNames.ERROR, Errors.MAIL_ERROR);
					target = ViewsPaths.SIGN_UP;
				}
				catch (Exception e) {			
					logger.error(e.getMessage(),e);
					request.setAttribute(AttributeNames.ERROR, Errors.GENERIC_ERROR);
					target = ViewsPaths.SIGN_UP;
				}
		
		}else if (ParameterNames.SIGNIN.equalsIgnoreCase(action)) {
			String userName = request.getParameter(ParameterNames.NOME).trim();
			String password = request.getParameter(ParameterNames.PASSWORD).trim();
			
			request.setAttribute(AttributeNames.NOME, userName);
			
			boolean hasErrors = false;
			
			if (StringUtils.isEmpty(userName)) {
				hasErrors = true;
				request.setAttribute(AttributeNames.ERROR_USER_NAME, Errors.REQUIRED_FIELD_ERROR);
			}
			if (StringUtils.isEmpty(password)) {
				hasErrors = true;
				request.setAttribute(AttributeNames.ERROR_PASSWORD, Errors.REQUIRED_FIELD_ERROR);
			}
			if (hasErrors) {
				target = ViewsPaths.SIGN_IN;
			} else {
			try {
				Usuario usuario = usuarioService.findUserById(userName);							
					if (!PasswordEncryptionUtil.checkPassword(password,usuario.getContrasinal())) {
						request.setAttribute(AttributeNames.ERROR, Errors.INCORRECT_PASSWORD_ERROR);			
						target = ViewsPaths.SIGN_IN;
					} else { 
						SessionManager.set(request, SessionAttributeNames.USER, usuario);
						if (request.getParameter(ParameterNames.RECORDAR_USUARIO)!=null) {
							CookieManager.addCookie(response, AttributeNames.USER_COOKIE, usuario.getEmail(), "/", 30*24*60*60);
					}
						target = ViewsPaths.INDEX;
						redirect = true;
					}
				
			}catch (InstanceNotFoundException e) {
				request.setAttribute(AttributeNames.ERROR, Errors.USER_NOT_FOUND_ERROR);
				target = ViewsPaths.SIGN_IN;
			}catch (Exception e) {
				logger.error(e.getMessage(),e);
				request.setAttribute(AttributeNames.ERROR, Errors.GENERIC_ERROR);
				request.getRequestDispatcher(ViewsPaths.SIGN_IN).forward(request, response);
			}	
		}
		}else if (ParameterNames.CHANGE_LOCALE.equalsIgnoreCase(action)) {
    		String localeName = request.getParameter(ParameterNames.LOCALE);
    		
    		List<Locale> results = LocaleManager.getMatchedLocales(localeName);
    		Locale newLocale = null;
    		try {
    		if (results.size()>0) {
    			newLocale = results.get(0);
    		} else {
    			logger.warn("Request locale not supported: "+localeName);
    			newLocale = LocaleManager.getDefault();
    		}
    		
			SessionManager.set(request, WebConstants.USER_LOCALE, newLocale);			
			CookieManager.addCookie(response, WebConstants.USER_LOCALE, newLocale.toString(), "/", 365*24*60*60);
			
			if (logger.isDebugEnabled()) {
				logger.debug("Locale changed to "+newLocale);
			}
			
			target = 
					ViewsPaths.INDEX; 		
			redirect = true;
			
    	}catch (Exception e) {
				logger.error(e.getMessage(),e);
				request.setAttribute(AttributeNames.ERROR, Errors.LOCALE_ERROR);
				request.getRequestDispatcher(ViewsPaths.SIGN_IN).forward(request, response);
			}
		}
		
		
		if (logger.isDebugEnabled()) {
			logger.debug("Action "+action+" processed: target = "+target+", redirect = "+redirect);
		}
		if (redirect) {
    		response.sendRedirect(target);
    	} else {
    		request.getRequestDispatcher(target).forward(request, response);
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
