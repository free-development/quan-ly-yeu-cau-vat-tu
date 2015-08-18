package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import map.siteMap;
import model.CTVatTu;
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
	public ModelAndView manageBcvtt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	YeuCauDAO yeuCauDAO = new YeuCauDAO();
    	CTVatTuDAO ctVatTu = new CTVatTuDAO();
    	HttpSession session = request.getSession(false);
    	
    	String action = request.getParameter("action");
    	if("chitiet".equalsIgnoreCase(action)){
//    		String loaiBc = new String(action);
    		String ngaybd = request.getParameter("ngaybd");
    		String ngaykt = request.getParameter("ngaykt");
    			ArrayList<CongVan> congVanList = (ArrayList<CongVan>) new CongVanDAO().getTrangThai(DateUtil.parseDate(ngaybd), DateUtil.parseDate(ngaykt));
        		HashMap<Integer, ArrayList<YeuCau>> yeuCauHash = new HashMap<Integer, ArrayList<YeuCau>>();
        			for(CongVan congVan: congVanList){
        				int cvId = congVan.getCvId();
        				ArrayList<YeuCau> yeuCau = (ArrayList<YeuCau>) yeuCauDAO.getByCvId(cvId);
        				yeuCauHash.put(cvId,yeuCau);
        			}
        			session.setAttribute("ngaybd", DateUtil.parseDate(ngaybd));
        			session.setAttribute("ngaykt", DateUtil.parseDate(ngaykt));
        			session.setAttribute("action", action);
        			session.setAttribute("congVanList", congVanList);
        			session.setAttribute("yeuCau", yeuCauHash);
        			return new ModelAndView(siteMap.baoCaoVatTuThieu);
    		}
    	else if ("tonghop".equalsIgnoreCase(action)){
    		String ngaybd = request.getParameter("ngaybd");
    		String ngaykt = request.getParameter("ngaykt");
    		System.out.println(ngaybd);
    		System.out.println(ngaykt);
//    		ArrayList<CongVan> congVanList = (ArrayList<CongVan>) new CongVanDAO().getTrangThai(DateUtil.parseDate(ngaybd), DateUtil.parseDate(ngaykt));
    		HashMap<Integer, Integer> yeuCauHash = new HashMap<Integer, Integer>();
    		
//    			for(CongVan congVan: congVanList){
    		ArrayList<YeuCau> yeuCauList = (ArrayList<YeuCau>) yeuCauDAO.getVTThieu();
    		HashMap<Integer, CTVatTu> ctvtHash = new CTVatTuDAO().getHashMap();
    		for(YeuCau yeuCau: yeuCauList){
    				int ctVtId = yeuCau.getCtVatTu().getCtvtId();
    				Integer slCu = yeuCauHash.get(ctVtId);
    				Integer soluong = yeuCau.getYcSoLuong();
    				if (slCu != null)
    					soluong += slCu;
    				
    				yeuCauHash.put(ctVtId,soluong);
    			}
		    		session.setAttribute("ngaybd", DateUtil.parseDate(ngaybd));
					session.setAttribute("ngaykt", DateUtil.parseDate(ngaykt));
        			session.setAttribute("ctvtHash", ctvtHash);
        			session.setAttribute("action", action);
        			session.setAttribute("yeuCau", yeuCauHash);
        			return new ModelAndView(siteMap.baoCaoVatTuThieu);
    	}
    	else
    	  return new ModelAndView("login");
	}

}
