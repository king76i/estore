package struts2.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;


/**
 * Servlet Filter implementation class AuthorityFilter
 */
@WebFilter("/AuthorityFilter")
public class AuthorityFilter implements Filter {
	private ServletContext context;
    /**
     * Default constructor. 
     */
    public AuthorityFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		
		StringBuffer tUrl = ((HttpServletRequest)request).getRequestURL();
		String url = tUrl.toString();
		System.out.println(url);
		HttpSession session = ((HttpServletRequest)request).getSession();
		String contextPath = context.getContextPath();
		System.out.println(contextPath);
		if(!url.endsWith("login.action")&&!url.endsWith(contextPath+"/")&&!url.endsWith("login.jsp")&&session.getAttribute("manager")==null){
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script language='javascript'>");
			out.print("alert('ÄúÉÐÎ´µÇÂ½,»òÕßÀë¿ªÌ«¾Ã,ÇëÖØÐÂµÇÂ½!');");
			out.print("window.location.href='"+contextPath+"/login.jsp';");
			out.print("</script>");
			out.flush();
			return;
			
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		context = fConfig.getServletContext();
	}

}
