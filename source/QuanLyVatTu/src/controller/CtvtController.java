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

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
			
			if(vatTuDAO.getVatTu(vtMa) != null){
				request.setAttribute("error", "Vật tư đã tồn tại");

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
					//vatTuDAO.deleteVatTu(s);
			}
			ArrayList<VatTu> vatTuList =  (ArrayList<VatTu>) vatTuDAO.getAllVatTu();
			return new ModelAndView("danh-muc-vat-tu", "vatTuList", vatTuList);
		}
		
		return new ModelAndView("login");
	}

}
