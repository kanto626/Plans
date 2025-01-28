package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
* Servlet Filter implementation class AuthFilter
*/
@WebFilter("/*")
public class AuthFilter implements Filter {
	/**
	* Default constructor.
	*/
	public AuthFilter() {
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		String uri = req.getRequestURI();

		// 静的リソースを除外
		if (uri.startsWith(req.getContextPath() + "/css") ||
				uri.startsWith(req.getContextPath() + "/js") ||
				uri.startsWith(req.getContextPath() + "/images") ||
				uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith(".png") || uri.endsWith(".jpg")) {
			chain.doFilter(request, response);
			return;
		}

		// 認証対象のリソースをチェック
		if (!uri.endsWith("/login") && !uri.endsWith("/top") && !uri.endsWith("/register")) {
			if (session.getAttribute("loginId") == null) {
				res.sendRedirect("login");
				return;
			}
		}

		// フィルターチェーンを続行
		chain.doFilter(request, response);
	}

	/**
	* @see Filter#init(FilterConfig)
	*/
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
}