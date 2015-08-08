package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CTNguoiDung;
import model.ChucDanh;
import model.DonVi;
import model.MucDich;
import model.NguoiDung;
import util.StringUtil;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.CTNguoiDungDAO;
import dao.ChucDanhDAO;
import dao.DonViDAO;
import dao.NguoiDungDAO;

/**
 * Servlet implementation class NdController
 */
@Controller
public class NdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@RequestMapping("/ndManage")
	public ModelAndView manageNd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();
		ChucDanhDAO chucDanhDAO = new ChucDanhDAO();
		CTNguoiDungDAO ctNguoiDungDAO = new CTNguoiDungDAO();
		String action = request.getParameter("action");
		if ("manageNd".equalsIgnoreCase(action)) {
			ArrayList<ChucDanh> chucDanhList = (ArrayList<ChucDanh>) new ChucDanhDAO().getAllChucDanh();
			return new ModelAndView("them-nguoi-dung","chucDanhList", chucDanhList);
		}
		if("AddNd".equalsIgnoreCase(action)) {
			String msnv = request.getParameter("msnv");
			String chucdanh = request.getParameter("chucdanh");
			String matkhau = request.getParameter("matkhau");
			String hoten = request.getParameter("hoten");
			String sdt = request.getParameter("sdt");
			String email = request.getParameter("email");
			String diachi = request.getParameter("diachi");
			nguoiDungDAO.addNguoiDung(new NguoiDung(msnv, hoten, diachi, email, sdt, new ChucDanh(chucdanh)));
			ctNguoiDungDAO.addCTNguoiDung(new CTNguoiDung(msnv, StringUtil.encryptMD5(matkhau)));
			
		}
		if("manageNd".equalsIgnoreCase(action)) {
			ArrayList<NguoiDung> nguoiDungList =  (ArrayList<NguoiDung>) nguoiDungDAO.getAllNguoiDung();
			return new ModelAndView("them-nguoi-dung", "nguoiDungList", nguoiDungList);
		}
		return new ModelAndView("login");
	}

}
