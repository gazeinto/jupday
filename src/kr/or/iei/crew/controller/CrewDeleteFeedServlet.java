package kr.or.iei.crew.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.iei.crew.model.service.CrewService;
import kr.or.iei.crew.model.service.CrewServiceimpl;

/**
 * Servlet implementation class CrewDeleteFeedServlet
 */
@WebServlet("/crew/crewDeleteFeed.do")
public class CrewDeleteFeedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrewDeleteFeedServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int crewNo = Integer.parseInt(request.getParameter("crewNo"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int feedNo = Integer.parseInt(request.getParameter("feedNo"));
		int currentFeedPage = Integer.parseInt(request.getParameter("currentFeedPage"));
		
		CrewService cService = new CrewServiceimpl();
		
		int result = cService.deleteCrewFeed(feedNo);
	
		RequestDispatcher view = request.getRequestDispatcher("/views/crew/crewDeleteFeedResult.jsp");
		
		if(result>0) {
			request.setAttribute("result", true);
		}else {
			request.setAttribute("result", false);
		}
		
		request.setAttribute("crewNo", crewNo);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("currentFeedPage", currentFeedPage);
		
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
