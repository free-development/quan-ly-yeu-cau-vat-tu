package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import map.siteMap;
import model.CongVan;
import model.YeuCau;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import util.DateUtil;
import dao.CTVatTuDAO;
import dao.CongVanDAO;
import dao.YeuCauDAO;
import util.DateUtil;

@Controller
public class BcvttController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @RequestMapping("/manageBcvtt")
	protected ModelAndView manageBcvtt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	YeuCauDAO yeuCauDAO = new YeuCauDAO();
    	CTVatTuDAO ctVatTu = new CTVatTuDAO();
    	
    	String action = request.getParameter("action");
    	if("chitiet".equalsIgnoreCase(action)){
    		String loaiBc = new String("chitiet");
    		String ngaybd = request.getParameter("ngaybd");
    		String ngaykt = request.getParameter("ngaykt");
    		System.out.println(ngaybd);
    		System.out.println(ngaykt);
    			ArrayList<CongVan> congVanList = (ArrayList<CongVan>) new CongVanDAO().getTrangThai(DateUtil.parseDate(ngaybd), DateUtil.parseDate(ngaykt));
        		HashMap<Integer, ArrayList<YeuCau>> yeuCauHash = new HashMap<Integer, ArrayList<YeuCau>>();
        			for(CongVan congVan: congVanList){
        				int cvId = congVan.getCvId();
        				ArrayList<YeuCau> yeuCau = (ArrayList<YeuCau>) yeuCauDAO.getByCvId(cvId);
        				yeuCauHash.put(cvId,yeuCau);
        			}
        			request.setAttribute("loaiBc", loaiBc);
        			request.setAttribute("congVanList", congVanList);
        			request.setAttribute("yeuCau", yeuCauHash);
        			return new ModelAndView(siteMap.baoCaoVatTuThieu);
    		}
    	if("tonghop".equalsIgnoreCase(action)){
    		String loaiBc = new String("tonghop");
    		String ngaybd = request.getParameter("ngaybd");
    		String ngaykt = request.getParameter("ngaykt");
    		System.out.println(ngaybd);
    		System.out.println(ngaykt);
    			ArrayList<CongVan> congVanList = (ArrayList<CongVan>) new CongVanDAO().getTrangThai(DateUtil.parseDate(ngaybd), DateUtil.parseDate(ngaykt));
        		HashMap<Integer, ArrayList<YeuCau>> yeuCauHash = new HashMap<Integer, ArrayList<YeuCau>>();
        			for(CongVan congVan: congVanList){
        				int cvId = congVan.getCvId();
        				ArrayList<YeuCau> yeuCau = (ArrayList<YeuCau>) yeuCauDAO.getByCvId(cvId);
        				yeuCauHash.put(cvId,yeuCau);
        			}
        			request.setAttribute("loaiBc", loaiBc);
        			request.setAttribute("congVanList", congVanList);
        			request.setAttribute("yeuCau", yeuCauHash);
        			return new ModelAndView(siteMap.baoCaoVatTuThieu);
    	}
    	  return new ModelAndView("login");
	}

}
