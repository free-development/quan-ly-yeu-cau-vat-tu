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
import model.MucDich;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import util.JSonUtil;
import dao.ChatLuongDAO;
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
		if("manageMd".equalsIgnoreCase(action)) {
			ArrayList<MucDich> mucDichList =  (ArrayList<MucDich>) mucDichDAO.getAllMucDich();
			return new ModelAndView("danh-muc-muc-dich", "mucDichList", mucDichList);
		}
		return new ModelAndView("login");
	}
	@RequestMapping(value="/preEditMd", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String preEditMd(@RequestParam("mdMa") String mdMa) {
		MucDichDAO mucDichDAO = new MucDichDAO();
		MucDich md = mucDichDAO.getMucDich(mdMa);
		//System.out.println("****" + clMa + "****");
		return JSonUtil.toJson(md);
	}
	@RequestMapping(value="/deleteMd", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String deleteMd(@RequestParam("mdMa") String mdMa) {
		new MucDichDAO().deleteMucDich(new MucDichDAO().getMucDich(mdMa));
		return JSonUtil.toJson(mdMa);
	}
}
