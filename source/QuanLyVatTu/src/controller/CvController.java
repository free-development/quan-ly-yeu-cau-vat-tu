package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.CongVanDAO;
import dao.DonViDAO;
import map.siteMap;
import model.CongVan;

/**
 * Servlet implementation class CvController
 */
@Controller
public class CvController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @RequestMapping("/cvManage")
	public ModelAndView manageCV(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DonViDAO donViDAO = new DonViDAO();
		
		String action = request.getParameter("action");
		if("manageCv".equals(action)) {
			ArrayList<CongVan> congVanList = (ArrayList<CongVan>) new CongVanDAO().getAllCongVan();
			return new ModelAndView(siteMap.congVan);
		}
		return new ModelAndView("login");
	}

}
