package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DonVi;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.xerces.internal.impl.dv.DVFactoryException;

import dao.DonViDAO;

@Controller
public class BpsdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@RequestMapping("/manageBpsd")
	public ModelAndView manageBpsd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DonViDAO donViDAO = new DonViDAO();
		
		String action = request.getParameter("action");
		if("AddBpsd".equalsIgnoreCase(action)) {
			String dvMa = request.getParameter("maBpsd");
			String dvTen = request.getParameter("tenBpsd");
			String sdt = request.getParameter("sdt");
			String diaChi = request.getParameter("diaChi");
			String email = request.getParameter("email");
			donViDAO.addDonVi(new DonVi(dvMa, dvTen, sdt, email, diaChi));
			
			ArrayList<DonVi> donViList =  (ArrayList<DonVi>) donViDAO.getAllDonVi();
			return new ModelAndView("danh-muc-bo-phan", "donViList", donViList);
		}
		
		if("deleteBpsd".equalsIgnoreCase(action)) {
			String[] idList = request.getParameterValues("dvMa");
			for(String s : idList) {
//				if(s != null) {
					donViDAO.deleteDonVi(donViDAO.getDonVi(s));
//				}
//				System.out.println(s);
			}
			
			ArrayList<DonVi> donViList =  (ArrayList<DonVi>) donViDAO.getAllDonVi();
			return new ModelAndView("danh-muc-bo-phan", "donViList", donViList);
		}
//		if("manageBpsd".equalsIgnoreCase(action))
		return new ModelAndView("login");
	}

}
