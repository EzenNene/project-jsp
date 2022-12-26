package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.VaccineDAO;

@WebServlet("/VaccineController")
public class VaccineController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public VaccineController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPro(request, response);
	}

	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String context = request.getContextPath();
		String command = request.getServletPath();
		String site = null;
	
		VaccineDAO vaccine = new VaccineDAO();
		
		switch(command) {
		case "/home" :
			site = "index.jsp";
			break;
		case "/reserv" :
			site = vaccine.reserv(request, response);
			break;
		}
		
		getServletContext().getRequestDispatcher("/" + site).forward(request, response);
		
		
		
	}
	

	
	
	
}
