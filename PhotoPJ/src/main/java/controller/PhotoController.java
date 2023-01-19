package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import DAO.PhotoDAO;
import DTO.JoinColumn;
import DTO.Photographer;
import DTO.Reserv;

@WebServlet("/")
public class PhotoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PhotoDAO dao;
	private ServletContext ctx;

	@Override
	// init 서블릿 객체 생성 시 한번만 실행
	public void init(ServletConfig config) throws ServletException {
		super.init(config);

		dao = new PhotoDAO();
		ctx = getServletContext(); // 웹 어플리케이션 자원관리 (로그인 유지)
	}

	public PhotoController() {
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

		String context = request.getContextPath(); // 톰캣의 context path 가져온다 (server.xml 에서 확인)
		String command = request.getServletPath(); // 경로의 맨 끝 파일명 가져온다
		String site = null;

		PhotoDAO photo = new PhotoDAO();
		
		switch (command) {
		case "/list":
			site = getList(request);
			break;
		case "/portfolio":
			site = getView(request);
			break;
		case "/reserv":
			site = getReservPage(request);
			break;
		case "/reservwrite":
			site = insertReserv(request);
			break;
		case "/reservresult":
			site = getReservList(request);
			break;
		}
		
		// POST 요청 처리후에는 리디렉션 방법으로 이동 할 수 있어야 함.
		if (site.startsWith("redirect:/")) {
			// redirect/ 문자열 이후 경로만 가지고 옴
			String rview = site.substring("redirect:/".length());
			System.out.println(rview);

			response.sendRedirect(rview);

		} else { // forward
			ctx.getRequestDispatcher("/" + site).forward(request, response);
		}

	}

// 메소드 ===============================================================================	
	
	// 포토그래퍼 리스트 조회
	
	public String getList(HttpServletRequest request) {
		
		List<Photographer> list;
		
		try {
			list = dao.getList();
			request.setAttribute("photographerList", list);
		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("포토그래퍼 리스트 불러오는 과정에서 문제발생");
			request.setAttribute("error", "포토그래퍼 리스트가 정상적으로 처리되지 않음");
		}
		return "list.jsp";
	}

	// 포트폴리오 조회
	
	public String getView(HttpServletRequest request) {
		int p_id = Integer.parseInt(request.getParameter("p_id"));

		try {
			Photographer p = dao.getView(p_id);
			request.setAttribute("photographer", p);
		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("포토그래퍼 포트폴리오 불러오는 과정에서 문제발생");
			request.setAttribute("error", "포트폴리오가 정상적으로 처리되지 않음");
		}
		return "portfolio.jsp";
	}

	// 예약(달력)페이지
	
	public String getReservPage(HttpServletRequest request) {
		int p_id = Integer.parseInt(request.getParameter("p_id"));

		try {
			Photographer p = dao.getReserv(p_id);
			request.setAttribute("photographer", p);
		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("달력페이지 불러오는 과정에서 문제발생");
			request.setAttribute("error", "달력페이지가 정상적으로 처리되지 않음");
		}
		return "reserv.jsp";
	}

	// 예약 내용(모델이름, 컨셉) 적는 페이지
	
	public String insertReserv(HttpServletRequest request) {
		
		Reserv r = new Reserv();
		
		r.setM_name(request.getParameter("m_name"));
		r.setConcept(request.getParameter("concept"));
		r.setP_id(Integer.parseInt(request.getParameter("p_id")));
		
		String date = request.getParameter("month");
		date += "월 ";
		date += request.getParameter("i");
		date += "일";
		
		r.setTestdate(date);
		
		try {
			dao.insertReserv(r);
		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("예약추가 과정에서 문제발생");
			try {
				//get방식으로 넘겨줄때 한글 깨짐을 방지한다.
				String encodeName = URLEncoder.encode("예약글이 정상적으로 등록되지 않았습니다!", "UTF-8");
				return "redirect:/list?error=" + encodeName;
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		return "reservwrite.jsp";

      
	}

	// 예약목록 리스트 (내용) 조회
	
		public String getReservList(HttpServletRequest request) {
			
//			String m_name = request.getParameter("m_name");
//			String concept = request.getParameter("concept");
//			int p_id = Integer.parseInt(request.getParameter("p_id"));
//			String p_name = request.getParameter("p_name");
//			
//			String date = request.getParameter("month");
//			date += "월 ";
//			date += request.getParameter("i");
//			date += "일";
//			System.out.println(date);
			
			List<Reserv> list;
			
			try {
				list = dao.getReservList();
				request.setAttribute("reservList", list);
			} catch (Exception e) {
				e.printStackTrace();
				ctx.log("예약 목록 생성 과정에서 문제 발생");
				//나중에 사용자 한테 에러메세지를 보여주기 위해 저장
				request.setAttribute("error", "에약 목록이 정상적으로 처리되지 않았습니다!"); 
			}
			
			return "resultreserv.jsp";
		}	
	
	
}
