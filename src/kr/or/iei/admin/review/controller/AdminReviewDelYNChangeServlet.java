package kr.or.iei.admin.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.iei.admin.model.service.AdminMemberService;
import kr.or.iei.admin.model.service.AdminMemberServiceImpl;
import kr.or.iei.admin.review.model.service.AdminReviewService;
import kr.or.iei.admin.review.model.service.AdminReviewServiceImpl;

/**
 * Servlet implementation class AdminReviewDelYNChangeServlet
 */
@WebServlet("/admin/reviewDelYNChange.do")
public class AdminReviewDelYNChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReviewDelYNChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//인코딩
				request.setCharacterEncoding("UTF-8");
				
				int postnum = Integer.parseInt(request.getParameter("postnum"));
				char delYN = request.getParameter("del_YN").charAt(0);
				
				if(delYN=='Y') delYN='N';
				else			delYN='Y';
				AdminReviewService adrService = new AdminReviewServiceImpl();
				int result = adrService.updateReviewDelYN(postnum,delYN);
				
				RequestDispatcher view = request.getRequestDispatcher("/views/admin/updateReviewDelYN.jsp");
				if(result>0) request.setAttribute("result", true);
				else request.setAttribute("result", false);
				
				view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
