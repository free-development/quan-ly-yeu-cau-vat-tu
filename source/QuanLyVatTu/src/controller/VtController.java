package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DonVi;
import model.NoiSanXuat;
import model.VaiTro;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import util.JSonUtil;
import dao.NoiSanXuatDAO;
import dao.VaiTroDAO;


@Controller
public class VtController extends HttpServlet {
	private static final long serialVersionUvtId = 1L;
	@RequestMapping("/manageVt")
	public ModelAndView manageVt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VaiTroDAO vaiTroDAO = new VaiTroDAO();
		
		String action = request.getParameter("action");
		if("AddVaiTro".equalsIgnoreCase(action)) {
			int vtId = Integer.parseInt(request.getParameter("vtId"));
			String vtTen = request.getParameter("vtTen");
			if(vaiTroDAO.getVaiTro(vtId) != null){
				request.setAttribute("error", "Vai trò đã tồn tại");
//				request.setAttribute("vatTuList", vatTuList);
				return new ModelAndView("danh-muc-vai-tro");
			}
			else{
				vaiTroDAO.addVaiTro(new VaiTro(vtId,vtTen));
				ArrayList<VaiTro> vaiTroList =  (ArrayList<VaiTro>) vaiTroDAO.getAllVaiTro();
				return new ModelAndView("danh-muc-vai-tro", "vaiTroList", vaiTroList);
			}
			
		}
		if("deleteVaiTro".equalsIgnoreCase(action)) {
			String[] vtIdList = request.getParameterValues("vtId");
			for(String s : vtIdList) {
					vaiTroDAO.deleteVaiTro(vaiTroDAO.getVaiTro(Integer.parseInt(s)));
			}
			ArrayList<VaiTro> vaiTroList =  (ArrayList<VaiTro>) vaiTroDAO.getAllVaiTro();
			return new ModelAndView("danh-muc-vai-tro", "vaiTroList", vaiTroList);
		}
		if("manageVt".equalsIgnoreCase(action)) {
			ArrayList<VaiTro> vaiTroList =  (ArrayList<VaiTro>) vaiTroDAO.getAllVaiTro();
			return new ModelAndView("danh-muc-vai-tro", "vaiTroList", vaiTroList);
		}
		if("manageVt".equalsIgnoreCase(action)) {
			ArrayList<VaiTro> vaiTroList =  (ArrayList<VaiTro>) vaiTroDAO.getAllVaiTro();
			return new ModelAndView("danh-muc-vai-tro", "vaiTroList", vaiTroList);
		}
		return new ModelAndView("login");
	}
	@RequestMapping(value="/preEditVt", method=RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String preEditVt(@RequestParam("vtId") String vtId) {
			System.out.println("****" + vtId + "****");
			VaiTroDAO vaiTroDAO = new VaiTroDAO();
			VaiTro vt = vaiTroDAO.getVaiTro(Integer.parseInt(vtId));
			return JSonUtil.toJson(vt);
			/*ArrayList<NoiSanXuat> nsxList = (ArrayList<NoiSanXuat>) new NoiSanXuatDAO().getAllNoiSanXuat();
			return toJson(nsxList);*/
		}
//	@RequestMapping(value="/addVt", method=RequestMethod.GET, 
//			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
//	 public @ResponseBody String addVt(@RequestParam("vtId") int vtId, @RequestParam("vtTen") String vtTen) {
////		System.out.println("****" + vtId + "****");
//
//		VaiTro vt = new VaiTro(vtId, vtTen);
//		new VaiTroDAO().addVaiTro(vt);
//		return JSonUtil.toJson(vt);
//		
//	}
	@RequestMapping(value="/deleteVt", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String deleteVt(@RequestParam("vtId") String vtId) {
		new VaiTroDAO().deleteVaiTro(new VaiTroDAO().getVaiTro(Integer.parseInt(vtId)));
		return JSonUtil.toJson(vtId);
	}
}