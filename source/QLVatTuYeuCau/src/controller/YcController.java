package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.CTVatTuDAO;
import dao.ChatLuongDAO;
import dao.CongVanDAO;
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
	HttpSession session;   
	@RequestMapping("ycvtManage")
    public ModelAndView updateYeuCau(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	    	congVan
		session = request.getSession(false);
//		request.getn
		String[] s = request.getParameterValues("cvId");
		int cvId =  Integer.parseInt(s[0]);
		session.setAttribute("cvId", cvId);
    	CTVatTuDAO ctvtDAO =  new CTVatTuDAO();
    	YeuCauDAO yeuCauDAO = new YeuCauDAO();
    	NoiSanXuatDAO nsxDAO = new NoiSanXuatDAO();
    	ChatLuongDAO chatLuongDAO = new ChatLuongDAO();
    	
    	ArrayList<CTVatTu> ctVatTuList = (ArrayList<CTVatTu>) ctvtDAO.getAllCTVatTu();
    	ArrayList<YeuCau> yeuCauList = (ArrayList<YeuCau>) yeuCauDAO.getByCvId(cvId);
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
		int ctVatTuId = Integer.parseInt(ctvtId); 
		CTVatTu ctvt = ctvtDAO.getCTVatTuById(ctVatTuId);
		session.setAttribute("ctvtId", ctVatTuId);
		System.out.println("OK" + ctvtId);
		return JSonUtil.toJson(ctvt);
	}
	@RequestMapping(value="/addSoLuong", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String addSoLuong(@RequestParam("soLuong") String soLuong) {
		YeuCauDAO ycDAO = new YeuCauDAO();
		int cvId = (Integer) session.getAttribute("cvId");
		int ctvtId = (Integer) session.getAttribute("ctvtId");
		System.out.println(cvId);
		System.out.println(ctvtId);
		
		YeuCau yeuCau = ycDAO.addSoLuong(cvId, ctvtId, Integer.parseInt(soLuong));
		System.out.println(yeuCau.getCapSoLuong());
		return JSonUtil.toJson(yeuCau.getCtVatTu());
	}
	@RequestMapping(value="/deleteYc", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String deleteYc(@RequestParam("ycId") String ycId) {
		int id = Integer.parseInt(ycId);
		YeuCauDAO ycDAO = new YeuCauDAO();
		ycDAO.deleteYeuCau(id);
	//	return toJson(nsxList);
		return JSonUtil.toJson(ycId);
	}
}
