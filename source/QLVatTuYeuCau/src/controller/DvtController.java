package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import model.DonViTinh;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import util.JSonUtil;
import dao.DonViTinhDAO;


@Controller
public class DvtController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int page = 1;
	private String dvtOld = "";
	@RequestMapping("/manageDvt")
	public ModelAndView manageDvt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DonViTinhDAO donViTinhDAO = new DonViTinhDAO();
//		String dvtTen_cu = request.getParameter("dvtId");
		String action = request.getParameter("action");
		if("AddDonViTinh".equalsIgnoreCase(action)) {
			int dvtId = Integer.parseInt(request.getParameter("dvtId"));
			String dvtTen = request.getParameter("dvtTen");
			donViTinhDAO.addOrUpdateDonViTinh(new DonViTinh(dvtTen,0));
			
			ArrayList<DonViTinh> donViTinhList =  (ArrayList<DonViTinh>) donViTinhDAO.getAllDonViTinh();
			return new ModelAndView("danh-muc-don-vi-tinh", "donViTinhList", donViTinhList);
		}
		
		if("deleteDonViTinh".equalsIgnoreCase(action)) {
			String[] dvtIdList = request.getParameterValues("dvtId");
			for(String s : dvtIdList) {
				int dvtId = Integer.parseInt(s); 	
				donViTinhDAO.deleteDonViTinh(dvtId);
			}
			ArrayList<DonViTinh> donViTinhList =  (ArrayList<DonViTinh>) donViTinhDAO.getAllDonViTinh();
			return new ModelAndView("danh-muc-don-vi-tinh", "donViTinhList", donViTinhList);
		}
		if("manageDvt".equalsIgnoreCase(action)) {
			long size = donViTinhDAO.size();
			ArrayList<DonViTinh> donViTinhList =  (ArrayList<DonViTinh>) donViTinhDAO.limit(page - 1, 10);
			request.setAttribute("size", size);
			return new ModelAndView("danh-muc-don-vi-tinh", "donViTinhList", donViTinhList);
		}
		return new ModelAndView("login");
	}
	@RequestMapping(value="/preEditdvt", method=RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String preEditdvt(@RequestParam("dvtId") String dvt) {
			System.out.println("****" + dvt + "****");
			JOptionPane.showMessageDialog(null, dvt);
			dvtOld = dvt;
			//int dvtId = Integer.parseInt(dvt);
//			DonViTinhDAO donViTinhDAO = new DonViTinhDAO();
//			DonViTinh donViTinh = donViTinhDAO.getDonViTinhByTen(dvt);
			return JSonUtil.toJson(dvt);
		}
	@RequestMapping(value="/adddvt", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String adddvt(@RequestParam("dvtTen") String dvt) {
		String result = "";
		System.out.println("Ten: "+dvt);
//		int dvtId = Integer.parseInt(dvt);
		if(new DonViTinhDAO().getDonViTinhByTen(dvt)==null)
		{
			new DonViTinhDAO().addOrUpdateDonViTinh(new DonViTinh(dvt,0));
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
	@RequestMapping(value="/updatedvt", method=RequestMethod.GET, 
		produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String updatedvt(@RequestParam("dvtTenUpdate") String dvtTenUpdate) {
		JOptionPane.showMessageDialog(null, dvtOld);
		DonViTinh dvt = new DonViTinhDAO().getDonViTinhByTen(dvtOld);
		JOptionPane.showMessageDialog(null, dvt.getDvtTen() + dvt.getDvtId());
		dvt.setDvtTen(dvtTenUpdate);
		dvt.setDaXoa(0);
		new DonViTinhDAO().updateDonViTinh(dvt);
		return JSonUtil.toJson(dvt);
	}
	@RequestMapping(value="/deletedvt", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String deleteDvt(@RequestParam("dvtId") String dvtTen) {
		DonViTinhDAO donViTinhDAO = new DonViTinhDAO();
		DonViTinh donViTinh = donViTinhDAO.getDonViTinhByTen(dvtTen);
		new DonViTinhDAO().deleteDonViTinh(donViTinh.getDvtId());
		return JSonUtil.toJson(dvtTen);
	}
	@RequestMapping(value="/loadPagedvt", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String loadPageDvt(@RequestParam("pageNumber") String pageNumber) {
		System.out.println("MA: " + pageNumber);
		DonViTinhDAO dvtDAO = new DonViTinhDAO();
		int page = Integer.parseInt(pageNumber);
		ArrayList<DonViTinh> dvtList = (ArrayList<DonViTinh>) dvtDAO.limit((page -1 ) * 10, 10);
			return JSonUtil.toJson(dvtList);
	}
}