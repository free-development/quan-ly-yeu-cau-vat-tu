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
import model.NguoiDung;

import org.springframework.web.servlet.ModelAndView;

import dao.CTNguoiDungDAO;
import dao.ChucDanhDAO;
import dao.DonViDAO;
import dao.NguoiDungDAO;

/**
 * Servlet implementation class NdController
 */
@WebServlet("/NdController")
public class NdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ModelAndView manageNd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();
		ChucDanhDAO chucDanhDAO = new ChucDanhDAO();
		CTNguoiDungDAO ctNguoiDungDAO = new CTNguoiDungDAO();
		String action = request.getParameter("action");
		if("AddNd".equalsIgnoreCase(action)) {
			String msnv = request.getParameter("msnv");
			ChucDanh chucdanh = chucDanhDAO.getChucDanh("chucdanh");
			String matkhau = request.getParameter("matkhau");
			String hoten = request.getParameter("hoten");
			String sdt = request.getParameter("sdt");
			String email = request.getParameter("email");
			String diachi = request.getParameter("diachi");
			nguoiDungDAO.addNguoiDung(new NguoiDung(msnv, hoten, email, diachi, sdt, chucdanh));
			ctNguoiDungDAO.addCTNguoiDung(new CTNguoiDung(msnv,matkhau));
			
			ArrayList<NguoiDung> nguoiDungList =  (ArrayList<NguoiDung>) nguoiDungDAO.getAllNguoiDung();
			ArrayList<ChucDanh> chucDanhList =  (ArrayList<ChucDanh>) chucDanhDAO.getAllChucDanh();
			ArrayList<CTNguoiDung> ctNguoiDungList =  (ArrayList<CTNguoiDung>) ctNguoiDungDAO.getAllCTNguoiDung();
			//return new ModelAndView("quan-ly-nguoi-dung", "nguoiDungList", nguoiDungList);
			//return new ModelAndView("quan-ly-nguoi-dung", "ctNguoiDungList", ctNguoiDungList);
			return new ModelAndView("quan-ly-nguoi-dung", "chucDanhList", chucDanhList);
		}
		return new ModelAndView("login");
	}

}
