package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DonVi;
import model.NoiSanXuat;
import util.JSonUtil;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DonViDAO;
import dao.NoiSanXuatDAO;


@Controller
public class NsxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@RequestMapping("/manageNsx")
	public ModelAndView manageNsx(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoiSanXuatDAO noiSanXuatDAO = new NoiSanXuatDAO();
		request.getCharacterEncoding();
    	response.getCharacterEncoding();
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
		
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
	 public @ResponseBody String preEditNsx(@RequestParam("nsxMa") String nsxMa) {
//		System.out.println("****" + nsxMa + "****");
		System.out.println(nsxMa);
		NoiSanXuatDAO noiSanXuatDAO = new NoiSanXuatDAO();
		NoiSanXuat nsx = noiSanXuatDAO.getNoiSanXuat(nsxMa);
		System.out.println(nsx.getNsxMa());
		return JSonUtil.toJson(nsx);
		/*ArrayList<NoiSanXuat> nsxList = (ArrayList<NoiSanXuat>) new NoiSanXuatDAO().getAllNoiSanXuat();
		return toJson(nsxList);*/
	}
	@RequestMapping(value="/addNsx", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String addNsx(@RequestParam("nsxMa") String nsxMa, @RequestParam("nsxTen") String nsxTen) {
		String result = "";
		System.out.println("MA: "+nsxMa);
		if(new NoiSanXuatDAO().getNoiSanXuat(nsxMa)==null)
		{
			new NoiSanXuatDAO().addNoiSanXuat(new NoiSanXuat(nsxMa, nsxTen));
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
	@RequestMapping(value="/updateNsx", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String updateNsx(@RequestParam("nsxMaUpdate") String nsxMaUpdate, @RequestParam("nsxTenUpdate") String nsxTenUpdate) {

		System.out.println(nsxMaUpdate);
		System.out.println(nsxTenUpdate);
		NoiSanXuat nsx = new NoiSanXuat(nsxMaUpdate, nsxTenUpdate);
		new NoiSanXuatDAO().updateNoiSanXuat(nsx);
		return JSonUtil.toJson(nsx);
	}
	@RequestMapping(value="/deleteNsx", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String deleteNsx(@RequestParam("nsxMa") String nsxMa) {
//		System.out.println("****" + nsxMa + "****");
//		NoiSanXuatDAO noiSanXuatDAO = new NoiSanXuatDAO();
//		NoiSanXuat nsx = noiSanXuatDAO.getNoiSanXuat(nsxMa);
//		return toJson(nsx);
//		ArrayList<NoiSanXuat> nsxList = (ArrayList<NoiSanXuat>) new NoiSanXuatDAO().getAllNoiSanXuat();
		new NoiSanXuatDAO().deleteNoiSanXuat(new NoiSanXuatDAO().getNoiSanXuat(nsxMa));
//		return toJson(nsxList);
		return JSonUtil.toJson(nsxMa);
	}
	/*private String toJson(String nsxMa) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			String value = mapper.writeValueAsString(nsxMa);
			return value;
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return null;
		}
	}
	private String toJson(NoiSanXuat nsx) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			String value = mapper.writeValueAsString(nsx);
			return value;
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return null;
		}
	}
	private String toJson(ArrayList<NoiSanXuat> nsxList) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			String value = mapper.writeValueAsString(nsxList);
			return value;
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return null;
		}
	}*/
	
}
