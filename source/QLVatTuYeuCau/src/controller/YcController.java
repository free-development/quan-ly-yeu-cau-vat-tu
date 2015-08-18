package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.CTVatTuDAO;
import dao.ChatLuongDAO;
import dao.NoiSanXuatDAO;
import dao.VaiTroDAO;
import dao.YeuCauDAO;
import map.siteMap;
import model.CTVatTu;
import model.ChatLuong;
import model.NoiSanXuat;
import model.VaiTro;
import model.VatTu;
import model.YeuCau;
import util.JSonUtil;

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
	@RequestMapping(value="/searchCtvt", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String searchCtvt(@RequestParam("vtMa") String vtMa, @RequestParam("vtTen") String vtTen, @RequestParam("nsx") String nsx, @RequestParam("chatLuong") String chatLuong) {
		CTVatTuDAO ctvtDAO = new CTVatTuDAO();
		System.out.println("************"+vtMa + vtTen + nsx + chatLuong +"*********");
		ArrayList<CTVatTu> ctVatTuList = ctvtDAO.search(vtMa, vtTen, nsx, chatLuong);
		System.out.println(ctVatTuList.size());
		return JSonUtil.toJson(ctVatTuList);
	}
	@RequestMapping(value="/preAddSoLuong", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String preAddSoLuong(@RequestParam("ctvtId") String ctvtId) {
		CTVatTuDAO ctvtDAO = new CTVatTuDAO();
		CTVatTu ctvt = ctvtDAO.getCTVatTuById(Integer.parseInt(ctvtId));
		System.out.println("OK" + ctvtId);
		return JSonUtil.toJson(ctvt);
	}
	
}
