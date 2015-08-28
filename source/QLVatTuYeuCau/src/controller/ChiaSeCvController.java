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
import javax.swing.JOptionPane;

import org.hibernate.type.descriptor.sql.VarbinaryTypeDescriptor;
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
	HttpSession session;
	HttpServletResponse res = null;
   @RequestMapping("/cscvManage")
	protected ModelAndView cscvManage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("chiaSeCv".equalsIgnoreCase(action)) {
			session = request.getSession(false);
			res = response;
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
			session = request.getSession(false);
			CongVan congVan = (CongVan) session.getAttribute("congVan");
			String[] vaiTro = request.getParameterValues("vaiTro");
			System.out.println(vaiTro.length);
			VTCongVanDAO vtCongVanDAO = new VTCongVanDAO();
			NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();
			VaiTroDAO vaiTroDAO =  new VaiTroDAO();
			
			//String[] msnv = new String[vaiTro.length];
			int cvId = congVan.getCvId();			
			vtCongVanDAO.deleteByCvId(cvId);
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
   @RequestMapping(value="/preUpdateYeuCau", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String preUpdateYeuCau(@RequestParam("msnv") String msnv) {
	   NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();
	   VTCongVanDAO vtCongVanDAO = new VTCongVanDAO();
	   VaiTroDAO vaiTroDAO = new VaiTroDAO();

	   CongVan congVan = (CongVan) session.getAttribute("congVan");
	   session.setAttribute("msnvUpdate", msnv);
	   //NguoiDung nguoiDung = nguoiDungDAO.getNguoiDung(msnv);
	   ArrayList<VaiTro> vaiTroList = (ArrayList<VaiTro>) vaiTroDAO.getAllVaiTro();
	   ArrayList<VTCongVan> vtCongVanList = vtCongVanDAO.getVTCongVan(congVan.getCvId(), msnv);
	   ArrayList<Object> objectList = new ArrayList<Object>(); 
	   objectList.add(msnv);
	   objectList.add(vaiTroList);
	   objectList.add(vtCongVanList);
			return JSonUtil.toJson(objectList);
	}
   
   @RequestMapping(value="/updateYeuCau", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String updateYeuCau(@RequestParam("vaiTroList") String vaiTroList) throws IOException {
	   NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();
	   VTCongVanDAO vtCongVanDAO = new VTCongVanDAO();
	   VaiTroDAO vaiTroDAO = new VaiTroDAO();
	   
	   CongVan congVan = (CongVan) session.getAttribute("congVan");
	   String msnvUpdate = (String) session.getAttribute("msnvUpdate");
	   int cvId = congVan.getCvId();
	   vtCongVanDAO.delete(cvId, msnvUpdate);
	   System.out.println(msnvUpdate);
	   if (msnvUpdate == null || congVan == null)
	   res.sendRedirect(siteMap.cvManage + "?action=manageCv");
//		   return JSonUtil.toJson("delete");
	   String[] vtList = vaiTroList.split("\\, ");
//	   StringBuilder str = new StringBuilder("");
	   ArrayList<Object> objectList = new ArrayList<Object>();
	   ArrayList<VaiTro> list = new ArrayList<VaiTro>();
	   if (vaiTroList.length() != 0) {
		   for (String s : vtList) {
			   int vtId = Integer.parseInt(s);
			   vtCongVanDAO.addVTCongVan(new VTCongVan(cvId, vtId, msnvUpdate));
			   //String vt = vtCongVanDAO.getVaiTro(vtId);
			   //str.append(vt + "<br>");
			   VaiTro vt = vaiTroDAO.getVaiTro(vtId);
//			   JOptionPane.showMessageDialog(null, vt.getVtTen());
			   list.add(vt);
		   }
	//	   str.delete(str.length()-4, 4);
	   }
	   objectList.add(list);
	   objectList.add(msnvUpdate);
//	   vtCongVanDAO.close();
	   nguoiDungDAO.close();
	   vaiTroDAO.close();
		return JSonUtil.toJson(objectList);
	}
}
