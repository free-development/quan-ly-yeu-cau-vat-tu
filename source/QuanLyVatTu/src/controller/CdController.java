package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ChatLuong;
import model.ChucDanh;
import model.NoiSanXuat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.ChucDanhDAO;

@Controller
public class CdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@RequestMapping("/manageCd")
	public ModelAndView manageCd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ChucDanhDAO chucDanhDAO = new ChucDanhDAO();
		String action = request.getParameter("action");
		if("AddCd".equalsIgnoreCase(action)) {
			String cdMa = request.getParameter("cdMa");
			String cdTen = request.getParameter("cdTen");
			
			chucDanhDAO.addChucDanh(new ChucDanh(cdMa,cdTen));
			ArrayList<ChucDanh> chucDanhList =  (ArrayList<ChucDanh>) chucDanhDAO.getAllChucDanh();
			return new ModelAndView("danh-muc-chuc-danh", "chucDanhList", chucDanhList);
		}
		if("deleteCd".equalsIgnoreCase(action)) {
			String[] idList = request.getParameterValues("cdMa");
			for(String s : idList) {
					chucDanhDAO.deleteChucDanh(chucDanhDAO.getChucDanh(s));
			}
			
			ArrayList<ChucDanh> chucDanhList =  (ArrayList<ChucDanh>) chucDanhDAO.getAllChucDanh();
			return new ModelAndView("danh-muc-chuc-danh", "chucDanhList", chucDanhList);
		}
		if("manageCd".equalsIgnoreCase(action)) {
			ArrayList<ChucDanh> chucDanhList =  (ArrayList<ChucDanh>) chucDanhDAO.getAllChucDanh();
			return new ModelAndView("danh-muc-chuc-danh", "chucDanhList", chucDanhList);
		}
		return new ModelAndView("login");
	}
	
}
