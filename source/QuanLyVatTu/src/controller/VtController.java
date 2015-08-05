package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DonVi;
import model.NoiSanXuat;
import model.VaiTro;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.NoiSanXuatDAO;
import dao.VaiTroDAO;


@Controller
public class VtController extends HttpServlet {
	private static final long serialVersionUvtId = 1L;
	@RequestMapping("/manageVt")
	public ModelAndView manageVt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VaiTroDAO vaiTroDAO = new VaiTroDAO();
		
		String action = request.getParameter("action");
		if("AddVaiTro".equalsIgnoreCase(action)) {
			int vtId = Integer.parseInt(request.getParameter("vtId"));
			String vtTen = request.getParameter("vtTen");
			
			vaiTroDAO.addVaiTro(new VaiTro(vtId,vtTen));
			ArrayList<VaiTro> vaiTroList =  (ArrayList<VaiTro>) vaiTroDAO.getAllVaiTro();
			return new ModelAndView("danh-muc-vai-tro", "vaiTroList", vaiTroList);
		}
		if("deleteVaiTro".equalsIgnoreCase(action)) {
			String[] vtIdList = request.getParameterValues("vtId");
			for(String s : vtIdList) {
					vaiTroDAO.deleteVaiTro(vaiTroDAO.getVaiTro(Integer.parseInt(s)));
			}
			ArrayList<VaiTro> vaiTroList =  (ArrayList<VaiTro>) vaiTroDAO.getAllVaiTro();
			return new ModelAndView("danh-muc-vai-tro", "vaiTroList", vaiTroList);
		}
		return new ModelAndView("login");
	}

}