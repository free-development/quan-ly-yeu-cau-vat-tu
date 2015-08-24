package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;import org.hibernate.type.descriptor.sql.VarbinaryTypeDescriptor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.CongVanDAO;
import dao.NguoiDungDAO;
import dao.NoiSanXuatDAO;
import dao.VTCongVanDAO;
import dao.VaiTroDAO;
import map.siteMap;
import model.CongVan;
import model.NguoiDung;
import model.NoiSanXuat;
import model.VTCongVan;
import model.VaiTro;
import util.JSonUtil;

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
			
			VTCongVanDAO vtCongVanDAO = new VTCongVanDAO();

			HashMap<String,NguoiDung> vtNguoiDungHash = vtCongVanDAO.getNguoiXuLy(cvId);
			HashMap<String, HashMap<Integer, VaiTro>> vaiTroHash = new HashMap<String, HashMap<Integer, VaiTro>>();
			for(String msnv : vtNguoiDungHash.keySet()) {
				ArrayList<VTCongVan> vtcvList = vtCongVanDAO.getVTCongVan(cvId, msnv);
				HashMap<Integer, VaiTro> vtHash = vtCongVanDAO.toVaiTro(vtcvList);
				vaiTroHash.put(msnv, vtHash);
			}
			
			request.setAttribute("vaiTroHash", vaiTroHash);
			request.setAttribute("vtNguoiDungHash", vtNguoiDungHash);
			
			session.setAttribute("vaiTroList", vaiTroList);
			session.setAttribute("nguoiDungList", nguoiDungList);
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
			VaiTroDAO vaiTroDAO =  new VaiTroDAO();
			
			//String[] msnv = new String[vaiTro.length];
			int cvId = congVan.getCvId();			
			
			for (String vtMa : vaiTro) {
				String[] str = vtMa.split("\\#");
				NguoiDung nguoiDung = nguoiDungDAO.getNguoiDung(str[0]);
				VTCongVan vtCongVan = new VTCongVan();
				vtCongVan.setCvId(cvId);
				vtCongVan.setMsnv(str[0]);
				vtCongVan.setVtId(Integer.parseInt(str[1]));
				vtCongVanDAO.addOrUpdateVTCongVan(vtCongVan);
			}
			
			
			HashMap<String,NguoiDung> vtNguoiDungHash = vtCongVanDAO.getNguoiXuLy(cvId);
			HashMap<String, HashMap<Integer, VaiTro>> vaiTroHash = new HashMap<String, HashMap<Integer, VaiTro>>();
			for(String msnv : vtNguoiDungHash.keySet()) {
				ArrayList<VTCongVan> vtcvList = vtCongVanDAO.getVTCongVan(cvId, msnv);
				HashMap<Integer, VaiTro> vtHash = vtCongVanDAO.toVaiTro(vtcvList);
				vaiTroHash.put(msnv, vtHash);
			}
			
			request.setAttribute("vaiTroHash", vaiTroHash);
			request.setAttribute("vtNguoiDungHash", vtNguoiDungHash);
			return new ModelAndView(siteMap.chiaSeCv);
		}
		return new ModelAndView("login");
	}
   @RequestMapping(value="/updateYeuCau", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String updateYeuCau(@RequestParam("msnvList") String msnvList) {
		System.out.println(msnvList);
			return JSonUtil.toJson(msnvList);
	}
   
}
