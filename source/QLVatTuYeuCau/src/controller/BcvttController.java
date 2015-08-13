package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.CTVatTuDAO;
import dao.CongVanDAO;
import dao.YeuCauDAO;

@Controller
public class BcvttController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @RequestMapping("/manageBcvtt")
	protected ModelAndView manageBcvtt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	CongVanDAO congVan = new CongVanDAO();
    	YeuCauDAO yeuCau = new YeuCauDAO();
    	CTVatTuDAO ctVatTu = new CTVatTuDAO();
    	
    	String action = request.getParameter("action");
    	if("xemBaoCao".equalsIgnoreCase(action)){
    		
    	}
    	  return new ModelAndView("login");
	}

}
