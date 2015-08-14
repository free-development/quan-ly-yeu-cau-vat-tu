package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import map.siteMap;
import model.DonVi;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.CTVatTuDAO;
import dao.CongVanDAO;
import dao.DonViDAO;
import dao.VaiTroDAO;
import dao.YeuCauDAO;

@Controller
public class BcbdnController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @RequestMapping("/manageBcbdn")
	protected ModelAndView manageBcbdn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	VaiTroDAO vaiTro = new VaiTroDAO();
    	CongVanDAO yeuCau = new CongVanDAO();
    	DonViDAO donVi = new DonViDAO();
    	
    	String action = request.getParameter("action");
    	
    	if("manageBcbdn".equalsIgnoreCase(action)){
    		ArrayList<DonVi> donViList = (ArrayList<DonVi>) new DonViDAO().getAllDonVi();
    		request.setAttribute("donViList", donViList);
    		return new ModelAndView(siteMap.baoCaoBangDeNghi);
    	}
    	  return new ModelAndView("login");
	}

}
