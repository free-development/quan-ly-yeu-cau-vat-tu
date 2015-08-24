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
	int page = 1;
	@RequestMapping("/manageMd")
	public ModelAndView manageMd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MucDichDAO mucDichDAO = new MucDichDAO();
		String action = request.getParameter("action");
		if("AddMd".equalsIgnoreCase(action)) {
			String mdMa = request.getParameter("mdMa");
			String mdTen = request.getParameter("mdTen");
			if(new MucDichDAO().getMucDich1(mdMa)!=0)
			{
				request.setAttribute("error","Mục đích đã tồn tại");
				System.out.println("Mục đích đã tồn tại");
				return new ModelAndView("danh-muc-muc-dich");
			}
			else
			{
			mucDichDAO.addMucDich(new MucDich(mdMa,mdTen,0));
			ArrayList<MucDich> mucDichList =  (ArrayList<MucDich>) mucDichDAO.getAllMucDich();
			return new ModelAndView("danh-muc-muc-dich", "mucDichList", mucDichList);
			}
		}
		if("deleteMd".equalsIgnoreCase(action)) {
			String[] idList = request.getParameterValues("mdMa");
			for(String s : idList) {
					mucDichDAO.deleteMucDich(s);
			}
			
			ArrayList<MucDich> mucDichList =  (ArrayList<MucDich>) mucDichDAO.getAllMucDich();
			return new ModelAndView("danh-muc-muc-dich", "mucDichList", mucDichList);
		}
		if("manageMd".equalsIgnoreCase(action)) {
			long size = mucDichDAO.size();
			ArrayList<MucDich> mucDichList =  (ArrayList<MucDich>) mucDichDAO.limit(page, 10);
			request.setAttribute("size", size);
			return new ModelAndView("danh-muc-muc-dich", "mucDichList", mucDichList);
		}
		return new ModelAndView("login");
	}
	@RequestMapping(value="/preUpdateMd", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String preUpdateMd(@RequestParam("mdMa") String mdMa) {
		MucDichDAO mucDichDAO = new MucDichDAO();
		MucDich md = mucDichDAO.getMucDich(mdMa);
		//System.out.println("****" + clMa + "****");
		return JSonUtil.toJson(md);
	}
	@RequestMapping(value="/deleteMd", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String deleteMd(@RequestParam("mdMa") String mdMa) {
		new MucDichDAO().deleteMucDich(mdMa);
		return JSonUtil.toJson(mdMa);
	}
	
	
	@RequestMapping(value="/addMd", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String addMd(@RequestParam("mdMa") String mdMa, @RequestParam("mdTen") String mdTen) {
		String result = "";
		System.out.println("MA: "+mdMa);
		if(new MucDichDAO().getMucDich(mdMa)==null)
		{
			new MucDichDAO().addMucDich(new MucDich(mdMa,mdTen,0));
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
	
	@RequestMapping(value="/updateMd", method=RequestMethod.GET, 
	produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String updateMd(@RequestParam("mdMaUpdate") String mdMaUpdate, @RequestParam("mdTenUpdate") String mdTenUpdate) {
		System.out.println(mdMaUpdate);
		System.out.println(mdTenUpdate);
		MucDich md = new MucDich(mdMaUpdate, mdTenUpdate,0);
		new MucDichDAO().updateMucDich(md);
		return JSonUtil.toJson(md);
	}
	@RequestMapping(value="/loadPageMd", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String loadPageMd(@RequestParam("pageNumber") String pageNumber) {
		String result = "";
		System.out.println("MA: " + pageNumber);
		MucDichDAO mdDAO = new MucDichDAO();
		int page = Integer.parseInt(pageNumber);
		ArrayList<MucDich> mdList = (ArrayList<MucDich>) mdDAO.limit((page -1 ) * 10, 10);
		
		/*
		if(new NoiSanXuatDAO().getNoiSanXuat(nsxMa)==null)
		{
			new NoiSanXuatDAO().addNoiSanXuat(new NoiSanXuat(nsxMa, nsxTen,0));
			System.out.println("success");
			result = "success";	
		}
		else
		{
			System.out.println("fail");
			result = "fail";
		}
		*/
			return JSonUtil.toJson(mdList);
	}
}
