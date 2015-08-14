package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import map.siteMap;
import model.ChucDanh;
import model.CongVan;
import model.DonVi;
import model.TrangThai;
import model.YeuCau;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import util.DateUtil;
import dao.CTVatTuDAO;
import dao.ChucDanhDAO;
import dao.CongVanDAO;
import dao.DonViDAO;
import dao.TrangThaiDAO;
import dao.VaiTroDAO;
import dao.YeuCauDAO;

@Controller
public class BcbdnController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @RequestMapping("/manageBcbdn")
	protected ModelAndView manageBcbdn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	DonViDAO donVi = new DonViDAO();
    	TrangThaiDAO trangThai = new TrangThaiDAO();
    	YeuCauDAO yeuCauDAO = new YeuCauDAO();
    	String action = request.getParameter("action");
		if ("manageBcbdn".equalsIgnoreCase(action)) {
			ArrayList<DonVi> donViList = (ArrayList<DonVi>) new DonViDAO().getAllDonVi();
			ArrayList<TrangThai> trangThaiList = (ArrayList<TrangThai>) new TrangThaiDAO().getAllTrangThai();
			request.setAttribute("trangThaiList", trangThaiList);
			return new ModelAndView("bao-cao-bang-de-nghi-cap-vat-tu","donViList", donViList);	
		}
    	if("baocaobdn".equalsIgnoreCase(action)){
    		ArrayList<TrangThai> trangThaiList = (ArrayList<TrangThai>) new TrangThaiDAO().getAllTrangThai();
    		ArrayList<DonVi> donViList = (ArrayList<DonVi>) new DonViDAO().getAllDonVi();
    		String ngaybd = request.getParameter("ngaybd");
    		String ngaykt = request.getParameter("ngaykt");
    		String donvi = request.getParameter("donvi");
    		String trangthai = request.getParameter("trangthai");
    		System.out.println(ngaybd);
    		System.out.println(ngaykt);
    		System.out.println(donvi);
    		System.out.println(trangthai);
    			ArrayList<CongVan> congVanList = (ArrayList<CongVan>) new CongVanDAO().getTrangThai(DateUtil.parseDate(ngaybd), DateUtil.parseDate(ngaykt),donvi,trangthai);
        		HashMap<Integer, ArrayList<YeuCau>> yeuCauHash = new HashMap<Integer, ArrayList<YeuCau>>();
        			for(CongVan congVan: congVanList){
        				int cvId = congVan.getCvId();
        				ArrayList<YeuCau> yeuCau = (ArrayList<YeuCau>) yeuCauDAO.getByCvId(cvId);
        				yeuCauHash.put(cvId,yeuCau);
        			}
        			request.setAttribute("donViList", donViList);
        			request.setAttribute("trangThaiList", trangThaiList);
        			request.setAttribute("congVanList", congVanList);
        			request.setAttribute("yeuCau", yeuCauHash);
    		return new ModelAndView(siteMap.baoCaoBangDeNghi);
    	}
    	  return new ModelAndView("login");
	}

}
