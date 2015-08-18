package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CTVatTu;
import model.ChatLuong;
import model.NoiSanXuat;
import model.VatTu;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import util.JSonUtil;
import dao.VatTuDAO;
import dao.CTVatTuDAO;

@Controller
public class CtvtController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   @RequestMapping("/manageCtvt")
	protected ModelAndView manageCtvt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VatTuDAO vatTuDAO = new VatTuDAO();
		CTVatTuDAO ctVatTuDAO = new CTVatTuDAO();
		
		String action = request.getParameter("action");
		if("addVatTu".equalsIgnoreCase(action)) {
			
			String vtMa = request.getParameter("vtMa");
			String vtTen = request.getParameter("vtTen");
			String dvt = request.getParameter("dvt");
			String nsxMa = request.getParameter("nsxMa");
			String clMa = request.getParameter("clMa");
			int dinhMuc = Integer.parseInt(request.getParameter("dinhMuc"));
			int soLuongTon = Integer.parseInt(request.getParameter("soLuongTon"));
//			if (new CTVatTuDAO().getCTVatTu(vtMa, nsxMa, clMa) != null)
//				System.out.println("Vat tu da ton tai");
			if(new CTVatTuDAO().getCTVatTu(vtMa, nsxMa, clMa) != null){
//			if(false){
				request.setAttribute("error", "Váº­t tÆ° Ä‘Ã£ tá»“n táº¡i");
				System.out.println("Vat tu da ton tai");
				return new ModelAndView("danh-muc-vat-tu");
			}
			else{
				vatTuDAO.addVatTu(new VatTu(vtMa,vtTen,dvt));
				ctVatTuDAO.addCTVatTu(new CTVatTu(new VatTu(vtMa,vtTen,dvt), new NoiSanXuat(nsxMa), new ChatLuong(clMa), dinhMuc, soLuongTon));
				ArrayList<VatTu> vatTuList =  (ArrayList<VatTu>) new VatTuDAO().getAllVatTu();
				ArrayList<CTVatTu> ctVatTuList =  (ArrayList<CTVatTu>) new CTVatTuDAO().getAllCTVatTu();
				return new ModelAndView("danh-muc-vat-tu", "ctVatTuList", ctVatTuList);
			}
			
		}
		if("deleteVatTu".equalsIgnoreCase(action)) {
			String[] vtIdList = request.getParameterValues("vtMa");
			for(String s : vtIdList) {
				
					ctVatTuDAO.deleteCTVatTu(ctVatTuDAO.getCTVatTu(s));
			}
			ArrayList<VatTu> vatTuList =  (ArrayList<VatTu>) vatTuDAO.getAllVatTu();
			return new ModelAndView("danh-muc-vat-tu", "vatTuList", vatTuList);
		}
		if("manageCtvt".equalsIgnoreCase(action)) {
			ArrayList<VatTu> vatTuList =  (ArrayList<VatTu>) new VatTuDAO().getAllVatTu();
			ArrayList<CTVatTu> ctVatTuList =  (ArrayList<CTVatTu>) new CTVatTuDAO().getAllCTVatTu();
			return new ModelAndView("danh-muc-vat-tu", "ctVatTuList", ctVatTuList);
		}
		return new ModelAndView("login");
	}
   @RequestMapping(value="/showCTVatTu", method=RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String showCTVatTu(@RequestParam("vtMa")  String vtMa) {
			
			CTVatTuDAO ctVatTuDAO = new CTVatTuDAO();
			ArrayList<CTVatTu> listCTVatTu = (ArrayList<CTVatTu>) ctVatTuDAO.getCTVTu(vtMa);
			System.out.println(listCTVatTu.get(0).getVatTu().getVtTen());
			return JSonUtil.toJson(listCTVatTu);
		}

}
