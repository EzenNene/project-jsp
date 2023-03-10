package ch09;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

/**
 * Servlet implementation class StudentController
 */

// StudentController s = new StudentController();
// ↑ 서블릿 객체 생성은 톰캣이 해준다.

@WebServlet("/studentControl")
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	StudentDAO dao;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config); // 서블릿 초기화
		dao = new StudentDAO(); // StudentDAO 객체가 한번만 만들어진다
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 한글데이터 깨짐 방지
		// request : 뷰에서 넘어온 데이터, 정보가 들어있다.
		String action = request.getParameter("action"); // insert (쿼리스트링)
		String view = "";
		
		if (action == null) {
			// 리퀘스트를 또 한다.
			getServletContext().getRequestDispatcher("/studentControl?action=list")
			.forward(request, response);
		} else {
			switch(action) {
			case "list": view = list(request, response);  break;
			case "insert": view = insert(request, response); break;
			}
			
			getServletContext().getRequestDispatcher("/ch09/" + view)
			.forward(request, response);
			
			// getServletContext() : ServletContext를 얻어옴
			// getRequestDispatcher : 이동할 페이지 경로지정
			// forward : 페이지를 이동시킨다. 내부에서 이동이 되므로 주소 안변함
			getServletContext().getRequestDispatcher("/ch09/" + view)
			.forward(request, response);
			
		}
		
		
	
	}
	
	public String list(HttpServletRequest request, HttpServletResponse response) {
		// requset.setAttribute("키", 객체)
		request.setAttribute("students", dao.getAll()); 
		// request,response 하는 과정에서 해당 데이터 얻어옴
		return "studentInfo.jsp";
	}
	
	// request 데이터 받아옴 -> DAO 에 있는 insert 실행(DB에 insert가 됨) -> 
	// 페이지명 (studentInfo.jsp)
	public String insert(HttpServletRequest request, HttpServletResponse response) {
		Student s = new Student();
		try {
			BeanUtils.populate(s, request.getParameterMap());
			
			/*
	
			BeanUtils.populate(s, request.getParameterMap()); : 아래코드 역할 대신해줌
		 
			s.setUsername(request.getParameter("username"));
			s.setEmail(request.getParameter("email"));
			s.setUniv(request.getParameter("univ"));
			s.setBirth(request.getParameter("birth"));
			Date date = (Date)formatter.parse(request.getParameter("birth"));
		
			*/
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		// 컨트롤러는 DAO 한테 있는 메소드 사용 (DAO한테 DB관련 요청)
		dao.insert(s); 

		return "studentInfo.jsp";
		
	}

}
