package org.jsp.mini.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.jsp.mini.MemberController;
import org.jsp.mini.vo.Member;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class checkPwInterceptor extends HandlerInterceptorAdapter
{
	@Inject
	MemberController mbCon = new MemberController();
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
	{
		System.out.println("인터셉터 실행");
//		response.sendRedirect(request.getContextPath() + "/member/checkPw");
		
		StringBuffer url = request.getRequestURL();
		String requestUrl = url.substring(27, url.length());
//		System.out.println(requestUrl);
//		mbCon.goToCheckPw();
//		
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		System.out.println("loginMember 들어오나?: " + loginMember);
		
		//로그인 상태가 아니라면
		if (loginMember == null) {
			//로그인 페이지로 이동시킨다.
			response.sendRedirect(request.getContextPath() + "/member/loginMember?requestUrl=" + requestUrl);
			System.out.println("loginMember 들어오나?: " + loginMember);
			return false;
			
//			//그래서 로그인을 완료했다면
//			if (session.getAttribute("loginMember") != null) {
//				//원래 요청했던 페이지로 가게 해준다.
//				return super.preHandle(request, response, handler);
//			}
//			//그래도 로그인에 실패했다면
//			else {
//				//다시 로그인하게 만든다.
//				response.sendRedirect(request.getContextPath() + "/member/loginMember");
//			}
		}
		//이미 로그인 상태라면
		else {
			//요청한 페이지로 잘 가라고 보내준다.
			return super.preHandle(request, response, handler);
		}
	}
	
	@Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
 
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }
 
    @Override
    public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        super.afterConcurrentHandlingStarted(request, response, handler);
    }
}
