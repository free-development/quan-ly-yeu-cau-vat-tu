package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.NoiSanXuat;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.NoiSanXuatDAO;


@Controller
public class NsxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@RequestMapping("/manageNsx")
	public ModelAndView manageNsx(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoiSanXuatDAO noiSanXuatDAO = new NoiSanXuatDAO();
		
		String action = request.getParameter("action");
		if("AddNsx".equalsIgnoreCase(action)) {
			String nsxMa = request.getParameter("nsxMa");
			String nsxTen = request.getParameter("nsxTen");
			
			noiSanXuatDAO.addNoiSanXuat(new NoiSanXuat(nsxMa,nsxTen));
			ArrayList<NoiSanXuat> noiSanXuatList =  (ArrayList<NoiSanXuat>) noiSanXuatDAO.getAllNoiSanXuat();
			return new ModelAndView("danh-muc-noi-san-xuat", "noiSanXuatList", noiSanXuatList);
		}
		if("deleteNsx".equalsIgnoreCase(action)) {
			String[] idList = request.getParameterValues("nsxMa");
			for(String s : idList) {
					noiSanXuatDAO.deleteNoiSanXuat(noiSanXuatDAO.getNoiSanXuat(s));
			}
			
			ArrayList<NoiSanXuat> noiSanXuatList =  (ArrayList<NoiSanXuat>) noiSanXuatDAO.getAllNoiSanXuat();
			return new ModelAndView("danh-muc-noi-san-xuat", "noiSanXuatList", noiSanXuatList);
		}
		if("manageNsx".equalsIgnoreCase(action)) {
			ArrayList<NoiSanXuat> noiSanXuatList =  (ArrayList<NoiSanXuat>) noiSanXuatDAO.getAllNoiSanXuat();
			return new ModelAndView("danh-muc-noi-san-xuat", "noiSanXuatList", noiSanXuatList);
		}
		return new ModelAndView("login");
	}
	
	@RequestMapping(value="/preEditNsx", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public NoiSanXuat preEditNsx(@RequestParam("nsxMa") String nsxMa) {
		System.out.println("****" + nsxMa + "****");
		NoiSanXuatDAO noiSanXuatDAO = new NoiSanXuatDAO();
		NoiSanXuat nsx = noiSanXuatDAO.getNoiSanXuat(nsxMa);
		return nsx;
	}
}
