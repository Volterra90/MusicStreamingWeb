/**
 * 
 */
package com.musicstreaming.streaming.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.musicstreaming.streaming.web.controller.AttributeNames;
import com.musicstreaming.streaming.web.controller.Errors;
import com.musicstreaming.streaming.web.controller.SessionAttributeNames;
import com.musicstreaming.streaming.web.controller.ViewsPaths;
import com.musicstreaming.streaming.web.util.SessionManager;

/**
 * @author hector.ledo.doval
 *
 */
public class IdentificationFilter implements Filter {
	private static Logger logger = LogManager.getLogger(IdentificationFilter.class.getName());
	  
    public IdentificationFilter() {       
    }

	public void init(FilterConfig cfg) throws ServletException {
		// Habitualmente se configuran en el web.xml´
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = ((HttpServletRequest) request);
		
		
		String target = null;

        
        
        if (SessionManager.get(httpRequest, SessionAttributeNames.USER) != null) {
            chain.doFilter(request, response);
        } else {        	
        	target = ViewsPaths.SIGN_IN;
        	request.setAttribute(AttributeNames.IDENTIFICATION_ERROR, Errors.IDENTIFICATION_ERROR);
        	request.getRequestDispatcher(target).forward(request, response);
        	
        }
    }

}