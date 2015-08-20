package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.CongVanDAO;
import dao.NguoiDungDAO;
import dao.VTCongVanDAO;
import dao.VaiTroDAO;
import map.siteMap;
import model.CongVan;
import model.NguoiDung;
import model.VTCongVan;
import model.VaiTro;

@Controller
@WebServlet("/ChiaSeCvController")
public class ChiaSeCvController extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	HttpSession session = null;
       
   @RequestMapping("/cscvManage")
	protected ModelAndView cscvManage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("chiaSeCv".equalsIgnoreCase(action)) {
			HttpSession session = request.getSession(false);
			String id = request.getParameter("congVan");	
			int cvId = Integer.parseInt(id);
			CongVanDAO congVanDAO =  new CongVanDAO(); 
			VaiTroDAO vaiTroDAO = new VaiTroDAO();
			NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();
			
			CongVan congVan = congVanDAO.getCongVan(cvId);
			ArrayList<VaiTro> vaiTroList = (ArrayList<VaiTro>) vaiTroDAO.getAllVaiTro();
			ArrayList<NguoiDung> nguoiDungList = (ArrayList<NguoiDung>) nguoiDungDAO.getAllNguoiDung();
			
			request.setAttribute("vaiTroList", vaiTroList);
			request.setAttribute("nguoiDungList", nguoiDungList);
			session.setAttribute("congVan", congVan);
			return new ModelAndView(siteMap.chiaSeCv);
		}
		return new ModelAndView("login");
	}
   @RequestMapping("/chiaSeCv")
	protected ModelAndView chiaSeCv(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("save".equalsIgnoreCase(action)) {
//			session = request.getSession(false);
			HttpSession session = request.getSession(false);
			CongVan congVan = (CongVan) session.getAttribute("congVan");
			String[] vaiTro = request.getParameterValues("vaiTro");
			System.out.println(vaiTro.length);
			VTCongVanDAO vtCongVanDAO = new VTCongVanDAO();
			NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();
			
			//String[] msnv = new String[vaiTro.length];
			HashMap<String, NguoiDung> msnvHash = new HashMap<String, NguoiDung>();
			int cvId = congVan.getCvId();			
			
			for (String vtMa : vaiTro) {
				String[] str = vtMa.split("\\#");
				NguoiDung nguoiDung = nguoiDungDAO.getNguoiDung(str[0]);
				msnvHash.put(str[0], nguoiDung);
				VTCongVan vtCongVan = new VTCongVan();
				vtCongVan.setCvId(cvId);
				vtCongVan.setMsnv(str[0]);
				vtCongVan.setVtId(Integer.parseInt(str[1]));
				vtCongVanDAO.addVTCongVan(vtCongVan);
			}
			
//			VaiTroDAO vaiTroDAO = new VaiTroDAO();
//			ArrayList<VaiTro> vaiTroList = (ArrayList<VaiTro>) vaiTroDAO.getAllVaiTro();
//			NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();
//			ArrayList<NguoiDung> nguoiDungList = (ArrayList<NguoiDung>) nguoiDungDAO.getAllNguoiDung();
//			request.setAttribute("vaiTroList", vaiTroList);
//			request.setAttribute("nguoiDungList", nguoiDungList);
//			return new ModelAndView(siteMap.chiaSeCv);
			VaiTroDAO vaiTroDAO = new VaiTroDAO();
			
//			VTCongVanDAO vtCongVanDAO = new VTCongVanDAO();
			
			ArrayList<VaiTro> vaiTroList = (ArrayList<VaiTro>) vaiTroDAO.getAllVaiTro();
			ArrayList<NguoiDung> nguoiDungList = (ArrayList<NguoiDung>) nguoiDungDAO.getAllNguoiDung();
			
			ArrayList<VTCongVan> vtcvList = vtCongVanDAO.getVTCongVan(cvId);
			
			request.setAttribute("vaiTroList", vaiTroList);
			request.setAttribute("nguoiDungList", nguoiDungList);
			session.setAttribute("congVan", congVan);
			
		}
		return new ModelAndView("login");
	}
}
