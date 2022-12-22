package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.VoteDAO;

@WebServlet("/")
public class VoteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public VoteController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doPro(request, response);
	}

//===================================================================================================================

	protected void doPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String context = request.getContextPath(); // 톰캣의 context path 를 가져온다. (server.xml 에서 확인)
		String command = request.getServletPath(); // 경로의 맨 끝 파일명 가져온다
		String site = null;

		System.out.println(context + ',' + command);

		VoteDAO vote = new VoteDAO();
		
		/* 
		 * request에 담아온 경로 맨 끝 파일명(command)이 각 case 와 일치하면 
		 * 해당하는 .jsp 를 site에 대입
		*/
		
		switch (command) { 
		case "/home":
			site = "index.jsp";
			break;
		case "/vote":
			site = vote.vote(request, response);
			break;
		case "/search":
			site = vote.search(request, response);
			break;
		case "/result":
			site = vote.result(request, response);
			break;
		}
		
		getServletContext().getRequestDispatcher("/" + site).forward(request, response);
		
	}
}
