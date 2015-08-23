package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import map.siteMap;
import model.ChatLuong;
import model.ChucDanh;
import model.CongVan;
import model.DonVi;
import model.TrangThai;
import model.YeuCau;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import util.DateUtil;
import util.JSonUtil;
import dao.CTVatTuDAO;
import dao.ChatLuongDAO;
import dao.ChucDanhDAO;
import dao.CongVanDAO;
import dao.DonViDAO;
import dao.TrangThaiDAO;
import dao.VaiTroDAO;
import dao.YeuCauDAO;

@Controller
public class BcbdnController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int page = 1;
    @RequestMapping("/manageBcbdn")
	protected ModelAndView manageBcbdn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	DonViDAO donVi = new DonViDAO();
    	TrangThaiDAO trangThai = new TrangThaiDAO();
    	YeuCauDAO yeuCauDAO = new YeuCauDAO();
    	String action = request.getParameter("action");
    	
		if ("manageBcbdn".equalsIgnoreCase(action)) {
			ArrayList<TrangThai> trangThaiList = (ArrayList<TrangThai>) new TrangThaiDAO().getAllTrangThai();
    		ArrayList<DonVi> donViList = (ArrayList<DonVi>) new DonViDAO().getAllDonVi();
			ArrayList<CongVan> congVanList = (ArrayList<CongVan>) new CongVanDAO().getAllCongVan();
    		HashMap<Integer, ArrayList<YeuCau>> yeuCauHash = new HashMap<Integer, ArrayList<YeuCau>>();
    			for(CongVan congVan: congVanList){
    				int cvId = congVan.getCvId();
    				ArrayList<YeuCau> yeuCau = (ArrayList<YeuCau>) yeuCauDAO.limitByIdCv(cvId, (page - 1) * 10, 10);
    				yeuCauHash.put(cvId,yeuCau);
    			}
    			long size = yeuCauDAO.size(congVanList);
//    			ArrayList<YeuCau> yeuCauList =  (ArrayList<YeuCau>) yeuCauDAO.limit(page, 10);
    			request.setAttribute("size", size);
    			session.setAttribute("donViList", donViList);
    			session.setAttribute("trangThaiList", trangThaiList);
    			session.setAttribute("congVanList", congVanList);
    			session.setAttribute("yeuCau", yeuCauHash);
		return new ModelAndView(siteMap.baoCaoBangDeNghi);
		}
    	if("baocaobdn".equalsIgnoreCase(action)){
    		ArrayList<TrangThai> trangThaiList = (ArrayList<TrangThai>) new TrangThaiDAO().getAllTrangThai();
    		ArrayList<DonVi> donViList = (ArrayList<DonVi>) new DonViDAO().getAllDonVi();
    		String ngaybd = request.getParameter("ngaybd");
    		String ngaykt = request.getParameter("ngaykt");
    		String donvi = request.getParameter("donvi");
    		String trangthai = request.getParameter("trangthai");
    		System.out.println(ngaykt);
    		System.out.println(donvi);
    		System.out.println(trangthai);
    			ArrayList<CongVan> congVanList = (ArrayList<CongVan>) new CongVanDAO().getTrangThai(ngaybd, ngaykt,donvi,trangthai);
        		HashMap<Integer, ArrayList<YeuCau>> yeuCauHash = new HashMap<Integer, ArrayList<YeuCau>>();
        			for(CongVan congVan: congVanList){
        				int cvId = congVan.getCvId();
        				ArrayList<YeuCau> yeuCau = (ArrayList<YeuCau>) yeuCauDAO.limitByIdCv(cvId, (page -1 ) * 10, 10);
        				yeuCauHash.put(cvId,yeuCau);
        			}
        			long size = yeuCauDAO.size(congVanList);
        			request.setAttribute("size", size);
        			session.setAttribute("ngaybd", DateUtil.parseDate(ngaybd));
        			session.setAttribute("ngaykt", DateUtil.parseDate(ngaykt));
        			session.setAttribute("donViList", donViList);
        			session.setAttribute("trangThai	List", trangThaiList);
        			session.setAttribute("congVanList", congVanList);
        			session.setAttribute("yeuCau", yeuCauHash);
        			
    		return new ModelAndView(siteMap.baoCaoBangDeNghi);
    	}
    	  return new ModelAndView("login");
	}
    /*
    @RequestMapping(value="/loadPageBcbdn", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String loadPageBcbdn(@RequestParam("pageNumber") String pageNumber) {
		String result = "";
		System.out.println("MA: " + pageNumber);
		YeuCauDAO ycDAO = new YeuCauDAO();
		int page = Integer.parseInt(pageNumber);
		ArrayList<YeuCau> ycList = (ArrayList<YeuCau>) ycDAO.limit((page -1 ) * 10, 10);
		
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
//			return JSonUtil.toJson(ycList);
//	}
}
