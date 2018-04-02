package com.musicstreaming.streaming.web.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.musicstreaming.streaming.web.controller.SessionAttributeNames;

	
public class SessionManager {

	public static Object get(HttpServletRequest request, String attName) {
		return getSession(request).getAttribute(attName);
	}

	public static void set(HttpServletRequest request, String attName, Object attValue) {
		getSession(request).setAttribute(attName, attValue);
	}
	
	/**
	 * Método factoria de la sesión, y sus objetos mandatorios.
	 * @param request
	 * @return
	 */
	protected static HttpSession getSession(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		// Atención a: https://guneetsahai.com/2008/08/09/request-getsession-false-always-returning-a-session/
		if (session==null) {
			// Inicializo la sesion y todos los objetos obligatorios
			session = request.getSession(true);
			// Pasarlo a un filtro... porque si no el ..a.d
			 
			/*session.setAttribute(SessionAttributeNames.SHOPPING_CART, c);*/
		}
		return session;
	}	
}