package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

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
	private int page = 1;
	@RequestMapping("ycvtManage")
    public ModelAndView updateYeuCau(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	    	congVan
		session = request.getSession(false);
		
		String[] s = request.getParameterValues("cvId");
		if(s[0] == null)
			return new ModelAndView(siteMap.cvManage + "?action=manageCv");
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
		ArrayList<CTVatTu> ctVatTuList = ctvtDAO.search(vtMa, vtTen, nsx, chatLuong);
		return JSonUtil.toJson(ctVatTuList);
	}
	@RequestMapping(value="/preAddSoLuong", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String preAddSoLuong(@RequestParam("ctvtId") String ctvtId) {
		CTVatTuDAO ctvtDAO = new CTVatTuDAO();
		int ctVatTuId = Integer.parseInt(ctvtId); 
		CTVatTu ctvt = ctvtDAO.getCTVatTuById(ctVatTuId);
		session.setAttribute("ctvtId", ctVatTuId);
		return JSonUtil.toJson(ctvt);
	}
	@RequestMapping(value="/addSoLuong", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String addSoLuong(@RequestParam("soLuong") String soLuong) {
		YeuCauDAO ycDAO = new YeuCauDAO();
		int cvId = (Integer) session.getAttribute("cvId");
		int ctvtId = (Integer) session.getAttribute("ctvtId");
		int sl = Integer.parseInt(soLuong);
		YeuCau yeuCau = ycDAO.addSoLuong(cvId, ctvtId, sl);
//		JOptionPane.showMessageDialog(null,yeuCau.getCtVatTu().getVatTu().getVtMa());
		return JSonUtil.toJson(yeuCau);
	}
	@RequestMapping(value="/deleteYc", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String deleteYc(@RequestParam("ycList") String ycList) {
//		int id = Integer.parseInt(ycId);
		String[] ycIdList = ycList.split("\\, ");
		YeuCauDAO ycDAO = new YeuCauDAO();
		for (String s : ycIdList) {
			int id = Integer.parseInt(s);
			ycDAO.deleteYeuCau(id);
		}
		return JSonUtil.toJson("success");
	}
	@RequestMapping(value="/preUpdateYc", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String preUpdateYc(@RequestParam("yeuCau") String yeuCau) {
		int id = Integer.parseInt(yeuCau);
//		session.setAttribute("ycIdUpdate", id);
		YeuCauDAO ycDAO = new YeuCauDAO();
		YeuCau yc = ycDAO.getYeuCau(id);
		session.setAttribute("yeuCauUpdate", yc);
		return JSonUtil.toJson(yc); 
	}
	@RequestMapping(value="/updateSoLuong", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String updateSoLuong(@RequestParam("soLuong") String soLuong) {
		YeuCauDAO ycDAO = new YeuCauDAO();
		YeuCau yeuCau = (YeuCau) session.getAttribute("yeuCauUpdate");
		int sl = Integer.parseInt(soLuong);
		if (!ycDAO.checkUpdateSoLuong(yeuCau.getYcId(), sl))
			return JSonUtil.toJson("fail");
		yeuCau.setYcSoLuong(sl);
		new YeuCauDAO().updateYeuCau(yeuCau);
		return JSonUtil.toJson(yeuCau.getYcId());
	}
	@RequestMapping(value="/preCapVatTu", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String preCapVatTu(@RequestParam("yeuCau") String yeuCau) {
		int id = Integer.parseInt(yeuCau);
//		session.setAttribute("ycIdUpdate", id);
		YeuCauDAO ycDAO = new YeuCauDAO();
		YeuCau yc = ycDAO.getYeuCau(id);
		session.setAttribute("vatTuCap", yc);
		return JSonUtil.toJson(yc); 
	}
	@RequestMapping(value="/capVatTu", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String capVatTu(@RequestParam("soLuong") String soLuong) {
		YeuCauDAO ycDAO = new YeuCauDAO();
		YeuCau yeuCau = (YeuCau) session.getAttribute("vatTuCap");
		int sl = Integer.parseInt(soLuong);
		if (ycDAO.checkCapSoLuong(yeuCau.getYcId(), sl) < 0)
			return JSonUtil.toJson("fail");
//		yeuCau.setYcSoLuong(sl);
		ycDAO.capVatTu(yeuCau, sl);
		return JSonUtil.toJson(yeuCau);
	}
	@RequestMapping(value="/loadPageCtvtYc", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	 public @ResponseBody String loadPageCtvt(@RequestParam("pageNumber") String pageNumber) {
		String result = "";
		System.out.println("MA: " + pageNumber);
		CTVatTuDAO ctvtDAO = new CTVatTuDAO();
		int page = Integer.parseInt(pageNumber);
		ArrayList<CTVatTu> ctvtList = (ArrayList<CTVatTu>) ctvtDAO.limit((page -1 ) * 10, 10);
		
		/*
		if(new NoiSanXuatDAO().getNoiSanXuat(nsxMa)==null)
		{
			new NoiSanXuatDAO().addNoiSanXuat(new NoiSanXuat(nsxMa, nsxTen,0));
			System.out.println("success");
			result = "success";	
		}
		else
		{
			System.out.println("fail");
			result = "fail";
		}
		*/
			return JSonUtil.toJson(ctvtList);
	}
	@RequestMapping(value="/searchCtvtYc", method=RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String searchCtvtYc(@RequestParam("vtMa") String vtMa, @RequestParam("vtTen") String vtTen) {
		CTVatTuDAO ctvtDAO = new CTVatTuDAO();
//		ArrayList<Object> objectList = new ArrayList<Object>();
		if(vtMa != ""){
			long size = ctvtDAO.sizeOfSearchCtvtMa(vtMa); 
			ArrayList<CTVatTu> ctvtList = ctvtDAO.searchByCtvtMaLimit(vtMa, page - 1, 5);
//			objectList.add(ctvtList);
//			bjectList.add(size);
			JOptionPane.showMessageDialog(null, ctvtList.size());
			return JSonUtil.toJson(ctvtList);
		}
		else
		{
			long size = ctvtDAO.sizeOfSearchCtvtTen(vtTen); 
			ArrayList<CTVatTu> ctvtList = ctvtDAO.searchByCtvtTenLimit(vtTen, page - 1, 5);
//			objectList.add(ctvtList);
//			objectList.add(size);
			return JSonUtil.toJson(ctvtList);
		}
		
		/*return JSonUtil.toJson(objectList);*/
	}
}
