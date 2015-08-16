package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.CTVatTuDAO;
import dao.ChatLuongDAO;
import dao.NoiSanXuatDAO;
import dao.YeuCauDAO;
import map.siteMap;
import model.CTVatTu;
import model.ChatLuong;
import model.NoiSanXuat;
import model.YeuCau;

@Controller
public class YcController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@RequestMapping("ycvtManage")
    public ModelAndView updateYeuCau(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	    	congVan
    	CTVatTuDAO ctvtDAO =  new CTVatTuDAO();
    	YeuCauDAO yeuCauDAO = new YeuCauDAO();
    	NoiSanXuatDAO nsxDAO = new NoiSanXuatDAO();
    	ChatLuongDAO chatLuongDAO = new ChatLuongDAO();
    	
    	ArrayList<CTVatTu> ctVatTuList = (ArrayList<CTVatTu>) ctvtDAO.getAllCTVatTu();
    	ArrayList<YeuCau> yeuCauList = (ArrayList<YeuCau>) yeuCauDAO.getAllYeuCau();
    	ArrayList<NoiSanXuat> nsxList = (ArrayList<NoiSanXuat>) nsxDAO.getAllNoiSanXuat();
    	ArrayList<ChatLuong> chatLuongList = (ArrayList<ChatLuong>) chatLuongDAO.getAllChatLuong();
    	
    	request.setAttribute("ctVatTuList", ctVatTuList);
    	request.setAttribute("yeuCauList", yeuCauList);
    	request.setAttribute("nsxList", nsxList);
    	request.setAttribute("chatLuongList", chatLuongList);
    	return new ModelAndView(siteMap.ycVatTu);
    	//return new ModelAndView(siteMap.login);
    }

}
