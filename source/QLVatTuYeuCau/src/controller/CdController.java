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
import model.NoiSanXuat;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import util.JSonUtil;
import dao.ChatLuongDAO;
import dao.ChucDanhDAO;
import dao.MucDichDAO;

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
	
	@RequestMapping(value="/preUpdateCd", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String preUpdateCd(@RequestParam("cdMa") String cdMa) {
		ChucDanhDAO chucDanhDAO = new ChucDanhDAO();
		ChucDanh cd = chucDanhDAO.getChucDanh(cdMa);
		return JSonUtil.toJson(cd);
	}
	
	@RequestMapping(value="/deleteCd", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String deleteCd(@RequestParam("cdMa") String cdMa) {
		new ChucDanhDAO().deleteChucDanh(new ChucDanhDAO().getChucDanh(cdMa));
		return JSonUtil.toJson(cdMa);
	}
	@RequestMapping(value="/addCd", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String addCd(@RequestParam("cdMa") String cdMa, @RequestParam("cdTen") String cdTen) {
		String result = "";
		System.out.println("MA: "+cdMa);
		if(new ChucDanhDAO().getChucDanh(cdMa)==null)
		{
			new ChucDanhDAO().addChucDanh(new ChucDanh(cdMa,cdTen));
			System.out.println("success");
			result = "success";
			
			
		}
		else
		{
			System.out.println("fail");
			result = "fail";
		}
			return JSonUtil.toJson(result);
	}
	
	@RequestMapping(value="/updateCd", method=RequestMethod.GET, 
	produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String updateCd(@RequestParam("cdMaUpdate") String cdMaUpdate, @RequestParam("cdTenUpdate") String cdTenUpdate) {
		System.out.println(cdMaUpdate);
		System.out.println(cdTenUpdate);
		ChucDanh cd = new ChucDanh(cdMaUpdate, cdTenUpdate);
		new ChucDanhDAO().updateChucDanh(cd);
		return JSonUtil.toJson(cd);
	}
}
