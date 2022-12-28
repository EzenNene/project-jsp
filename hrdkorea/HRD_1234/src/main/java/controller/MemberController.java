package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;

@WebServlet("/")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberController() {
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

		System.out.println(context + ", " + command);

		MemberDAO member = new MemberDAO();
		switch (command) {
		case "/home":
			site = "index.jsp";
			break;
		case "/insert":
			site = member.insert(request, response);
			break;
		case "/list":
			site = member.selectAll(request, response);
			break;
		case "/add":
			site = member.nextCustno(request, response);
			break;
		case "/modify":
			site = member.modify(request, response);
			break;
		case "/result":
			site = member.selectResult(request, response);
			break;
		case "/update":
			int result1 = member.update(request, response);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			if (result1 == 1) { // 업데이트성공
				out.println("<script>"); // location.href = '/HRD_1234';
				out.println("alert('회원정보 수정이 완료 되었습니다.'); location.href='" + context + "';");
				out.println("</script>");
				out.flush(); // 한꺼번에 내보내기
			} else {
				out.println("<script>"); // location.href = '/HRD_1234';
				out.println("alert('수정을 실패했습니다.'); location.href='" + context + "';");
				out.println("</script>");
				out.flush(); // 한꺼번에 내보내기
			}

			break;

		case "/delete":
			int result2 = member.delete(request, response);
			response.setContentType("text/html; charset=UTF-8");
			out = response.getWriter();

			if (result2 == 1) { // 업데이트성공
				out.println("<script>"); // location.href = '/HRD_1234';
				out.println("alert('회원정보 삭제가 완료 되었습니다.'); location.href='" + context + "';");
				out.println("</script>");
				out.flush(); // 한꺼번에 내보내기
			} else {
				out.println("<script>"); // location.href = '/HRD_1234';
				out.println("alert('삭제를 실패했습니다.'); location.href='" + context + "';");
				out.println("</script>");
				out.flush(); // 한꺼번에 내보내기
			}

			break;

		}

		getServletContext().getRequestDispatcher("/" + site).forward(request, response);
	}

}