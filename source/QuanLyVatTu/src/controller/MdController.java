package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ChatLuong;
import model.MucDich;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MucDichDAO;

@Controller
public class MdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@RequestMapping("/manageMd")
	public ModelAndView manageMd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MucDichDAO mucDichDAO = new MucDichDAO();
		String action = request.getParameter("action");
		if("AddMd".equalsIgnoreCase(action)) {
			String mdMa = request.getParameter("mdMa");
			String mdTen = request.getParameter("mdTen");
			
			mucDichDAO.addMucDich(new MucDich(mdMa,mdTen));
			ArrayList<MucDich> mucDichList =  (ArrayList<MucDich>) mucDichDAO.getAllMucDich();
			return new ModelAndView("danh-muc-muc-dich", "mucDichList", mucDichList);
		}
		if("deleteMd".equalsIgnoreCase(action)) {
			String[] idList = request.getParameterValues("mdMa");
			for(String s : idList) {
					mucDichDAO.deleteMucDich(mucDichDAO.getMucDich(s));
			}
			
			ArrayList<MucDich> mucDichList =  (ArrayList<MucDich>) mucDichDAO.getAllMucDich();
			return new ModelAndView("danh-muc-muc-dich", "mucDichList", mucDichList);
		}
		return new ModelAndView("login");
	}

}
